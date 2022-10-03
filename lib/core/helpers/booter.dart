part of '../../android_core.dart';

abstract class Booter {
  FutureOr<void> preRun();
  FutureOr<void> postRun();
}
