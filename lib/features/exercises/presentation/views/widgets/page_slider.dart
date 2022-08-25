
import 'package:flutter/material.dart';

class PageSlider extends StatelessWidget {
  final List<Widget> page;
  final Size? size;
  final Color? backgroundColor;
  final bool navigatorOverview;
  final PageController pageController;
  final Function(int)? onPageChanged;

  const PageSlider({
    Key? key,
    required this.pageController,
    required this.page,
    this.onPageChanged,
    this.size,
    this.backgroundColor,
    this.navigatorOverview = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size?.width ?? double.infinity,
      height: size?.height ?? double.infinity,
      child: _buildPageView(context),
    );
  }

  Widget _buildPageView(BuildContext context) {
    if (page.isEmpty) return _buildImageDefault(context);
    return PageView(
      physics: const BouncingScrollPhysics(),
      controller: pageController,
      onPageChanged: onPageChanged,
      children: List.generate(
        page.length,
        (index) => page[index],
      ),
    );
  }

  Widget _buildImageDefault(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: ColoredBox(
        color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        child: const Center(
          child: Text('NO PAGE!'),
        ),
      ),
    );
  }
}
