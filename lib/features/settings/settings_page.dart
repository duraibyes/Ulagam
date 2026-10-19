import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/ai/ai_provider.dart';
import '../../core/ai/model_config.dart';
import '../../core/database/database_store.dart';
import '../../core/level/cefr.dart';
import '../../providers.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  final _key = TextEditingController();
  bool _loaded = false;
  bool _busy = false;
  String? _status;

  @override
  void initState() {
    super.initState();
    _loadKey();
  }

  @override
  void dispose() {
    _key.dispose();
    super.dispose();
  }

  Future<void> _loadKey() async {
    if (_loaded) return;
    final stored = await ref.read(secureSettingsProvider).readGeminiKey();
    _key.text = stored ?? '';
    _loaded = true;
    if (mounted) setState(() {});
  }

  Future<void> _saveKey() async {
    await ref.read(secureSettingsProvider).writeGeminiKey(_key.text);
    setState(() => _status = 'Key saved on this phone.');
  }

  Future<void> _testKey() async {
    setState(() {
      _busy = true;
      _status = null;
    });
    try {
      await ref.read(secureSettingsProvider).writeGeminiKey(_key.text);
      final text = await ref.read(languageAiProvider).completeText(
            apiKey: _key.text,
            prompt: 'Reply with the single word ready.',
          );
      setState(() => _status = 'Gemini replied: $text');
    } on AiException catch (error) {
      setState(() => _status = error.message);
    } catch (error) {
      setState(() => _status = 'Could not reach Gemini. $error');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _export() async {
    final raw = await ref.read(databaseProvider).exportBackup();
    final dir = await getTemporaryDirectory();
    final file = File(p.join(dir.path, 'ulagam-backup.json'));
    await file.writeAsString(raw);
    await SharePlus.instance.share(
      ShareParams(files: [XFile(file.path)], text: 'Ulagam backup'),
    );
  }

  Future<void> _import() async {
    final picked = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );
    if (picked.isEmpty || picked.single.path == null) return;
    final text = await File(picked.single.path!).readAsString();
    final data = jsonDecode(text);
    if (data is! Map || data['profile'] is! Map) {
      setState(() => _status = 'That file is not an Ulagam backup.');
      return;
    }
    final profile = Map<String, dynamic>.from(data['profile'] as Map);
    final database = ref.read(databaseProvider);
    await database.updateProfile(
      cefr: profile['cefr'] as String?,
      targetLang: profile['targetLang'] as String?,
      themeMode: profile['themeMode'] as String?,
      placementDone: profile['placementDone'] as bool?,
    );
    final words = (data['words'] as List?)?.cast<Map<String, dynamic>>() ?? [];
    final restored = await database.restoreSavedFlags(words);
    setState(() => _status = 'Backup restored. $restored saved words marked again.');
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider).value;
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Gemini API key', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          const Text(
            'The key stays in secure storage on this phone. It is not written into the app.',
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _key,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Paste your key',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              FilledButton(onPressed: _saveKey, child: const Text('Save key')),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: _busy ? null : _testKey,
                child: Text(_busy ? 'Testing…' : 'Test key'),
              ),
            ],
          ),
          if (_status != null) ...[
            const SizedBox(height: 12),
            Text(_status!),
          ],
          const SizedBox(height: 28),
          Text('Learning', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            initialValue: profile?.cefr ?? 'A2',
            decoration: const InputDecoration(labelText: 'Level', border: OutlineInputBorder()),
            items: [
              for (final level in CefrLevel.values)
                DropdownMenuItem(value: level.code, child: Text(level.display)),
            ],
            onChanged: (value) {
              if (value != null) db.updateProfile(cefr: value);
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: profile?.targetLang ?? 'en',
            decoration: const InputDecoration(
              labelText: 'Target language',
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(value: 'en', child: Text('English (American)')),
              DropdownMenuItem(value: 'nl', child: Text('Dutch')),
            ],
            onChanged: (value) {
              if (value != null) db.updateProfile(targetLang: value);
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: profile?.themeMode ?? 'system',
            decoration: const InputDecoration(labelText: 'Theme', border: OutlineInputBorder()),
            items: const [
              DropdownMenuItem(value: 'system', child: Text('System')),
              DropdownMenuItem(value: 'light', child: Text('Light')),
              DropdownMenuItem(value: 'dark', child: Text('Dark')),
            ],
            onChanged: (value) {
              if (value != null) db.updateProfile(themeMode: value);
            },
          ),
          const SizedBox(height: 28),
          Text('Backup', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          FilledButton(onPressed: _export, child: const Text('Export backup')),
          const SizedBox(height: 8),
          OutlinedButton(onPressed: _import, child: const Text('Import profile backup')),
          const SizedBox(height: 28),
          Text('Models', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text('Text: ${GeminiModels.text}'),
          Text('Pictures: ${GeminiModels.image}'),
          Text('Voice: ${GeminiModels.tts}'),
          const SizedBox(height: 8),
          const Text(
            'Claude and OpenAI use the same LanguageAi interface and are not connected yet.',
          ),
        ],
      ),
    );
  }
}
