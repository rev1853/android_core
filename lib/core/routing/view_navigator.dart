part of '../../android_core.dart';

abstract class ViewNavigator extends StatelessWidget {
  abstract GlobalKey<NavigatorState> navigatorKey;
  abstract String initialRoute;

  // current arguments and settings
  Map _arguments = {};
  Map get arguments => _arguments;

  List<ViewRoute> routes = [];
  List<NavigatorObserver> observers = [];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: initialRoute,
      observers: observers,
      onGenerateRoute: (routeSettings) {
        _arguments = routeSettings.arguments == null ? {} : routeSettings.arguments as Map;
        return routes.firstWhereOrNull((element) => element.routeName == routeSettings.name);
      },
    );
  }
}
