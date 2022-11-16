part of '../../android_core.dart';

abstract class ControllableView<T extends WidgetController> extends StatelessWidget {
  T controller;

  ControllableView({required this.controller});

  @override
  Widget build(BuildContext context);
}
