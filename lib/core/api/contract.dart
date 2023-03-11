part of '../../android_core.dart';

abstract class Contract {
  void onStart();
  void onSuccess(Response response);
  void onFailed(Response response);
  void onError(String message);
  void onComplete();
}
