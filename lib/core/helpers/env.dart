part of '../../android_core.dart';

class Env {
  ///
  /// load the env from project
  ///
  static Future load() async {
    await dotenv.load(fileName: '.env');
  }

  ///
  /// get item from .env file
  ///
  static String? get(String name) {
    return dotenv.env[name];
  }
}
