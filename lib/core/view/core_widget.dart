part of '../../android_core.dart';

abstract class CoreWidget<T extends CoreController> extends StatelessWidget {
  T get state => Get.find();

  @override
  Widget build(BuildContext context);
}
