import 'package:flutter/material.dart';

abstract class BottomSheetUtil {
  static Future<T?> buildBaseButtonSheet<T>(BuildContext context, {
    required Widget child,
    bool isScroll = true,
    Color? color,
    Color? barrierColor,
    bool isDismissible = false,
  }) async {
    final T? _res = await showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: isScroll,
      backgroundColor: color,
      barrierColor: barrierColor,
      isDismissible: isDismissible,
      builder: (c) => child,
    );
    return _res;
  }

  static Future<T?> buildRatioButtonSheet<T>(BuildContext context, {
    required Widget child,
    double ratio = 0.9,
    bool isScroll = true,
    Color? color,
    Color? barrierColor,
    bool isDismissible = false,
  }) async {
    final T? _res = await showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: isScroll,
      backgroundColor: color,
      barrierColor: barrierColor,
      isDismissible: isDismissible,
      builder: (c) => SizedBox(
        height: MediaQuery.of(context).size.height * ratio,
        width: double.infinity,
        child: child,
      ),
    );
    return _res;
  }
}