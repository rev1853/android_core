part of '../../android_core.dart';

///
/// class to create a new view for page
///
abstract class CoreView<T extends CoreController> extends StatelessWidget {
  Map<dynamic, dynamic>? arguments;

  CoreView([this.arguments]);

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
