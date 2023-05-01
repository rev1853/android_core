part of '../../android_core.dart';

///
/// class for widget that have view parent from `CoreView`
///
abstract class CoreWidget<T extends CoreController> extends StatelessWidget {
  T get state => Get.find();

  @override
  Widget build(BuildContext context);
}
