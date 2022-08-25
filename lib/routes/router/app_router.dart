import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_app/first_screen.dart';
import '../../injection.dart';
import '../app_pages.dart';
import '../di.dart';
import '../models/bottom_navigation_item.dart';

part './router_constants.dart';

abstract class AppRouter {
  set arguments(dynamic val);

  set currentRoute(String? val);

  dynamic get arguments;

  String? get currentRoute;

  GlobalKey<NavigatorState> get navigatorKey;

  BuildContext? get context;

  Future<T?>? popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  });

  Future<T?>? pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  });

  Future<T?>? pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  });

  Future<T?>? pushReplacement<T extends Object?, TO extends Object?>(
      Widget page,
      {TO? result});
  void popUntil(bool Function(Route<dynamic>) predicate);
  Future<T?>? push<T>(Widget page);

  void pop<T extends Object?>([T? result]);

  static List<AppPageRoute> routes = AppPages.routes;

  static String initalRoute = AppPages.INITIAL;

  static final AppRouter _instance = AppRouterImpl();

  static AppRouter get instance => _instance;

  static List<BottomNavigationItem> get bottomNavigationItems =>
      _bottomNavigationItems;

  static Route<dynamic>? Function(RouteSettings)? onGenerateRoute =
      (RouteSettings settings) {
    if (settings.name == '/') {
      return null;
    }
    final AppPageRoute _targetRoute = AppPages.routes.firstWhere(
        (route) => route.name == settings.name,
        orElse: () => AppPages.NOT_FOUND_PAGE);

    appRouter.arguments = settings.arguments;
    appRouter.currentRoute = settings.name;
    if (_targetRoute.binding != null) {
      // print(settings.name);

      _targetRoute.binding?.dependencies();
    }
    if (_targetRoute.bindings != null) {
      for (var i = 0; i < _targetRoute.bindings!.length; i++) {
        _targetRoute.bindings![i].dependencies();
      }
    }
    //print('route: ${settings.name}');

    final Widget _targetPage = _targetRoute.page();

    if (_targetRoute.transition != null) {
      return PageTransition(
        child: _targetPage,
        type: _targetRoute.transition!,
        settings: settings,
      );
    }
    return MaterialPageRoute(builder: (_) => _targetPage, settings: settings);
  };

  static GlobalKey<NavigatorState> getNavigatorKey(AppTab appTab) =>
      _bottomNavigationItems
          .where((element) => element.id == appTab)
          .first
          .navigatorKey;
}

class AppRouterImpl implements AppRouter {
  dynamic _arguments;
  String? _currentRoute;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  dynamic get arguments => _arguments;

  @override
  set arguments(dynamic val) {
    _arguments = val;
  }

  @override
  String? get currentRoute => _currentRoute;

  @override
  set currentRoute(String? val) {
    _currentRoute = val;
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  BuildContext? get context => _navigatorKey.currentContext;

  @override
  Future<T?>? popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _navigatorKey.currentState
        ?.popAndPushNamed(routeName, result: result, arguments: arguments);
  }

  @override
  Future<T?>? pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return _navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<T?>? push<T>(Widget page) {
    return _navigatorKey.currentState
        ?.push(MaterialPageRoute<T>(builder: (_) => page));
  }

  @override
  Future<T?>? pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _navigatorKey.currentState
        ?.pushReplacementNamed(routeName, result: result, arguments: arguments);
  }

  @override
  void pop<T extends Object?>([T? result]) {
    _navigatorKey.currentState?.pop(result);
  }

  @override
  Future<T?>? pushReplacement<T extends Object?, TO extends Object?>(
      Widget page,
      {TO? result}) {
    return _navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute<T>(builder: (_) => page),
        result: result);
  }

  @override
  void popUntil(bool Function(Route<dynamic>) predicate) {
    _navigatorKey.currentState?.popUntil(predicate);
  }
}
