import 'dart:convert';

import 'package:drift/drift.dart';

import '../level/cefr.dart';
import 'app_database.dart';

const seedAssetVersion = 1;

extension UlagamStore on AppDatabase {
  Stream<LearnerProfile> watchProfile() {
    return (select(learnerProfiles)..where((row) => row.id.equals(1))).watchSingle();
  }

  Future<LearnerProfile> readProfile() {
    return (select(learnerProfiles)..where((row) => row.id.equals(1))).getSingle();
  }

  Future<void> seedFromAsset(String jsonText) async {
    final current = await (select(learnerProfiles)..where((row) => row.id.equals(1)))
        .getSingleOrNull();
    if (current != null && current.seedVersion >= seedAssetVersion) return;

    final data = jsonDecode(jsonText) as Map<String, dynamic>;
    final categories = (data['categories'] as List).cast<Map<String, dynamic>>();
    final words = (data['words'] as List).cast<Map<String, dynamic>>();

    await transaction(() async {
      if (current == null) {
        await into(learnerProfiles).insert(
          LearnerProfilesCompanion.insert(
            id: const Value(1),
            cefr: const Value('A2'),
            seedVersion: const Value(seedAssetVersion),
          ),
        );
      } else {
        await (update(learnerProfiles)..where((row) => row.id.equals(1))).write(
          const LearnerProfilesCompanion(seedVersion: Value(seedAssetVersion)),
        );
      }

      await batch((batch) {
        batch.insertAll(
          wordCategories,
          categories.map((category) {
            return WordCategoriesCompanion.insert(
              id: category['id'] as String,
              nameEn: category['nameEn'] as String,
              nameTa: category['nameTa'] as String,
              emoji: category['emoji'] as String,
              sortOrder: category['sort'] as int,
            );
          }),
          mode: InsertMode.insertOrIgnore,
        );
      });

      const chunk = 200;
      for (var start = 0; start < words.length; start += chunk) {
        final slice = words.skip(start).take(chunk);
        await batch((batch) {
          batch.insertAll(
            wordEntries,
            slice.map(_wordCompanion),
            mode: InsertMode.insertOrIgnore,
          );
        });
        final examples = <WordExamplesCompanion>[];
        for (final word in slice) {
          final id = word['id'] as String;
          for (final example in (word['examples'] as List).cast<Map<String, dynamic>>()) {
            examples.add(
              WordExamplesCompanion.insert(
                wordId: id,
                kind: example['kind'] as String,
                english: example['english'] as String,
                tamil: example['tamil'] as String,
              ),
            );
          }
        }
        await batch((batch) {
          batch.insertAll(wordExamples, examples);
        });
      }
    });
  }

  Future<List<WordCategory>> categories() {
    return (select(wordCategories)..orderBy([(row) => OrderingTerm.asc(row.sortOrder)])).get();
  }

  Future<int> wordCount(String categoryId, String targetLang) async {
    final count = wordEntries.id.count();
    final query = selectOnly(wordEntries)
      ..addColumns([count])
      ..where(
        wordEntries.categoryId.equals(categoryId) &
            wordEntries.targetLang.equals(targetLang),
      );
    final row = await query.getSingle();
    return row.read(count) ?? 0;
  }

  Future<List<WordEntry>> wordsFor({
    required String categoryId,
    required String targetLang,
  }) {
    return (select(wordEntries)
          ..where(
            (row) =>
                row.categoryId.equals(categoryId) & row.targetLang.equals(targetLang),
          )
          ..orderBy([(row) => OrderingTerm.asc(row.english)]))
        .get();
  }

  Future<List<WordEntry>> searchWords(String query, String targetLang) {
    final needle = query.trim();
    return (select(wordEntries)
          ..where(
            (row) =>
                row.targetLang.equals(targetLang) &
                (row.english.contains(needle) |
                    row.tamil.contains(needle) |
                    row.transliteration.contains(needle)),
          )
          ..orderBy([(row) => OrderingTerm.asc(row.english)])
          ..limit(80))
        .get();
  }

  Future<List<WordEntry>> savedWords(String targetLang) {
    return (select(wordEntries)
          ..where((row) => row.saved.equals(true) & row.targetLang.equals(targetLang))
          ..orderBy([(row) => OrderingTerm.asc(row.english)]))
        .get();
  }

  Future<WordEntry> wordById(String id) {
    return (select(wordEntries)..where((row) => row.id.equals(id))).getSingle();
  }

  Future<List<WordExample>> examplesFor(String wordId) {
    return (select(wordExamples)..where((row) => row.wordId.equals(wordId))).get();
  }

  Future<void> setSaved(String wordId, bool saved) async {
    await (update(wordEntries)..where((row) => row.id.equals(wordId))).write(
      WordEntriesCompanion(saved: Value(saved)),
    );
    if (saved) {
      await into(reviewStates).insert(
        ReviewStatesCompanion.insert(wordId: wordId, dueAt: DateTime.now()),
        mode: InsertMode.insertOrIgnore,
      );
    }
  }

  Future<void> setImagePath(String wordId, String path) {
    return (update(wordEntries)..where((row) => row.id.equals(wordId))).write(
      WordEntriesCompanion(imagePath: Value(path)),
    );
  }

  Future<void> setAudioPath(String wordId, String path) {
    return (update(wordEntries)..where((row) => row.id.equals(wordId))).write(
      WordEntriesCompanion(audioPath: Value(path)),
    );
  }

