part of '../../android_core.dart';

abstract class ViewNavigator extends StatelessWidget {
  ViewNavigator({required this.navigatorKey});
  GlobalKey<NavigatorState> navigatorKey;

  // current arguments and settings
  Map arguments = {};
  late RouteSettings settings;

  String get initialRoute;
  List<ViewRoute> get routes;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: initialRoute,
      onGenerateRoute: (routeSettings) {
        settings = routeSettings;
        arguments = routeSettings.arguments == null ? {} : routeSettings.arguments as Map;
        if (routes.any((e) => e.routeName == routeSettings.name)) {
          return routes.firstWhere((element) => element.routeName == routeSettings.name);
        }
        return null;
      },
    );
  }
}
