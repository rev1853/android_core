part of '../../android_core.dart';

abstract class CoreFormSource {
  void onSubmit();

  @mustCallSuper
  void init() {}

  @mustCallSuper
  void ready() {}

  @mustCallSuper
  void close() {}

  Map<String, dynamic> toJson();
}

mixin CoreFormSourceMixin<C extends CoreController, P extends CoreProperty?, L extends CoreListener?, D extends CoreDataSource?> {
  C get _state => Get.find<C>();

  @protected
  String get stateID => _state.id;

  @protected
  P get property => _state.property as P;

  @protected
  L get listener => _state.listener as L;

  @protected
  D get dataSource => _state.dataSource as D;
}
