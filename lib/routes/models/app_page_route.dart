import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'bindings.dart';

class AppPageRoute {
  final String name;
  final PageTransitionType? transition;
  final Duration? transitionDuration;
  final Widget Function() page;
  final Bindings? binding;
  final List<Bindings>? bindings;
  final List<AppPageRoute>? children;

  AppPageRoute({
    required this.name,
    this.transition,
    required this.page,
    this.binding,
    this.bindings,
    this.children,
    this.transitionDuration,
  });
}
