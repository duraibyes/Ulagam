import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:ulagam/core/level/cefr.dart';
import 'package:ulagam/core/review/sm2.dart';

void main() {
  test('seed has the core word world', () {
    final raw = File('assets/seed/words.json').readAsStringSync();
    final data = jsonDecode(raw) as Map<String, dynamic>;
    final words = data['words'] as List;
    final categories = data['categories'] as List;
    expect(words.length, greaterThanOrEqualTo(1500));
    expect(categories.length, 32);
    final ids = <String>{};
    for (final word in words) {
      final map = word as Map<String, dynamic>;
      expect(ids.add(map['id'] as String), isTrue);
      expect((map['tamil'] as String).contains(RegExp(r'[\u0B80-\u0BFF]')), isTrue);
      expect((map['examples'] as List).length, 2);
      expect(map['ipa'], startsWith('/'));
      expect(CefrLevel.parse(map['cefr'] as String).code, map['cefr']);
    }
  });

  test('SM-2 lapses below 3 and grows after that', () {
    final first = reviewSm2(Sm2State.initial, 5);
    expect(first.state.repetitions, 1);
    expect(first.dueInDays, 1);
    final second = reviewSm2(first.state, 4);
    expect(second.dueInDays, 6);
    final lapse = reviewSm2(second.state, 1);
    expect(lapse.state.lapses, 1);
    expect(lapse.state.repetitions, 0);
  });

  test('levels never include zero and A1 is the floor', () {
    expect(CefrLevel.values.map((level) => level.code), isNot(contains('0')));
    expect(CefrLevel.a1.lower().code, 'A1');
    expect(CefrLevel.a2.allows('A1'), isTrue);
    expect(CefrLevel.a2.allows('B1'), isFalse);
  });
}
