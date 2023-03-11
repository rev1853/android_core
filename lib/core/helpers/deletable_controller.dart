part of '../../android_core.dart';

abstract class DeletableController extends GetxController {
  @protected
  String get prefixTag;

  @protected
  final String uniqueId = const Uuid().v4();

  String get tag => "$prefixTag-$uniqueId";

  void put() {
    Get.put(this, tag: tag);
  }

  void delete() {
    Get.delete(tag: tag);
  }
}
