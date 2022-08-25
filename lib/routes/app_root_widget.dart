import 'package:flutter/material.dart';
import 'package:test_app/core/ultis/helpers/helpers.dart';
import '../core/config/palette.dart';
import '../injection.dart';
import 'app_pages.dart';
import 'models/bottom_navigation_item.dart';
import 'models/models.dart';
import './router/app_router.dart';

class AppRootWidget extends StatefulWidget {
  //final controller = Get.put(AppRootController(), permanent: true);
  @override
  State<AppRootWidget> createState() => _AppRootWidgetState();
}

class _AppRootWidgetState extends AppRootController {
  @override
  Widget build(BuildContext context) {
    //  print('AppRootWidget build');
    return WillPopScope(
      onWillPop: () async {
        final result = await currentItem.navigatorKey.currentState?.maybePop();
        if (result != null) return !result;
        return false;
      },
      child: Container(
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: IndexedStack(
            index: _bottomNavigationItems.indexOf(currentItem),
            children: pages,
          ),
          bottomNavigationBar: BottomNavStyle1(
            selectedIndex: _bottomNavigationItems.indexOf(currentItem),
            onSelectionChanged: onSelectTab,
          ),
        ),
      ),
    );
  }
}

class AppRootController extends State<AppRootWidget> {
  List<Widget> _pages = [];
  final List<BottomNavigationItem> _bottomNavigationItems =
      AppRouter.bottomNavigationItems;
  List<Widget> get pages => _pages;
  BottomNavigationItem? _currentItem;

  set currentItem(BottomNavigationItem val) {
    setState(() {
      _currentItem = val;
    });
  }

  BottomNavigationItem get currentItem =>
      _currentItem ?? _bottomNavigationItems.first;
  int currentBadgeCount = 0;

  bool loading = true;
  //bool loaded = false;
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    _pages = _bottomNavigationItems
        .map((e) => e.id != currentItem.id
            ? const SizedBox()
            : _buildNavigator(currentItem))
        .toList();
    // Xlogger.d(_pages);
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  final AppTab _currentTab = AppTab.first;

  int get currentTab => _currentTab.index;

  void onSelectTab(int index) {
    if (index == _bottomNavigationItems.indexOf(currentItem)) {
      currentItem.navigatorKey.currentState?.popUntil((route) => route.isFirst);
    } else {
      if (_pages[index] is SizedBox) {
        _pages[index] = _buildNavigator(_bottomNavigationItems[index]);
      }
      currentItem = _bottomNavigationItems[index];
    }

    //reload notification
    // if (index == 3 && Get.isRegistered<NotificationPageController>()) {
    //   final _notiController = Get.find<NotificationPageController>();
    //   _notiController.refresh();
    // }
  }

  GlobalKey<NavigatorState>? get currentNavigatorKey =>
      _pages[currentItem.id.index] is SizedBox
          ? null
          : currentItem.navigatorKey;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

Widget _buildNavigator(BottomNavigationItem item) {
  //return item.page;
//  Xlogger.d(item.navigatorKey);
  return Navigator(
    key: item.navigatorKey,
    onGenerateRoute: (settings) => generate(settings, item),
    initialRoute: '/',
  );
}

Route? generate(RouteSettings settings, BottomNavigationItem item) {
  //print('route in app root: ${settings.name}');

  final AppPageRoute _targetRoute = AppPages.routes.firstWhere(
      (route) => route.name == settings.name,
      orElse: () => AppPages.NOT_FOUND_PAGE);
  if (_targetRoute.name == Routes.NOTFOUND) {
    return MaterialPageRoute(builder: (ctx) => item.page(ctx));
  }
  final Widget _targetPage = _targetRoute.page();
  appRouter.arguments = settings.arguments;
  appRouter.currentRoute = settings.name;
  if (_targetRoute.binding != null) {
    _targetRoute.binding?.dependencies();
  }
  if (_targetRoute.bindings != null) {
    for (var i = 0; i < _targetRoute.bindings!.length; i++) {
      _targetRoute.bindings![i].dependencies();
    }
  }
  return MaterialPageRoute(builder: (_) => _targetPage);
}

class BottomNavStyle1 extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelectionChanged;

  BottomNavStyle1({
    required this.selectedIndex,
    required this.onSelectionChanged,
  });

  Widget _buildItem(BottomNavigationItem item, bool isSelected) {
    return AnimatedContainer(
      width: 120,
      height: 48,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
      // padding: EdgeInsets.all(item.contentPadding),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryDark : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Container(
        alignment: Alignment.center,
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconTheme(
                  data: const IconThemeData(
                    size: 24,
                    color: Colors.white,
                  ),
                  child: isSelected ? item.activeIcon : item.icon,
                ),
              ),
            ),
            isSelected
                ? Flexible(
                    child: Material(
                      type: MaterialType.transparency,
                      child: FittedBox(
                        child: Text(
                          item.label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.border),
        ),
      ),
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: AppRouter.bottomNavigationItems.map((item) {
          int index = AppRouter.bottomNavigationItems.indexOf(item);
          return Flexible(
            flex: selectedIndex == index ? 2 : 1,
            child: GestureDetector(
              onTap: () {
                onSelectionChanged(index);
                // if (_bottomNavigationItems[index].onPressed != null) {
                //   this.navBarEssentials!.items![index].onPressed!(
                //       this.navBarEssentials!.selectedScreenBuildContext);
                // } else {
                //   this.navBarEssentials!.onItemSelected!(index);
                // }
              },
              child: _buildItem(
                item,
                selectedIndex == index,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
