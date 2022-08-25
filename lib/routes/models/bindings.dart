import '../../injection.dart';

abstract class Bindings {
  // Bindings() {
  //   dependencies();
  // }
  void dependencies();
  void put<T extends Object>(
    T instance, {
    bool singleton = false,
    String? tag,
  }) {
    if (getIt.isRegistered<T>(instanceName: tag)) return;
    getIt.registerSingleton<T>(instance, instanceName: tag);
  }

  void putLazy<T extends Object>(
    T Function() factoryFunc, {
    bool singleton = false,
    String? tag,
  }) {
    if (getIt.isRegistered<T>(instanceName: tag)) {
      return;
      // if (singleton) {
      //   return;
      // } else {
      //   //getIt.unregister<T>(instanceName: tag);
      //   //final _scope = getIt<T>(instanceName: tag);
      // }
    }
    if (singleton) {
      getIt.registerLazySingleton<T>(factoryFunc, instanceName: tag);
    } else {
      getIt.registerFactory(factoryFunc, instanceName: tag);
    }
  }
}
