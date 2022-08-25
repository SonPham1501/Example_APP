import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../first_screen.dart';
import 'app_root_binding.dart';
import 'app_root_widget.dart';
import 'models/models.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.APP_ROOT;
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
      page: () => AppRootWidget(),
      binding: AppRootBinding(),
    ),
    AppPageRoute(
      name: Routes.EXERCISE,
      transition: PageTransitionType.fade,
      page: () => const FirstScreen(),
    ),
  ];
}
