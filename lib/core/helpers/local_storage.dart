part of '../../android_core.dart';

class LocalStorage {
  GetStorage get container => GetStorage(Env.get("APP_NAME")!);

  ReadWriteValue<T?> getItemStorage<T>(String name, [T? defaultValue]) => ReadWriteValue<T?>(name, defaultValue, () => container);

  void put<T>(String name, T? value) {
    getItemStorage<T>(name).val = value;
  }

  ///
  /// get single item from value, the item data type will be `T`
  ///
  T? take<T>(String name) {
    return getItemStorage<T>(name).val;
  }
}
