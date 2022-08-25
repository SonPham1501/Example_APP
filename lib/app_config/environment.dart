import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/ultis/helpers/logger.dart';
import '../injection.dart';
import 'my_app.dart';

enum EnvType { DEVELOPMENT, STAGING, PRODUCTION, TESTING }

class Environment {
  static Environment? value;

  late String BASE_URL;
  late String SSO_BASE_URL;
  late String GRAPHQL_ENDPOINT;
  late String APP_NAME;

  EnvType environmentType = EnvType.DEVELOPMENT;

  Environment() {
    value = this;
    _init();
  }

  Future _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    //final binding = AutoSizeWidgetsFlutterBinding.ensureInitialized();
    _initOrientations();
    //await Firebase.initializeApp();
    configureDependencies();
    Xlogger.setEnvironment(environmentType != EnvType.PRODUCTION);
    WidgetsBinding.instance
      ..attachRootWidget(const App())
      ..scheduleWarmUpFrame();
  }

  void _initOrientations() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }
}
