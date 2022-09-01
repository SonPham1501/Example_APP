part of './app_router.dart';

enum AppTab { first, second }

final List<BottomNavigationItem> _bottomNavigationItems = [
  BottomNavigationItem(
    id: AppTab.first,
    icon: const Icon(Icons.home),
    activeIcon: const Icon(Icons.home),
    label: 'Bài tập vận dụng',
    page: (BuildContext ctx) => const FirstScreen(),
    navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'first_page_key'),
  ),
  BottomNavigationItem(
    id: AppTab.second,
    icon: const Icon(Icons.book),
    activeIcon: const Icon(Icons.book),
    label: 'Bài tập kiểm tra',
    page: (BuildContext ctx) => const SecondScreen(),
    navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'second_screen_key'),
  ),
];
