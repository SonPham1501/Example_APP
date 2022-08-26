// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../first_screen.dart';
import 'app_root_binding.dart';
import 'app_root_widget.dart';
import 'models/models.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.APP_ROOT;
  // ignore: non_constant_identifier_names
  static AppPageRoute NOT_FOUND_PAGE = AppPageRoute(
    name: Routes.NOTFOUND,
    transition: PageTransitionType.fade,
    page: () => const Scaffold(
      body: Center(
        child: Text('notfound'),
      ),
    ),
  );
  static final List<AppPageRoute> routes = [
    AppPageRoute(
      name: Routes.APP_ROOT,
      page: () => const AppRootWidget(),
      binding: AppRootBinding(),
    ),
    AppPageRoute(
      name: Routes.EXERCISE,
      transition: PageTransitionType.fade,
      page: () => const FirstScreen(),
    ),
  ];
}
