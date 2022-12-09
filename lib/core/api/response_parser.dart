part of '../../android_core.dart';

class ResponseParser<T> {
  T Function(Response response) parse;
  ResponseParser(this.parse);
}
