part of '../android_core.dart';

class CoreBootstrap implements Booter {
  Widget app;
  List<Booter> bootstraps;

  CoreBootstrap(
    this.app, [
    this.bootstraps = const [],
  ]);

  Future run() async {
    await preRun();
    runApp(app);
    await postRun();
  }

  @override
  Future preRun() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Env.load();

    await GetStorage.init();
    LocalStorage storage = LocalStorage();
    storage.container.initStorage;
    Get.lazyPut(() => LocalStorage());

    // run all bootstraps prerun
    for (var element in bootstraps) {
      await element.preRun();
    }
  }

  @override
  Future postRun() async {
    // run all bootstraps prerun
    for (var element in bootstraps) {
      await element.postRun();
    }
  }
}
