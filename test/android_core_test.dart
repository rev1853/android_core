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

  Test(this.builder);

  T get run => builder(catcher);

  FunctionCatcher catcher = FunctionCatcher((posArgs, namedArgs) {
    print(posArgs);
    print(namedArgs);
  });
}

void main() {
  Test<Function(String)> test = Test((catcher) => (arg) => catcher(arg));
  test.run('tes');
}
