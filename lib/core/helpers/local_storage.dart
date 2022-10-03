part of '../../android_core.dart';

class LocalStorage {
  GetStorage get container => GetStorage("VentesAuth");

  ReadWriteValue<T?> getItemStorage<T>(String name, [T? defaultValue]) => ReadWriteValue<T?>(name, defaultValue, () => container);

  void put<T>(String name, T? value) {
    getItemStorage<T>(name).val = value;
  }

  T? take<T>(String name) {
    return getItemStorage<T>(name).val;
  }
}
