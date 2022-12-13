typedef _Catcher = dynamic Function(List positionalArgs, Map<Symbol, dynamic> namedArgs);

class FunctionCatcher {
  _Catcher _onCall;

  FunctionCatcher(this._onCall);

  @override
  noSuchMethod(Invocation invocation) {
    final positionalArgs = invocation.positionalArguments;
    final namedArgs = invocation.namedArguments;
    return _onCall(positionalArgs, namedArgs);
  }
}

class Test<T extends Function> {
  T Function(dynamic catcher) builder;
  T func;

  Test({
    required this.builder,
    required this.func,
  });

  T get run => builder(catcher);

  late FunctionCatcher catcher = FunctionCatcher((posArgs, namedArgs) {
    var tes = Function.apply(func, posArgs, namedArgs);
    print(tes);
  });
}

void main() {
  Test<Function(String, {required String go})> test = Test(
    builder: (catcher) => (arg, {required String go}) => catcher(arg, go: go),
    func: (tes, {required String go}) => go,
  );
  test.run('tes', go: 'number 1');
}
