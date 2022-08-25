import 'di.dart';

class AppRootBinding extends Bindings {
  @override
  void dependencies() {
    // putLazy(() => UploadController());

    // putLazy<ClassController>(() => ClassController(getIt<ClassRepository>()),
    //     singleton: true);
  }
}
