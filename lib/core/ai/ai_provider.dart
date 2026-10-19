import 'dart:typed_data';

class WordDraft {
  const WordDraft({
    required this.english,
    required this.tamil,
    required this.transliteration,
    required this.ipa,
    required this.pronunciation,
    required this.partOfSpeech,
    required this.cefr,
    required this.simpleEnglish,
    required this.simpleTamil,
    required this.naturalEnglish,
    required this.naturalTamil,
    required this.usageNote,
    required this.commonMistakes,
    this.emoji,
    this.britishNote,
    this.dutchNote,
  });

  final String english;
  final String tamil;
  final String transliteration;
  final String ipa;
  final String pronunciation;
  final String partOfSpeech;
  final String cefr;
  final String? emoji;
  final String simpleEnglish;
  final String simpleTamil;
  final String naturalEnglish;
  final String naturalTamil;
  final String usageNote;
  final String commonMistakes;
  final String? britishNote;
  final String? dutchNote;
}

class AiException implements Exception {
  AiException(this.message);
  final String message;
  @override
  String toString() => message;
}

/// Text, image, speech, and pronunciation. Gemini is the first implementation.
/// Claude and OpenAI can implement the same methods later.
abstract class LanguageAi {
  String get id;
  String get displayName;

  Future<String> completeText({
    required String apiKey,
    required String prompt,
    bool json = false,
  });

  Future<List<WordDraft>> expandCategory({
    required String apiKey,
    required String categoryName,
    required String targetLanguage,
    required String learnerLevel,
    required List<String> existingEnglish,
  });

  Future<Uint8List> generateImage({
    required String apiKey,
    required String prompt,
  });

  Future<Uint8List> synthesizeSpeech({
    required String apiKey,
    required String text,
  });

  Future<String> reviewSpeech({
    required String apiKey,
    required Uint8List audio,
    required String mimeType,
    required String expectedText,
  });
}

class UnavailableLanguageAi implements LanguageAi {
  UnavailableLanguageAi(this.id, this.displayName);
  @override
  final String id;
  @override
  final String displayName;

  Never _blocked() {
    throw AiException(
      '$displayName is not connected yet. Ulagam uses Gemini for now.',
    );
  }

  @override
  Future<String> completeText({
    required String apiKey,
    required String prompt,
    bool json = false,
  }) async => _blocked();

  @override
  Future<List<WordDraft>> expandCategory({
    required String apiKey,
    required String categoryName,
    required String targetLanguage,
    required String learnerLevel,
    required List<String> existingEnglish,
  }) async => _blocked();

  @override
  Future<Uint8List> generateImage({
    required String apiKey,
    required String prompt,
  }) async => _blocked();

  @override
  Future<String> reviewSpeech({
    required String apiKey,
    required Uint8List audio,
    required String mimeType,
    required String expectedText,
  }) async => _blocked();

  @override
  Future<Uint8List> synthesizeSpeech({
    required String apiKey,
    required String text,
  }) async => _blocked();
}
