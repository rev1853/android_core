part of '../../android_core.dart';

abstract class ViewNavigator extends StatelessWidget {
  GlobalKey<NavigatorState> navigatorKey;
  String initialRoute;
  List<ViewRoute> routes;

  ViewNavigator({required this.navigatorKey, this.routes = const [], this.initialRoute = '/'});

  // current arguments and settings
  Map _arguments = {};
  Map get arguments => _arguments;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: initialRoute,
      onGenerateRoute: (routeSettings) {
        _arguments = routeSettings.arguments == null ? {} : routeSettings.arguments as Map;
        if (routes.any((e) => e.routeName == routeSettings.name)) {
          return routes.firstWhere((element) => element.routeName == routeSettings.name);
        }
        return null;
      },
    );
  }
}
