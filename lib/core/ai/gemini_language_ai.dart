import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'ai_provider.dart';
import 'model_config.dart';

class GeminiLanguageAi implements LanguageAi {
  GeminiLanguageAi({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  @override
  String get id => 'gemini';

  @override
  String get displayName => 'Google Gemini';

  @override
  Future<String> completeText({
    required String apiKey,
    required String prompt,
    bool json = false,
  }) async {
    final body = <String, Object?>{
      'contents': [
        {
          'role': 'user',
          'parts': [
            {'text': prompt},
          ],
        },
      ],
      'generationConfig': {
        if (json) 'responseMimeType': 'application/json',
        'thinkingConfig': {'thinkingLevel': 'low'},
      },
    };
    final decoded = await _post(
      apiKey,
      '${GeminiModels.endpoint}/models/${GeminiModels.text}:generateContent',
      body,
    );
    return _textFromGenerateContent(decoded);
  }

  @override
  Future<List<WordDraft>> expandCategory({
    required String apiKey,
    required String categoryName,
    required String targetLanguage,
    required String learnerLevel,
    required List<String> existingEnglish,
  }) async {
    final avoid = existingEnglish.take(400).join(', ');
    final prompt = '''
You are building Ulagam, a Tamil-to-$targetLanguage word book.
Source language is Tamil. Target variety for English is American English.
Learner level: $learnerLevel. Category: $categoryName.
Return 8 new everyday words that are NOT in this list: $avoid.
JSON array only. Each object needs:
english, tamil (Tamil script), transliteration, ipa, pronunciation (simple syllables),
partOfSpeech, cefr (A1 A2 B1 B2 or C1), emoji (one emoji or empty string),
simpleEnglish, simpleTamil, naturalEnglish, naturalTamil,
usageNote, commonMistakes, britishNote, dutchNote.
usageNote should mention American English. britishNote and dutchNote can be empty strings.
commonMistakes should be a real slip Tamil speakers make with that word.
''';
    final raw = await completeText(apiKey: apiKey, prompt: prompt, json: true);
    final parsed = jsonDecode(_stripFence(raw));
    if (parsed is! List) {
      throw AiException('Gemini did not return a word list.');
    }
    return parsed.map((item) {
      final map = Map<String, dynamic>.from(item as Map);
      String field(String key) => (map[key] ?? '').toString().trim();
      final emoji = field('emoji');
      return WordDraft(
        english: field('english'),
        tamil: field('tamil'),
        transliteration: field('transliteration'),
        ipa: field('ipa'),
        pronunciation: field('pronunciation'),
        partOfSpeech: field('partOfSpeech').isEmpty
            ? 'noun'
            : field('partOfSpeech'),
        cefr: field('cefr').isEmpty ? learnerLevel : field('cefr'),
        emoji: emoji.isEmpty ? null : emoji,
        simpleEnglish: field('simpleEnglish'),
        simpleTamil: field('simpleTamil'),
        naturalEnglish: field('naturalEnglish'),
        naturalTamil: field('naturalTamil'),
        usageNote: field('usageNote'),
        commonMistakes: field('commonMistakes'),
        britishNote: field('britishNote').isEmpty ? null : field('britishNote'),
        dutchNote: field('dutchNote').isEmpty ? null : field('dutchNote'),
      );
    }).where((word) => word.english.isNotEmpty && word.tamil.isNotEmpty).toList();
  }

  @override
  Future<Uint8List> generateImage({
    required String apiKey,
    required String prompt,
  }) async {
    final decoded = await _post(
      apiKey,
      '${GeminiModels.endpoint}/interactions',
      {
        'model': GeminiModels.image,
        'input': [
          {'type': 'text', 'text': prompt},
        ],
      },
    );
    final bytes = _findImageBytes(decoded);
    if (bytes == null) {
      throw AiException('Gemini did not return a picture.');
    }
    return bytes;
  }

  @override
  Future<Uint8List> synthesizeSpeech({
    required String apiKey,
    required String text,
  }) async {
    final decoded = await _post(
      apiKey,
      '${GeminiModels.endpoint}/models/${GeminiModels.tts}:generateContent',
      {
        'contents': [
          {
            'role': 'user',
            'parts': [
              {
                'text': text,
                'speech_metadata': {
                  'style': 'clear American English, warm and a little slow',
                },
              },
            ],
          },
        ],
        'generationConfig': {
          'responseModalities': ['AUDIO'],
          'speechConfig': {
            'voiceConfig': {'voice': GeminiModels.ttsVoice},
          },
        },
      },
    );
    final bytes = _findAudioBytes(decoded);
    if (bytes == null) {
      throw AiException('Gemini did not return audio.');
    }
    return bytes;
  }

  @override
  Future<String> reviewSpeech({
    required String apiKey,
    required Uint8List audio,
    required String mimeType,
    required String expectedText,
  }) async {
    final decoded = await _post(
      apiKey,
      '${GeminiModels.endpoint}/models/${GeminiModels.text}:generateContent',
      {
        'contents': [
          {
            'role': 'user',
            'parts': [
              {
                'inline_data': {
                  'mime_type': mimeType,
                  'data': base64Encode(audio),
                },
              },
              {
                'text':
                    'The learner is a Tamil speaker practicing American English. '
                    'They tried to say: "$expectedText". '
                    'Give a score from 0 to 100 and two specific pronunciation tips. '
                    'Be kind and concrete. Plain text.',
              },
            ],
          },
        ],
      },
    );
    return _textFromGenerateContent(decoded);
  }

  Future<Map<String, dynamic>> _post(
    String apiKey,
    String url,
    Map<String, Object?> body,
  ) async {
    if (apiKey.trim().isEmpty) {
      throw AiException('Add your Gemini API key in Settings.');
    }
    final response = await _client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'x-goog-api-key': apiKey.trim(),
      },
      body: jsonEncode(body),
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw AiException(_errorMessage(response.statusCode, response.body));
    }
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  String _errorMessage(int code, String body) {
    try {
      final decoded = jsonDecode(body);
      final message = decoded['error']?['message']?.toString();
      if (message != null && message.isNotEmpty) {
        return 'Gemini ($code): $message';
      }
    } catch (_) {}
    return 'Gemini request failed ($code). Check the key and your connection.';
  }

  String _textFromGenerateContent(Map<String, dynamic> decoded) {
    final candidates = decoded['candidates'];
    if (candidates is! List || candidates.isEmpty) {
      throw AiException('Gemini returned no text.');
    }
    final parts = candidates.first['content']?['parts'];
    if (parts is! List) throw AiException('Gemini returned no text.');
    final buffer = StringBuffer();
    for (final part in parts) {
      final text = part['text'];
      if (text is String) buffer.write(text);
    }
    final text = buffer.toString().trim();
    if (text.isEmpty) throw AiException('Gemini returned no text.');
    return text;
  }

  Uint8List? _findImageBytes(Object? node) {
    if (node is Map) {
      final output = node['output_image'];
      if (output is Map && output['data'] is String) {
        return base64Decode(output['data'] as String);
      }
      for (final value in node.values) {
        final found = _findImageBytes(value);
        if (found != null) return found;
      }
    } else if (node is List) {
      for (final value in node) {
        final found = _findImageBytes(value);
        if (found != null) return found;
      }
    }
    return null;
  }

  Uint8List? _findAudioBytes(Map<String, dynamic> decoded) {
    final candidates = decoded['candidates'];
    if (candidates is! List) return null;
    for (final candidate in candidates) {
      final parts = candidate['content']?['parts'];
      if (parts is! List) continue;
      for (final part in parts) {
        final inline = part['inlineData'] ?? part['inline_data'];
        if (inline is Map && inline['data'] is String) {
          return base64Decode(inline['data'] as String);
        }
      }
    }
    return null;
  }

  String _stripFence(String raw) {
    var text = raw.trim();
    if (text.startsWith('```')) {
      text = text.replaceFirst(RegExp(r'^```(?:json)?'), '');
      text = text.replaceFirst(RegExp(r'```$'), '');
    }
    return text.trim();
  }
}
