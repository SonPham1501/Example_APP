import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../empty_widget.dart';

class CustomSliverListView<T> extends StatelessWidget {
  final PagingController<int, T> controller;
  final Widget Function(BuildContext, T, int) builder;
  final Widget? emptyWidget;
  final Widget? firstPageProgressIndicator;
  final bool shrinkWrapFirstPageIndicators;
  final VoidCallback? onRefresh;
  final double? itemExtent;
  final Color? loadingBackgroundColor;
  CustomSliverListView({
    required this.controller,
    required this.builder,
    this.emptyWidget,
    this.shrinkWrapFirstPageIndicators = false,
    this.onRefresh,
    this.itemExtent,
    this.loadingBackgroundColor,
    this.firstPageProgressIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return PagedSliverList<int, T>(
      pagingController: controller,
      itemExtent: itemExtent,
      shrinkWrapFirstPageIndicators: shrinkWrapFirstPageIndicators,
      builderDelegate: PagedChildBuilderDelegate<T>(
        itemBuilder: builder,
        noItemsFoundIndicatorBuilder: (_) => emptyWidget ?? EmptyWidget(),
        firstPageProgressIndicatorBuilder: (_) =>
            firstPageProgressIndicator ??
            Container(
              color: loadingBackgroundColor ?? Colors.transparent,
              height: 200,
              child: Center(
                child: Platform.isIOS
                    ? const CupertinoActivityIndicator()
                    : const CircularProgressIndicator(),
              ),
            ),
        firstPageErrorIndicatorBuilder: (_) => Column(
          children: [
            Text(controller.error),
            ElevatedButton(
              child: Text('Tải lại trang'),
              onPressed: onRefresh ?? () => controller.refresh(),
            )
          ],
        ),
      ),
    );
  }
}

class CustomListView<T> extends StatelessWidget {
  final PagingController<int, T> controller;
  final Widget Function(BuildContext, T, int) builder;
  final Widget emptyWidget;
  final Widget? firstPageProgressIndicator;
  final bool shrinkWrap;
  final VoidCallback? onRefresh;
  final ScrollPhysics? physics;
  final ScrollController? scrollController;
  final EdgeInsets? padding;
  CustomListView(
      {required this.controller,
      required this.builder,
      this.emptyWidget = const SizedBox.shrink(),
      this.shrinkWrap = false,
      this.onRefresh,
      this.physics,
      this.scrollController,
      this.padding,
      this.firstPageProgressIndicator});

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, T>(
      scrollController: scrollController,
      pagingController: controller,
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding,
      builderDelegate: PagedChildBuilderDelegate<T>(
        itemBuilder: builder,
        noItemsFoundIndicatorBuilder: (_) => emptyWidget,
        firstPageProgressIndicatorBuilder: (_) =>
            firstPageProgressIndicator ??
            SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        firstPageErrorIndicatorBuilder: (_) => Column(
          children: [
            Text(controller.error),
            ElevatedButton(
              child: Text('Click to reload'),
              onPressed: onRefresh ?? () => controller.refresh(),
            )
          ],
        ),
      ),
    );
  }
}

class CustomSliverListViewSeparated<T> extends StatelessWidget {
  final PagingController<int, T> controller;
  final Widget Function(BuildContext, T, int) builder;
  final Widget Function(BuildContext, int) separatorBuilder;
  final Widget? emptyWidget;
  final Widget? firstPageProgressIndicator;
  final bool shrinkWrapFirstPageIndicators;
  final VoidCallback? onRefresh;
  final double? itemExtent;
  final Color? loadingBackgroundColor;
  CustomSliverListViewSeparated({
    required this.controller,
    required this.builder,
    this.emptyWidget,
    this.shrinkWrapFirstPageIndicators = false,
    this.onRefresh,
    this.itemExtent,
    this.loadingBackgroundColor,
    required this.separatorBuilder,
    this.firstPageProgressIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return PagedSliverList<int, T>.separated(
      pagingController: controller,
      itemExtent: itemExtent,
      shrinkWrapFirstPageIndicators: shrinkWrapFirstPageIndicators,
      separatorBuilder: separatorBuilder,
      builderDelegate: PagedChildBuilderDelegate<T>(
        itemBuilder: builder,
        noItemsFoundIndicatorBuilder: (_) => emptyWidget ?? EmptyWidget(),
        firstPageProgressIndicatorBuilder: (_) =>
            firstPageProgressIndicator ??
            Container(
              color: loadingBackgroundColor ?? Colors.transparent,
              height: 200,
              child: Center(
                child: Platform.isIOS
                    ? const CupertinoActivityIndicator()
                    : const CircularProgressIndicator(),
              ),
            ),
        firstPageErrorIndicatorBuilder: (_) => Column(
          children: [
            Text(controller.error),
            ElevatedButton(
              child: Text('Click to reload'),
              onPressed: onRefresh ?? () => controller.refresh(),
            )
          ],
        ),
      ),
    );
  }
}

class CustomListViewSeparated<T> extends StatelessWidget {
  final PagingController<int, T> controller;
  final Widget Function(BuildContext, T, int) builder;
  final Widget Function(BuildContext, int) separatorBuilder;
  final Widget emptyWidget;
  final Widget? firstPageProgressIndicator;
  final bool shrinkWrap;
  final VoidCallback? onRefresh;
  final ScrollPhysics? physics;
  final ScrollController? scrollController;
  final EdgeInsets? padding;

