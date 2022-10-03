part of '../../android_core.dart';

typedef FormlessPropertyMixin<C extends CoreController, L extends CoreListener?, D extends CoreDataSource?> = CorePropertyMixin<C, L, D, CoreFormSource?>;

abstract class CoreProperty {
  // argument from route
  Map<dynamic, dynamic>? arguments;

  @mustCallSuper
  void init() {}

  @mustCallSuper
  void ready() {}

  @mustCallSuper
  void close() {}
}

mixin CorePropertyMixin<C extends CoreController, L extends CoreListener?, D extends CoreDataSource?, F extends CoreFormSource?> {
  C get _state => Get.find<C>();

  @protected
  String get stateID => _state.id;

  @protected
  L get listener => _state.listener as L;

  @protected
  D get dataSource => _state.dataSource as D;

  @protected
  F get formSource => _state.formSource as F;
}
