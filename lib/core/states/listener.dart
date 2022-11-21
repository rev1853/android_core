part of '../../android_core.dart';

typedef FormlessListenerMixin<C extends CoreController, P extends CoreProperty?, D extends CoreDataSource?> = CoreListenerMixin<C, P, D, CoreFormSource?>;

abstract class CoreListener {}

mixin CoreListenerMixin<C extends CoreController, P extends CoreProperty?, D extends CoreDataSource?, F extends CoreFormSource?> {
  C get _state => Get.find<C>();

  @protected
  String get stateID => _state.id;

  @protected
  P get property => _state.property as P;

  @protected
  D get dataSource => _state.dataSource as D;

  @protected
  F get formSource => _state.formSource as F;
}
