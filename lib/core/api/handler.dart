part of '../../android_core.dart';

///
///type parameter
/// [F] fetcher's function type
/// [T] Data type, data to handler
///
class DataHandler<T, F extends Function> implements Contract {
  void Function()? _onStart;
  void Function(T)? _onSuccess;
  void Function(Response)? _onFailed;
  void Function(String)? _onError;
  void Function()? _onComplete;
  T Function(Response)? parser;

  HandlerStatus _lastStatus = HandlerStatus.none;

  DataHandler({
    required this.fetcher,
    required T initialValue,
    this.parser,
    void Function()? onStart,
    void Function(T)? onSuccess,
    void Function(Response)? onFailed,
    void Function(String)? onError,
    void Function()? onComplete,
  }) {
    fetcher.contract = this;
    _data = Rx<T>(initialValue);

    _onStart = onStart;
    _onSuccess = onSuccess;
    _onFailed = onFailed;
    _onError = onError;
    _onComplete = onComplete;
  }
  DataFetcher<F> fetcher;
  late Rx<T> _data;

  T get value => _data.value;

  final Rx<bool> _onProcess = Rx<bool>(false);
  bool get onProcess => _onProcess.value;
  set onProcess(bool value) => _onProcess.value = value;

  HandlerStatus get lastStatus => _lastStatus;

  @override
  void onStart() {
    onProcess = true;
    _lastStatus = HandlerStatus.start;
    _onStart?.call();
  }

  @override
  void onSuccess(Response response) {
    _data.value = parser?.call(response) ?? response.body;
    _lastStatus = HandlerStatus.success;
    _onSuccess?.call(value);
  }

  @override
  void onFailed(Response response) {
    _lastStatus = HandlerStatus.failed;
    _onFailed?.call(response);
  }

  @override
  void onError(String message) {
    _lastStatus = HandlerStatus.error;
    _onError?.call(message);
  }

  @override
  void onComplete() {
    _onComplete?.call();
    _lastStatus = HandlerStatus.complete;
    onProcess = false;
  }
}

enum HandlerStatus {
  start,
  success,
  failed,
  error,
  complete,
  none,
}
