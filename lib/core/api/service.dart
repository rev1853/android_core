part of '../../android_core.dart';

abstract class Services<T extends Provider> {
  String get api;

  T provider = Get.find();

  Future<Response> select([Map<String, String?>? params]) {
    return provider.get(api, query: params);
  }

  Future<Response> store(
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) {
    return provider.post(api, body, contentType: contentType, headers: headers, query: query);
  }

  Future<Response> show(int id) {
    return provider.get('$api/$id');
  }

  Future<Response> update(
    int id,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) {
    return provider.put('$api/$id', body, contentType: contentType, headers: headers, query: query);
  }

  Future<Response> postUpdate(
    int id,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) {
    return provider.post('$api/$id', body, contentType: contentType, headers: headers, query: query);
  }

  Future<Response> destroy(int id, {Map<String, dynamic>? query}) {
    return provider.delete('$api/$id', query: query);
  }
}
