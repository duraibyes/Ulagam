import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/database/app_database.dart';
import '../../core/database/database_store.dart';
import '../../providers.dart';
import 'category_page.dart';
import 'word_page.dart';

class WordWorldPage extends ConsumerStatefulWidget {
  const WordWorldPage({super.key});

  @override
  ConsumerState<WordWorldPage> createState() => _WordWorldPageState();
}

class _WordWorldPageState extends ConsumerState<WordWorldPage> {
  final _search = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    final profile = ref.watch(profileProvider).value;
    final target = profile?.targetLang ?? 'en';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word World'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              controller: _search,
              decoration: const InputDecoration(
                hintText: 'Search Tamil, transliteration, or English',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => _query = value.trim()),
            ),
          ),
          if (target != 'en')
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Dutch cards are created when you expand a category with Gemini. The English seed stays on this phone.',
              ),
            ),
          Expanded(
            child: _query.isEmpty
                ? _CategoryGrid(db: db, targetLang: target)
                : _SearchResults(db: db, query: _query, targetLang: target),
          ),
        ],
      ),
    );
  }
}

class _CategoryGrid extends StatelessWidget {
  const _CategoryGrid({required this.db, required this.targetLang});
  final AppDatabase db;
  final String targetLang;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: db.categories(),
      builder: (context, snapshot) {
        final categories = snapshot.data ?? const <WordCategory>[];
        if (categories.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.15,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CategoryPage(category: category),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(category.emoji, style: const TextStyle(fontSize: 32)),
                      const Spacer(),
                      Text(category.nameEn, style: Theme.of(context).textTheme.titleMedium),
                      Text(
                        category.nameTa,
                        style: const TextStyle(fontFamily: 'NotoSansTamil', fontSize: 16),
                      ),
                      FutureBuilder(
                        future: db.wordCount(category.id, targetLang),
                        builder: (context, count) {
                          return Text('${count.data ?? 0} words');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _SearchResults extends StatelessWidget {
  const _SearchResults({
    required this.db,
    required this.query,
    required this.targetLang,
  });

  final AppDatabase db;
  final String query;
  final String targetLang;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: db.searchWords(query, targetLang),
      builder: (context, snapshot) {
        final words = snapshot.data ?? const <WordEntry>[];
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (words.isEmpty) {
          return const Center(child: Text('No saved match in this language yet.'));
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
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => WordPage(wordId: word.id)),
                );
              },
            );
          },
        );
      },
    );
  }
}
