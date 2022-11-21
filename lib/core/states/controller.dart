part of '../../android_core.dart';

///
/// Core controller has 4 components
/// each component is optional
/// if you dont wanna use it, just set it to null (add ? after the type)
///
abstract class CoreController<P extends CoreProperty?, L extends CoreListener?, D extends CoreDataSource?, F extends CoreFormSource?> extends GetxController {
  String id = const Uuid().v4();
  void Function(Duration)? onPostFrame;

  late P property;
  late L listener;
  late D dataSource;
  late F formSource;

  ///
  /// if property is optional, set it to null
  ///
  P propertyBuilder();

  ///
  /// if listener is optional, set it to null
  ///
  L listenerBuilder();

  ///
  /// if dataSource is optional, set it to null
  ///
  D dataSourceBuilder();

  ///
  /// if formSource is optional, set it to null
  ///
  F formSourceBuilder();

  ///
  /// use init method only when you need to initialize lateable variables
  /// if you dont, use ready method instead
  /// in this method datasource, listener and property will be initialized, and not ready to use yet
  ///
  @mustCallSuper
  void init() {
    listener = listenerBuilder();
    property = propertyBuilder();
    dataSource = dataSourceBuilder();
    formSource = formSourceBuilder();

    property?.init();
    dataSource?.init();
    formSource?.init();
  }

  ///
  /// ready method will called when controller is ready (in first Get.find)
  /// usually you want to use this method to get data from api, initialize view controller, or modify view
  ///
  @mustCallSuper
  void ready() {
    property?.ready();
    dataSource?.ready();
    formSource?.ready();
  }

  @mustCallSuper
  void close() {
    dataSource?.close();
    property?.close();
    formSource?.close();
  }

  void refreshStates() {
    onPostFrame ??= (_) {
      ready();
    };
    SchedulerBinding.instance.addPostFrameCallback(onPostFrame!);
    close();
    init();
    update([id]);
  }

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onReady() {
    super.onReady();
    ready();
  }

  @override
  void onClose() {
    close();
    super.onClose();
  }
}
