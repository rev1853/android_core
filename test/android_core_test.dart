typedef dynamic OnCall(List l);

class VarargsFunction {
  OnCall _onCall;

  VarargsFunction(this._onCall);

  call() => _onCall([]);

  noSuchMethod(Invocation invocation) {
    final arguments = invocation.positionalArguments;
    return _onCall(arguments);
  }
}

class A<T extends Function> {
  final myMethod = VarargsFunction((arguments) => print(arguments));
  T Function(VarargsFunction) func;

  A(this.func);

  T get foil => func(myMethod);
}

main() {
  A<Function(String)> a = A(
    (vovo1) {
      return (tes) => (vovo1 as dynamic)(tes);
    },
  );
  a.foil('tes');
}
