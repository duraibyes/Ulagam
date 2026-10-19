import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/database/app_database.dart';
import '../../core/database/database_store.dart';
import '../../providers.dart';
import 'word_page.dart';

class SavedPage extends ConsumerWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final target = ref.watch(profileProvider).value?.targetLang ?? 'en';
    return Scaffold(
      appBar: AppBar(title: const Text('Saved')),
      body: FutureBuilder(
        future: db.savedWords(target),
        builder: (context, snapshot) {
          final words = snapshot.data ?? const <WordEntry>[];
          if (words.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text('Save a word from its card. It will wait here for review.'),
              ),
            );
          }
          return ListView.separated(
            itemCount: words.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final word = words[index];
              return ListTile(
                title: Text(word.english),
                subtitle: Text(
                  word.tamil,
                  style: const TextStyle(fontFamily: 'NotoSansTamil', fontSize: 16),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => WordPage(wordId: word.id)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
