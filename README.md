# ANDROID CORE

Android core

## UPDATE

- **Provider**, add request modifier property, you can customize request before it sends, you must put provider instance to controller cache by creating provider bootstrap
```dart
Provider provider = Provider();
provider.requestModifier = (request) async {
   String? authenticationCode = Get.find<LocalStorage>().take<String>('authorization');
   if (authenticationCode != null) request.headers['Authorization'] = "Bearer $authenticationCode";
   return request;
}
```


