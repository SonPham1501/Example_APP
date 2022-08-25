part of './app_router.dart';

enum AppTab { first }

final List<BottomNavigationItem> _bottomNavigationItems = [
  BottomNavigationItem(
    id: AppTab.first,
    icon: const Icon(Icons.home),
    activeIcon: const Icon(Icons.home),
    label: 'Bài tập vận dụng',
    page: (BuildContext ctx) => const FirstScreen(),
    navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'home_page_key'),
  ),
];
