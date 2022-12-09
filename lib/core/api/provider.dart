part of '../../android_core.dart';

class Provider extends GetConnect {
  FutureOr<Request> Function(Request)? requestModifier;

  @override
  void onInit() async {
    httpClient.baseUrl = Env.get('API_URL');
    httpClient.addRequestModifier(requestModifier ?? (request) => request);
    httpClient.timeout = Duration(minutes: int.tryParse(Env.get('API_TIMEOUT') ?? "0") ?? 0);
    httpClient.maxAuthRetries = int.tryParse(Env.get('API_MAX_RETRIES') ?? "1") ?? 1;
  }
}
