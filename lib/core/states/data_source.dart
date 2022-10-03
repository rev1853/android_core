part of '../../android_core.dart';

typedef FormlessDataSourceMixin<C extends CoreController, P extends CoreProperty?, L extends CoreListener?> = CoreDataSourceMixin<C, P, L, CoreFormSource?>;

abstract class CoreDataSource<T> {
  late T presenter;

  T presenterBuilder();

  @mustCallSuper
  init() {
    presenter = presenterBuilder();
  }

  @mustCallSuper
  ready() {}

  @mustCallSuper
  close() {}
}

mixin CoreDataSourceMixin<C extends CoreController, P extends CoreProperty?, L extends CoreListener?, F extends CoreFormSource?> {
  C get _state => Get.find<C>();

  @protected
  String get stateID => _state.id;

  @protected
  P get property => _state.property as P;

  @protected
  L get listener => _state.listener as L;

  @protected
  F get formSource => _state.formSource as F;
}
