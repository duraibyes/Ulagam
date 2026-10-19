import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/ai/ai_provider.dart';
import '../../core/ai/model_config.dart';
import '../../core/database/app_database.dart';
import '../../core/database/database_store.dart';
import '../../providers.dart';

class WordPage extends ConsumerStatefulWidget {
  const WordPage({super.key, required this.wordId});

  final String wordId;

  @override
  ConsumerState<WordPage> createState() => _WordPageState();
}

class _WordPageState extends ConsumerState<WordPage> {
  final _player = AudioPlayer();
  bool _busy = false;

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _play(WordEntry word) async {
    final db = ref.read(databaseProvider);
    var path = word.audioPath;
    if (path == null || !File(path).existsSync()) {
      final key = await ref.read(secureSettingsProvider).readGeminiKey();
      if (key == null || key.isEmpty) {
        _toast('Add a Gemini key in Settings to hear this word.');
        return;
      }
      if (!await _online()) {
        _toast('No internet, and this audio is not cached yet.');
        return;
      }
      setState(() => _busy = true);
      try {
        final cache = ref.read(aiCacheProvider);
        final prompt = '${word.english}. ${word.pronunciation}';
        final cacheKey = cache.keyFor(
          provider: 'gemini',
          model: GeminiModels.tts,
          kind: 'audio',
          prompt: prompt,
        );
        final existing = await cache.existingFile(cacheKey, 'wav');
        final file = existing ??
            await cache.writeBytes(
              cacheKey,
              'wav',
              await ref.read(languageAiProvider).synthesizeSpeech(
                    apiKey: key,
                    text: prompt,
                  ),
            );
        path = file.path;
        await db.setAudioPath(word.id, path);
      } on AiException catch (error) {
        _toast(error.message);
        return;
      } finally {
        if (mounted) setState(() => _busy = false);
      }
    }
    await _player.stop();
    await _player.play(DeviceFileSource(path));
  }

  Future<void> _picture(WordEntry word) async {
    final key = await ref.read(secureSettingsProvider).readGeminiKey();
    if (key == null || key.isEmpty) {
      _toast('Add a Gemini key in Settings to make a picture.');
      return;
    }
    if (!await _online()) {
      _toast('No internet, and this picture is not cached yet.');
      return;
    }
    setState(() => _busy = true);
    try {
      final cache = ref.read(aiCacheProvider);
      final prompt =
          'A simple friendly square illustration of ${word.english}, plain soft background, no text, no letters.';
      final cacheKey = cache.keyFor(
        provider: 'gemini',
        model: GeminiModels.image,
        kind: 'image',
        prompt: prompt,
      );
      final existing = await cache.existingFile(cacheKey, 'png');
      final file = existing ??
          await cache.writeBytes(
            cacheKey,
            'png',
            await ref.read(languageAiProvider).generateImage(apiKey: key, prompt: prompt),
          );
      await ref.read(databaseProvider).setImagePath(word.id, file.path);
      if (mounted) setState(() {});
    } on AiException catch (error) {
      _toast(error.message);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<bool> _online() async {
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
    return FutureBuilder(
      future: Future.wait([
        db.wordById(widget.wordId),
        db.examplesFor(widget.wordId),
      ]),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        final word = snapshot.data![0] as WordEntry;
        final examples = snapshot.data![1] as List<WordExample>;
        final image = word.imagePath != null && File(word.imagePath!).existsSync()
            ? File(word.imagePath!)
            : null;
        return Scaffold(
          appBar: AppBar(
            title: Text(word.english),
            actions: [
              IconButton(
                tooltip: word.saved ? 'Saved' : 'Save',
                onPressed: () async {
                  await db.setSaved(word.id, !word.saved);
                  if (mounted) setState(() {});
                },
                icon: Icon(word.saved ? Icons.bookmark : Icons.bookmark_border),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Center(
                child: image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.file(image, height: 220, width: 220, fit: BoxFit.cover),
                      )
                    : Text(word.emoji ?? '🌍', style: const TextStyle(fontSize: 88)),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  word.tamil,
                  style: const TextStyle(fontFamily: 'NotoSansTamil', fontSize: 40),
                ),
              ),
              Center(child: Text(word.transliteration, style: const TextStyle(fontSize: 18))),
              const SizedBox(height: 8),
              Center(
                child: Text(word.english, style: Theme.of(context).textTheme.headlineMedium),
              ),
              Center(child: Text('${word.ipa}   ${word.pronunciation}')),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  Chip(label: Text(word.partOfSpeech)),
                  Chip(label: Text(word.cefr)),
                  ActionChip(
                    avatar: const Icon(Icons.volume_up),
                    label: Text(_busy ? 'Working…' : 'Listen'),
                    onPressed: _busy ? null : () => _play(word),
                  ),
                  ActionChip(
                    avatar: const Icon(Icons.image_outlined),
                    label: const Text('Picture'),
                    onPressed: _busy ? null : () => _picture(word),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              for (final example in examples) ...[
                Text(example.kind == 'simple' ? 'Simple' : 'Natural'),
                Text(example.english, style: const TextStyle(fontSize: 18)),
                Text(
                  example.tamil,
                  style: const TextStyle(fontFamily: 'NotoSansTamil', fontSize: 18),
                ),
                const SizedBox(height: 12),
              ],
              _note('How to use it', word.usageNote),
              _note('A common slip', word.commonMistakes),
              if (word.britishNote != null && word.britishNote!.isNotEmpty)
                _note('British English', word.britishNote!),
              if (word.dutchNote != null && word.dutchNote!.isNotEmpty)
                _note('Dutch', word.dutchNote!),
            ],
          ),
        );
      },
    );
  }

  Widget _note(String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
          const SizedBox(height: 4),
          Text(body),
        ],
      ),
    );
  }
}