  Future<void> updateProfile({
    String? cefr,
    String? targetLang,
    String? themeMode,
    bool? placementDone,
  }) {
    return (update(learnerProfiles)..where((row) => row.id.equals(1))).write(
      LearnerProfilesCompanion(
        cefr: cefr == null ? const Value.absent() : Value(cefr),
        targetLang: targetLang == null ? const Value.absent() : Value(targetLang),
        themeMode: themeMode == null ? const Value.absent() : Value(themeMode),
        placementDone: placementDone == null
            ? const Value.absent()
            : Value(placementDone),
      ),
    );
  }

  Future<List<String>> englishInCategory(String categoryId, String targetLang) async {
    final rows = await wordsFor(categoryId: categoryId, targetLang: targetLang);
    return rows.map((row) => row.english).toList();
  }

  Future<void> insertDrafts({
    required String categoryId,
    required String targetLang,
    required List<({
      String english,
      String tamil,
      String transliteration,
      String ipa,
      String pronunciation,
      String partOfSpeech,
      String cefr,
      String? emoji,
      String simpleEnglish,
      String simpleTamil,
      String naturalEnglish,
      String naturalTamil,
      String usageNote,
      String commonMistakes,
      String? britishNote,
      String? dutchNote,
    })> drafts,
  }) async {
    final existing = await englishInCategory(categoryId, targetLang);
    final known = existing.map((word) => word.toLowerCase()).toSet();
    await transaction(() async {
      for (final draft in drafts) {
        if (known.contains(draft.english.toLowerCase())) continue;
        final id = _idFor(targetLang, categoryId, draft.english);
        await into(wordEntries).insert(
          WordEntriesCompanion.insert(
            id: id,
            categoryId: categoryId,
            targetLang: Value(targetLang),
            tamil: draft.tamil,
            transliteration: draft.transliteration,
            english: draft.english,
            ipa: draft.ipa.startsWith('/') ? draft.ipa : '/${draft.ipa}/',
            pronunciation: draft.pronunciation,
            partOfSpeech: draft.partOfSpeech,
            cefr: CefrLevel.parse(draft.cefr).code,
            emoji: Value(draft.emoji),
            usageNote: Value(draft.usageNote),
            commonMistakes: Value(draft.commonMistakes),
            britishNote: Value(draft.britishNote),
            dutchNote: Value(draft.dutchNote),
            origin: const Value('ai'),
          ),
          mode: InsertMode.insertOrIgnore,
        );
        await into(wordExamples).insert(
          WordExamplesCompanion.insert(
            wordId: id,
            kind: 'simple',
            english: draft.simpleEnglish,
            tamil: draft.simpleTamil,
          ),
        );
        await into(wordExamples).insert(
          WordExamplesCompanion.insert(
            wordId: id,
            kind: 'natural',
            english: draft.naturalEnglish,
            tamil: draft.naturalTamil,
          ),
        );
        known.add(draft.english.toLowerCase());
      }
    });
  }

  Future<int> restoreSavedFlags(List<Map<String, dynamic>> words) async {
    var updated = 0;
    await transaction(() async {
      for (final word in words) {
        final id = word['id'] as String?;
        if (id == null) continue;
        final saved = word['saved'] == true;
        final written = await (update(wordEntries)..where((row) => row.id.equals(id))).write(
          WordEntriesCompanion(saved: Value(saved)),
        );
        if (written > 0 && saved) {
          updated++;
          await into(reviewStates).insert(
            ReviewStatesCompanion.insert(wordId: id, dueAt: DateTime.now()),
            mode: InsertMode.insertOrIgnore,
          );
        }
      }
    });
    return updated;
  }

  Future<String> exportBackup() async {
    final profile = await readProfile();
    final words = await select(wordEntries).get();
    final examples = await select(wordExamples).get();
    final reviews = await select(reviewStates).get();
    return jsonEncode({
      'app': 'ulagam',
      'exportedAt': DateTime.now().toIso8601String(),
      'profile': {
        'cefr': profile.cefr,
        'targetLang': profile.targetLang,
        'themeMode': profile.themeMode,
        'placementDone': profile.placementDone,
      },
      'words': words.map((word) => word.toJson()).toList(),
      'examples': examples.map((example) => example.toJson()).toList(),
      'reviews': reviews
          .map(
            (review) => {
              'wordId': review.wordId,
              'ease': review.ease,
              'intervalDays': review.intervalDays,
              'repetitions': review.repetitions,
              'lapses': review.lapses,
              'dueAt': review.dueAt.toIso8601String(),
            },
          )
          .toList(),
    });
  }
}

WordEntriesCompanion _wordCompanion(Map<String, dynamic> word) {
  return WordEntriesCompanion.insert(
    id: word['id'] as String,
    categoryId: word['categoryId'] as String,
    tamil: word['tamil'] as String,
    transliteration: word['transliteration'] as String,
    english: word['english'] as String,
    ipa: word['ipa'] as String,
    pronunciation: word['pronunciation'] as String,
    partOfSpeech: word['partOfSpeech'] as String,
    cefr: word['cefr'] as String,
    emoji: Value(word['emoji'] as String?),
    usageNote: Value((word['usageNote'] as String?) ?? ''),
    commonMistakes: Value((word['commonMistakes'] as String?) ?? ''),
    britishNote: Value(word['britishNote'] as String?),
    dutchNote: Value(word['dutchNote'] as String?),
    origin: const Value('seed'),
  );
}

String _idFor(String lang, String categoryId, String english) {
  final slug = english
      .toLowerCase()
      .replaceAll(RegExp(r"[^a-z0-9]+"), '-')
      .replaceAll(RegExp(r'^-+|-+$'), '');
  return '$lang.$categoryId.${slug.isEmpty ? 'word' : slug}';
}
