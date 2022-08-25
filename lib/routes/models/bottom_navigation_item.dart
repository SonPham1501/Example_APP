import 'package:flutter/material.dart';

import '../router/app_router.dart';

class BottomNavigationItem {
  BottomNavigationItem({
    required this.id,
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.page,
    required this.navigatorKey,
  });

  final AppTab id;
  final String label;
  final Widget icon;
  final Widget activeIcon;
  final Widget Function(BuildContext ctx) page;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  String toString() {
    return 'BottomNavigationItem(id: $id, label: $label, icon: $icon, activeIcon: $activeIcon, page: $page, navigatorKey: $navigatorKey)';
  }
}
