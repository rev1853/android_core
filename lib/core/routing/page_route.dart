part of '../../android_core.dart';

class Page extends GetPage {
  Page({
    required String name,
    required Widget Function() page,
    List<Bindings> bindings = const [],
    List<GetMiddleware>? middlewares,
  }) : super(
          name: name,
          page: page,
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(
            milliseconds: 300,
          ),
          bindings: bindings,
          middlewares: middlewares,
        );
}

class ViewRoute extends GetPageRoute {
  ViewRoute({
    required String name,
    required Widget Function() pageBuilder,
    List<Bindings> bindings = const [],
    List<GetMiddleware>? middlewares,
    Bindings? binding,
  }) : super(
          settings: RouteSettings(name: name),
          routeName: name,
          page: pageBuilder,
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(
            milliseconds: 300,
          ),
          bindings: bindings,
          binding: binding,
          middlewares: middlewares,
        );
}
