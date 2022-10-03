part of '../../android_core.dart';

class Services extends GetConnect {
  String get api => '';

  @override
  void onInit() async {
    httpClient.baseUrl = Env.get('URL_API');

    httpClient.addRequestModifier<dynamic>((request) async {
      String? authenticationName = Env.get("AUTHENTICATION_NAME");
      if (authenticationName != null) {
        String? authenticationCode = Get.find<LocalStorage>().take<String>(authenticationName);
        if (authenticationCode != null) request.headers['Authorization'] = "Bearer $authenticationCode";
      }
      return request;
    });
    httpClient.timeout = const Duration(minutes: 1);
    httpClient.maxAuthRetries = 1;
  }

  Future<Response> select([Map<String, String?>? params]) {
    return get(api, query: params);
  }

  Future<Response> store(
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) {
    return post(api, body, contentType: contentType, headers: headers, query: query);
  }

  Future<Response> show(int id) {
    return get('$api/$id');
  }

  Future<Response> update(
    int id,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) {
    return put('$api/$id', body, contentType: contentType, headers: headers, query: query);
  }

  Future<Response> postUpdate(
    int id,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) {
    return post('$api/$id', body, contentType: contentType, headers: headers, query: query);
  }

  Future<Response> destroy(int id, {Map<String, dynamic>? query}) {
    return delete('$api/$id', query: query);
  }
}
