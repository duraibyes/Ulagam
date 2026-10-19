import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class AiCacheStore {
  Future<Directory> _dir() async {
    final root = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(root.path, 'ulagam_cache'));
    if (!dir.existsSync()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  String keyFor({
    required String provider,
    required String model,
    required String kind,
    required String prompt,
  }) {
    final raw = '$provider|$model|$kind|${prompt.trim().toLowerCase()}';
    return sha256.convert(utf8.encode(raw)).toString();
  }

  Future<File?> existingFile(String key, String extension) async {
    final file = File(p.join((await _dir()).path, '$key.$extension'));
    if (await file.exists() && await file.length() > 32) return file;
    return null;
  }

  Future<File> writeBytes(String key, String extension, Uint8List bytes) async {
    final file = File(p.join((await _dir()).path, '$key.$extension'));
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
