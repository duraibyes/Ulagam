import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/database/app_database.dart';
import '../../core/database/database_store.dart';
import '../../core/level/cefr.dart';
import '../../providers.dart';

class _Question {
  const _Question(this.prompt, this.tamilHint, this.options, this.answer);
  final String prompt;
  final String tamilHint;
  final List<String> options;
  final int answer;
}

const _stages = <CefrLevel>[
  CefrLevel.a2,
  CefrLevel.b1,
  CefrLevel.b2,
  CefrLevel.c1,
];

const _questions = <List<_Question>>[
  [
    _Question('Which sentence is correct?', 'சரியான வாக்கியம் எது?', [
      'She is a doctor.',
      'She doctor is.',
      'She a doctor.',
      'Is she doctor a.',
    ], 0),
    _Question('I ___ eating now.', 'இப்போது நடக்கும் செயல்.', [
      'am',
      'is',
      'are',
      'be',
    ], 0),
  ],
  [
    _Question('She ___ to the store yesterday.', 'நேற்று.', [
      'go',
      'goes',
      'going',
      'went',
    ], 3),
    _Question('I have lived here ___ 2020.', 'ஒரு காலத்திலிருந்து.', [
      'for',
      'since',
      'from',
      'by',
    ], 1),
  ],
  [
    _Question('Choose the natural sentence.', 'மென்மையான மறுப்பு.', [
      'I am not agree.',
      'I don\'t agree.',
      'I am disagree.',
      'I not agree.',
    ], 1),
    _Question('By the time we arrived, the shop ___.', 'அதற்கு முன்பே முடிந்தது.', [
      'already closed',
      'had already closed',
      'has already close',
      'already closing',
    ], 1),
  ],
  [
    _Question('Choose the natural sentence.', 'இலக்கண வரிசை.', [
      'Hardly I had sat down when the phone rang.',
      'Hardly had I sat down when the phone rang.',
      'I hardly sat than the phone rang.',
      'Hardly I sat down than the phone rang.',
    ], 1),
    _Question('Which sentence is precise?', 'காரணம் தெளிவாக.', [
      'The delay was due to the storm, so the flight left on time.',
      'The flight was delayed on account of the storm.',
      'The flight delayed because storm account.',
      'On account storm the flight delay.',
    ], 1),
  ],
];

class PlacementPage extends ConsumerStatefulWidget {
  const PlacementPage({super.key});

  @override
  ConsumerState<PlacementPage> createState() => _PlacementPageState();
}

class _PlacementPageState extends ConsumerState<PlacementPage> {
  int _stage = 0;
  int _index = 0;
  int _correct = 0;
  CefrLevel? _result;
  bool _clearSpeech = true;

  void _choose(int option) {
    if (option == _questions[_stage][_index].answer) _correct++;
    if (_index == 0) {
      setState(() => _index = 1);
      return;
    }
    if (_correct < 2) {
      final level = _correct == 0 && _stage == 0
          ? CefrLevel.a1
          : (_correct == 0 ? _stages[_stage - 1] : _stages[_stage]);
      setState(() => _result = level);
      return;
    }
    if (_stage == _stages.length - 1) {
      setState(() => _result = CefrLevel.c1);
      return;
    }
    setState(() {
      _stage++;
      _index = 0;
      _correct = 0;
    });
  }

  Future<void> _save(AppDatabase db) async {
    var level = _result ?? CefrLevel.a2;
    if (!_clearSpeech) level = level.lower();
    await db.updateProfile(cefr: level.code, placementDone: true);
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    if (_result != null) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Say this out loud', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 8),
                const Text('உரக்கச் சொல்லுங்கள். Speak & Check will score this later. For now, tell the app how it felt.'),
                const SizedBox(height: 24),
                const Text('My name is ____. I am learning English.', style: TextStyle(fontSize: 22)),
                const SizedBox(height: 12),
                const Text('I would like a cup of coffee, please.', style: TextStyle(fontSize: 22)),
                const Spacer(),
                FilledButton(
                  onPressed: () {
                    _clearSpeech = true;
                    _save(db);
                  },
                  child: const Text('I said both clearly'),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () {
                    _clearSpeech = false;
                    _save(db);
                  },
                  child: const Text('I struggled with the sounds'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final question = _questions[_stage][_index];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('A short check', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text('Stage ${_stage + 1} of ${_stages.length}. The lowest result is A1.'),
              const SizedBox(height: 20),
              Text(question.prompt, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                question.tamilHint,
                style: const TextStyle(fontFamily: 'NotoSansTamil', fontSize: 18),
              ),
              const SizedBox(height: 20),
              for (var i = 0; i < question.options.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => _choose(i),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(question.options[i], style: const TextStyle(fontSize: 18)),
                      ),
                    ),
                  ),
                ),
              const Spacer(),
              TextButton(
                onPressed: () => db.updateProfile(cefr: 'A2', placementDone: true),
                child: const Text('Skip and start at A2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
