part of '../../android_core.dart';

///
/// class for create a custom widget which has a controller extends `DeletableController`
///
abstract class ControllableWidget<T extends DeletableController> extends StatelessWidget {
  final T controller;

  const ControllableWidget({required this.controller});

  @override
  Widget build(BuildContext context);
}