  CustomListViewSeparated({
    required this.controller,
    required this.builder,
    required this.separatorBuilder,
    this.emptyWidget = const SizedBox.shrink(),
    this.shrinkWrap = false,
    this.onRefresh,
    this.physics,
    this.scrollController,
    this.padding,
    this.firstPageProgressIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, T>.separated(
      scrollController: scrollController,
      pagingController: controller,
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding,
      builderDelegate: PagedChildBuilderDelegate<T>(
        itemBuilder: builder,
        noItemsFoundIndicatorBuilder: (_) => emptyWidget,
        firstPageProgressIndicatorBuilder: (_) =>
            firstPageProgressIndicator ??
            SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        firstPageErrorIndicatorBuilder: (_) => Column(
          children: [
            Text(controller.error),
            ElevatedButton(
              child: Text('Click to reload'),
              onPressed: onRefresh ?? () => controller.refresh(),
            )
          ],
        ),
      ),
      separatorBuilder: separatorBuilder,
    );
  }
}

class CustomSliverGridView<T> extends StatelessWidget {
  final PagingController<int, T> controller;
  final Widget Function(BuildContext, T, int) builder;
  final Widget? emptyWidget;
  final Widget? firstPageProgressIndicator;
  final bool shrinkWrapFirstPageIndicators;
  final VoidCallback? onRefresh;
  final double? itemExtent;
  final Color? loadingBackgroundColor;
  final SliverGridDelegate delegate;
  CustomSliverGridView({
    required this.controller,
    required this.builder,
    required this.delegate,
    this.emptyWidget,
    this.shrinkWrapFirstPageIndicators = false,
    this.onRefresh,
    this.itemExtent,
    this.loadingBackgroundColor,
    this.firstPageProgressIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return PagedSliverGrid<int, T>(
      pagingController: controller,
      shrinkWrapFirstPageIndicators: shrinkWrapFirstPageIndicators,
      builderDelegate: PagedChildBuilderDelegate<T>(
        itemBuilder: builder,
        noItemsFoundIndicatorBuilder: (_) => emptyWidget ?? EmptyWidget(),
        firstPageProgressIndicatorBuilder: (_) =>
            firstPageProgressIndicator ??
            Container(
              color: loadingBackgroundColor ?? Colors.transparent,
              height: 200,
              child: Center(
                child: Platform.isIOS
                    ? const CupertinoActivityIndicator()
                    : const CircularProgressIndicator(),
              ),
            ),
        firstPageErrorIndicatorBuilder: (_) => Column(
          children: [
            Text(controller.error),
            ElevatedButton(
              child: Text('Tải lại trang'),
              onPressed: onRefresh ?? () => controller.refresh(),
            )
          ],
        ),
      ),
      gridDelegate: delegate,
    );
  }
}

class CustomGridView<T> extends StatelessWidget {
  final PagingController<int, T> controller;
  final Widget Function(BuildContext, T, int) builder;
  final Widget? emptyWidget;
  final Widget? firstPageProgressIndicator;
  final bool shrinkWrapFirstPageIndicators;
  final VoidCallback? onRefresh;
  final double? itemExtent;
  final Color? loadingBackgroundColor;
  final SliverGridDelegate delegate;
  CustomGridView({
    required this.controller,
    required this.builder,
    required this.delegate,
    this.emptyWidget,
    this.shrinkWrapFirstPageIndicators = false,
    this.onRefresh,
    this.itemExtent,
    this.loadingBackgroundColor,
    this.firstPageProgressIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, T>(
      pagingController: controller,
      builderDelegate: PagedChildBuilderDelegate<T>(
        itemBuilder: builder,
        noItemsFoundIndicatorBuilder: (_) => emptyWidget ?? EmptyWidget(),
        firstPageProgressIndicatorBuilder: (_) =>
            firstPageProgressIndicator ??
            Container(
              color: loadingBackgroundColor ?? Colors.transparent,
              height: 200,
              child: Center(
                child: Platform.isIOS
                    ? const CupertinoActivityIndicator()
                    : const CircularProgressIndicator(),
              ),
            ),
        firstPageErrorIndicatorBuilder: (_) => Column(
          children: [
            Text(controller.error),
            ElevatedButton(
              child: Text('Tải lại trang'),
              onPressed: onRefresh ?? () => controller.refresh(),
            )
          ],
        ),
      ),
      gridDelegate: delegate,
    );
  }
}
