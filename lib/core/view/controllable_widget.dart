part of '../../android_core.dart';

abstract class ControllableWidget<T extends WidgetController> extends StatelessWidget {
  T controller;

  ControllableWidget({required this.controller});

  @override
  Widget build(BuildContext context);
}
