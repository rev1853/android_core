import 'package:android_core/core/helpers/routing/menu.dart';
import 'package:get/get.dart';

class Router<T extends Enum> {
  late T defaultMenu;

  Router({required Menu<T> initialMenu}) {
    _menu = Rx(initialMenu);
    defaultMenu = _menu.value.name;
  }

  late final Rx<Menu<T>> _menu;
  Menu<T> get menu => _menu.value;
  Menu<T>? lastMenu;

  void to(Menu<T> newMenu) {
    if (newMenu.route != null) {
      if (lastRouteOf(newMenu.name) != newMenu.route) {
        Get.toNamed(newMenu.route!, id: newMenu.name.index);
      }
    }

    debugGo(menu, newMenu);
    lastMenu = menu;
    _menu.value = newMenu;
  }

  void back([Menu<T>? previousMenu]) {
    Menu<T> newMenu = menu;
    bool canBack = false;
    bool canPop = previousMenu != null ? previousMenu.name == menu.name : menu.name == lastMenu?.name;

    if (canPop) {
      Get.until((route) {
        newMenu = Menu(menu.name, route: route.settings.name);

        bool result = route.settings.name == previousMenu?.route;
        if (previousMenu == null) result = canBack;
        canBack = true;

        return result;
      }, id: previousMenu?.name.index ?? menu.name.index);
    }

    debugBack(menu, newMenu);
    lastMenu = null;
    _menu.value = newMenu;
  }

  String? lastRouteOf(T menuName) {
    String? lastRoute;
    Get.until((route) {
      lastRoute ??= route.settings.name!;
      return true;
    }, id: menuName.index);
    return lastRoute;
  }

  void debugBack(Menu<T>? from, Menu<T>? to) {
    printDebug(from, to, "back");
  }

  void debugGo(Menu<T>? from, Menu<T>? to) {
    printDebug(from, to, "go");
  }

  void printDebug(Menu<T>? from, Menu<T>? to, String middleFix) {
    String? fromString = from?.toString();
    String? toString = to?.toString();
    print("[ROUTE] ${fromString ?? 'nowhere'} $middleFix to ${toString ?? 'nowhere'}");
  }
}
