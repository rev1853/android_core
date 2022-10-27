class Menu<T extends Enum> {
  T name;
  String? route;
  Map<String, dynamic>? arguments;
  Menu(this.name, {this.route, this.arguments});

  @override
  String toString() {
    if (route != null) {
      return "${name.toString()}, $route";
    }
    return name.toString();
  }
}
