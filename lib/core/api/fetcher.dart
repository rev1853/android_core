part of '../../android_core.dart';

///
/// type parameters
/// [T] => param for Function
/// [S] =>param for result type
///
class DataFetcher<T extends Function> {
  late Contract contract;
  late final FunctionCatcher _functionCatcher = FunctionCatcher(_run);

  ///
  /// [source] must return [Future<Response>]
  ///
  T source;

  ///
  /// you have return catcher as called function [catcher(args)]
  ///
  T Function(dynamic catcher) requestCatcher;

  DataFetcher({required this.requestCatcher, required this.source});

  T get run => requestCatcher(_functionCatcher);
  void _run(List<dynamic> posArgs, Map<Symbol, dynamic> namedArgs) async {
    contract.onStart();
    try {
      Response response = await (Function.apply(source, posArgs, namedArgs) as Future<Response>);
      if (response.isOk) {
        contract.onSuccess(response);
      } else {
        contract.onFailed(response);
      }
    } catch (e) {
      contract.onError(e.toString());
    }
    contract.onComplete();
  }
}
