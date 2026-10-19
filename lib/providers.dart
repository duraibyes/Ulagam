import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/ai/ai_cache.dart';
import 'core/ai/ai_provider.dart';
import 'core/ai/gemini_language_ai.dart';
import 'core/database/app_database.dart';
import 'core/database/database_store.dart';
import 'core/settings/secure_settings.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  throw StateError('Database must be provided at startup.');
});

final secureSettingsProvider = Provider<SecureSettings>((ref) => SecureSettings());

final languageAiProvider = Provider<LanguageAi>((ref) => GeminiLanguageAi());

final aiCacheProvider = Provider<AiCacheStore>((ref) => AiCacheStore());

final profileProvider = StreamProvider<LearnerProfile>((ref) {
  return ref.watch(databaseProvider).watchProfile();
});
