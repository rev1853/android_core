part of '../../android_core.dart';

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
