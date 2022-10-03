part of '../../android_core.dart';

abstract class Model {
  Model();
  Model.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
