import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../injection.dart';
import '../../config/palette.dart';

enum SnackBarPosition {
  top,
  bottom,
}

typedef void SnackBarOnTab();
typedef SnackBarAction SnackBarActionBuilder(BuildContext ctx);

class SnackBarService {
  static void showSnackBar(
    String message,
    Color textColor,
    Color backgroundColor,
    Icon icon, {
    String? title,
    double? borderRadius,
    EdgeInsets? padding,
    EdgeInsets margin = EdgeInsets.zero,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    SnackBarPosition position = SnackBarPosition.bottom,
    Duration duration = const Duration(seconds: 5),
    SnackBarActionBuilder? actionBuilder,
    BuildContext? context,
  }) {
    if (appRouter.context == null) return;
    if (position == SnackBarPosition.bottom) {
      ScaffoldMessenger.of(appRouter.context!).showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor,
          duration: duration,
          padding: padding,
          behavior: behavior,
          margin: margin,
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          shape: borderRadius == null
              ? null
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
          action:
              actionBuilder != null ? actionBuilder(appRouter.context!) : null,
        ),
      );
    } else {
      // if (context == null) return;
      // print('here already');
      showTopSnackBar(
        appRouter.context!,
        Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              padding:
                  padding ?? EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              // constraints:BoxConstraints(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius ?? 32),
                color: backgroundColor,
              ),
              // width: 200,
              child: Text(
                message,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        overlayState: appRouter.navigatorKey.currentState?.overlay,
        // displayDuration: duration,
      );
    }
  }

  static void showError(
    String message, {
    String? title,
    Duration duration = const Duration(seconds: 3),
    SnackBarActionBuilder? actionBuilder,
    SnackBarPosition position = SnackBarPosition.bottom,
    BuildContext? context,
  }) {
    showSnackBar(
      message,
      Colors.white,
      Palette.fourthColor,
      Icon(
        Icons.error,
        color: Colors.white,
      ),
      title: title,
      duration: duration,
      actionBuilder: actionBuilder,
      position: position,
      context: context,
    );
  }

  static Future<void> showSuccess(
    String message, {
    String? title,
    Duration duration = const Duration(seconds: 3),
    SnackBarActionBuilder? actionBuilder,
    Duration delayDuration = const Duration(milliseconds: 700),
    SnackBarPosition position = SnackBarPosition.bottom,
    BuildContext? context,
  }) async {
    await Future.delayed(delayDuration);
    showSnackBar(
      message,
      Colors.white,
      Palette.thirdColor,
      Icon(
        Icons.check,
        color: Colors.white,
      ),
      title: title,
      duration: duration,
      actionBuilder: actionBuilder,
      position: position,
      context: context,
    );
  }

  static void showInfo(
    String message, {
    String? title,
    Duration duration = const Duration(seconds: 3),
    SnackBarActionBuilder? actionBuilder,
    SnackBarPosition position = SnackBarPosition.top,
    BuildContext? context,
  }) {
    showSnackBar(
      message,
      Colors.white,
      Color(0xff007bff),
      Icon(
        Icons.info,
        color: Colors.white,
      ),
      title: title,
      duration: duration,
      actionBuilder: actionBuilder,
      position: position,
      context: context,
    );
  }

  static void showMaterialStyle(
    String message, {
    String? title,
    Duration duration = const Duration(seconds: 3),
    SnackBarActionBuilder? actionBuilder,
    SnackBarPosition position = SnackBarPosition.bottom,
    BuildContext? context,
  }) {
    showSnackBar(
      message,
      Colors.white,
      Colors.black,
      Icon(
        Icons.info,
        color: Colors.white,
      ),
      title: title,
      duration: duration,
      actionBuilder: actionBuilder,
      borderRadius: 0,
      position: position,
      context: context,
    );
  }
}

class MaterialBannerService {
  static void showBanner(
    List<Widget> actions,
    String message, {
    Color? textColor,
    Color? backgroundColor,
    Icon? icon,
    String? title,
    double? borderRadius,
    EdgeInsets? padding,
  }) {
    if (appRouter.context == null) return;
    if (actions.length == 0) {
      actions.add(
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(appRouter.context!)
                .hideCurrentMaterialBanner();
          },
          child: Text(
            'Đóng',
            style: TextStyle(color: textColor),
          ),
        ),
      );
    }

    ScaffoldMessenger.of(appRouter.context!).showMaterialBanner(
      MaterialBanner(
        backgroundColor: backgroundColor,
        padding: padding,
        content: Text(
          message,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: actions,
      ),
    );
  }

  static void hideBanner() {
    if (appRouter.context == null) return;
    ScaffoldMessenger.of(appRouter.context!).hideCurrentMaterialBanner();
  }

  static void showWarningBanner({
    required String message,
  }) {
    showBanner(
      [],
      message,
      backgroundColor: Palette.primaryColor_700,
      textColor: Colors.white,
    );
  }
}
