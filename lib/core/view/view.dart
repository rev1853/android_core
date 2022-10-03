part of '../../android_core.dart';

abstract class View<T extends CoreController> extends StatelessWidget {
  Map<dynamic, dynamic>? arguments;

  View([this.arguments]);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      id: Get.find<T>().id,
      builder: (state) {
        state.property?.arguments = arguments;
        return buildWidget(context, state);
      },
    );
  }

  Widget buildWidget(BuildContext context, T state);
}
