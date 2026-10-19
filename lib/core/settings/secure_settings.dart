import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureSettings {
  SecureSettings({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  static const geminiKey = 'gemini_api_key';
  final FlutterSecureStorage _storage;

  Future<String?> readGeminiKey() => _storage.read(key: geminiKey);

  Future<void> writeGeminiKey(String value) {
    return _storage.write(key: geminiKey, value: value.trim());
  }

  Future<void> clearGeminiKey() => _storage.delete(key: geminiKey);
}
