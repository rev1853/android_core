part of '../../android_core.dart';

class Env {
  static Future load() async {
    await dotenv.load(fileName: '.env');
  }

  static String? get(String name) {
    return dotenv.env[name];
  }
}
