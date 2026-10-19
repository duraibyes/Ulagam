import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/ai/ai_provider.dart';
import '../../core/database/app_database.dart';
import '../../core/database/database_store.dart';
import '../../core/level/cefr.dart';
import '../../providers.dart';
import 'word_page.dart';

class CategoryPage extends ConsumerStatefulWidget {
  const CategoryPage({super.key, required this.category});

  final WordCategory category;

  @override
  ConsumerState<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  bool _myLevelOnly = true;
  bool _busy = false;
  String _filter = '';

  Future<void> _expand() async {
    final db = ref.read(databaseProvider);
    final profile = await db.readProfile();
    final key = await ref.read(secureSettingsProvider).readGeminiKey();
    if (key == null || key.isEmpty) {
      _toast('Add your Gemini API key in Settings first.');
      return;
    }
    final online = await _isOnline();
    if (!online) {
      _toast('No internet. Cached words still work.');
      return;
    }
    setState(() => _busy = true);
    try {
      final existing = await db.englishInCategory(widget.category.id, profile.targetLang);
      final drafts = await ref.read(languageAiProvider).expandCategory(
            apiKey: key,
            categoryName: widget.category.nameEn,
            targetLanguage: profile.targetLang == 'nl' ? 'Dutch' : 'American English',
            learnerLevel: profile.cefr,
            existingEnglish: existing,
          );
      await db.insertDrafts(
        categoryId: widget.category.id,
        targetLang: profile.targetLang,
        drafts: [
          for (final draft in drafts)
            (
              english: draft.english,
              tamil: draft.tamil,
              transliteration: draft.transliteration,
              ipa: draft.ipa,
              pronunciation: draft.pronunciation,
              partOfSpeech: draft.partOfSpeech,
              cefr: draft.cefr,
              emoji: draft.emoji,
              simpleEnglish: draft.simpleEnglish,
              simpleTamil: draft.simpleTamil,
              naturalEnglish: draft.naturalEnglish,
              naturalTamil: draft.naturalTamil,
              usageNote: draft.usageNote,
              commonMistakes: draft.commonMistakes,
              britishNote: draft.britishNote,
              dutchNote: draft.dutchNote,
            ),
        ],
      );
      if (mounted) setState(() {});
    } on AiException catch (error) {
      _toast(error.message);
    } catch (error) {
      _toast('Could not add words. $error');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<bool> _isOnline() async {
    final result = await Connectivity().checkConnectivity();
    return result.any((item) => item != ConnectivityResult.none);
  }

  void _toast(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    final profile = ref.watch(profileProvider).value;
    final level = CefrLevel.parse(profile?.cefr ?? 'A2');
    final target = profile?.targetLang ?? 'en';
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.nameEn),
        actions: [
          FilterChip(
            label: Text(_myLevelOnly ? level.code : 'All'),
            selected: _myLevelOnly,
            onSelected: (value) => setState(() => _myLevelOnly = value),
          ),
          const SizedBox(width: 12),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _busy ? null : _expand,
        icon: _busy
            ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
            : const Icon(Icons.auto_awesome),
        label: const Text('Add words'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.category.nameTa,
                style: const TextStyle(fontFamily: 'NotoSansTamil', fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: const InputDecoration(hintText: 'Filter this category'),
              onChanged: (value) => setState(() => _filter = value.trim().toLowerCase()),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: db.wordsFor(categoryId: widget.category.id, targetLang: target),
              builder: (context, snapshot) {
                var words = snapshot.data ?? const <WordEntry>[];
                if (_myLevelOnly) {
                  words = words.where((word) => level.allows(word.cefr)).toList();
                }
                if (_filter.isNotEmpty) {
                  words = words.where((word) {
                    return word.english.toLowerCase().contains(_filter) ||
                        word.tamil.contains(_filter) ||
                        word.transliteration.toLowerCase().contains(_filter);
                  }).toList();
                }
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (words.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text('No words here yet. Use Add words when you have a Gemini key.'),
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: words.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final word = words[index];
                    return ListTile(
                      leading: Text(word.emoji ?? '•', style: const TextStyle(fontSize: 28)),
                      title: Text(word.english, style: const TextStyle(fontSize: 18)),
                      subtitle: Text(
                        '${word.tamil}  ·  ${word.transliteration}',
                        style: const TextStyle(fontFamily: 'NotoSansTamil', fontSize: 16),
                      ),
                      trailing: Text(word.cefr),
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => WordPage(wordId: word.id)),
                        );
                        if (mounted) setState(() {});
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
