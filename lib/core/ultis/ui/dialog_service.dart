import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../injection.dart';
import '../../config/app_text_style.dart';
import '../../config/palette.dart';
import '../../widgets/gallery_view/custom_dissmisher.dart';
import '../../widgets/gallery_view/hero_route.dart';
import '../../widgets/layouts/adaptive_loading_widget.dart';
import '../../widgets/layouts/cached_image_network_widget.dart';

class DialogService {
  // static void showCustomDialog(
  //   BuildContext context, {
  //   Color? color,
  //   String? title,
  //   String? cancelText,
  //   String? iconPath,
  //   String? okText,
  //   VoidCallback? onClickCancel,
  //   VoidCallback? onClickOk,
  //   String? subtitle,
  // }) {
  //   // showDialog(
  //   //   context: appRouter.context ?? context,
  //   //   useSafeArea: true,
  //   //   builder: (BuildContext context) {
  //   //     return ChallengeDialog(
  //   //       color: color,
  //   //       title: title,
  //   //       cancelText: cancelText,
  //   //       iconPath: iconPath,
  //   //       okText: okText,
  //   //       onClickCancel: onClickCancel,
  //   //       onClickOk: onClickOk,
  //   //       subtitle: subtitle,
  //   //     );
  //   //   },
  //   // );
  // }

  static void closeLoading() {
    if (DialogService._isLoadingDialogOpened) {
      DialogService._isLoadingDialogOpened = false;
      appRouter.pop();
    }
  }

  static void showDismissibleDialog(
    context, {
    required String path,
    String? heroTag,
    String? title,
  }) {
    Widget _image = CachedNetworkImagekWidget(
      fit: BoxFit.contain,
      imageUrl: path,
      placeholder: (ctx, url) => const ApdaptiveLoadingWidget(),
    );
    Navigator.of(context, rootNavigator: true).push(
      HeroDialogRoute<void>(
        builder: (BuildContext context) => _DismissibleWidget(
          onDismissed: () {
            Navigator.of(context).maybePop();
          },
          body: Center(
            child: heroTag != null ? Hero(tag: heroTag, child: _image) : _image,
          ),
          title: title,
        ),

        // CustomDismissible(
        //   onDragging: () => null,
        //   child: Scaffold(
        //     backgroundColor: Colors.transparent,
        //     appBar: CustomAppBar(
        //       context,
        //       backgroundColor: Colors.transparent,
        //     ),
        //     body: Center(
        //       child:
        //           heroTag != null ? Hero(tag: heroTag, child: _image) : _image,
        //     ),
        //   ),
        //   onDismissed: () {
        //     Navigator.of(context).maybePop();
        //   },
        // ),
      ),
    );
  }

  static bool _isLoadingDialogOpened = false;
  static Future<void> showLoading({
    String? label,
    bool barrierDismissible = false,
    ShapeBorder? shape,
    Clip? clipBehavior,
    double elevation = 0,
    Color barrierColor = Colors.black26,
  }) async {
    final EdgeInsets effectivePadding =
        MediaQuery.of(appRouter.context!).viewInsets;
    final _dialog = AnimatedPadding(
      padding: effectivePadding,
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: appRouter.context!,
        child: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 100.0, maxWidth: 200),
            child: Container(
              width: label != null ? null : 100,
              height: 100,
              child: Material(
                color: Colors.black.withOpacity(.9),
                elevation: elevation,
                shape: shape ??
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                type: MaterialType.card,
                //  clipBehavior: clipBehavior,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 28,
                          height: 28,
                          child: const Center(
                            child: const CircularProgressIndicator(
                              strokeWidth: 3,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                        if (label != null) ...[
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            label,
                            style: AppTextStyle.w400(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    DialogService._isLoadingDialogOpened = true;
    return showDialog(
      barrierColor: barrierColor,
      context: appRouter.context!,
      builder: (_) => _dialog,
    ).then((value) => _isLoadingDialogOpened = false);
  }

  static Future<void> showAlertDialog(
    BuildContext context,
    String title, {
    String? content,
    String okText = "Đồng ý",
    String cancelText = "Hủy",
    VoidCallback? onPressOK,
    VoidCallback? onPressCancel,
  }) async {
    final result = await showConfirmDialog<bool>(
      appRouter.context ?? context,
      title,
      content: content,
      okText: okText,
      cancelText: cancelText,
    );
    if (result != null) {
      if (result == true) {
        if (onPressOK != null) onPressOK();
      } else if (onPressCancel != null) onPressCancel();
    }
  }

  static Future<T?> showConfirmDialog<T>(
    BuildContext context,
    String title, {
    String? content,
    String okText = "Đồng ý",
    String cancelText = "Hủy",
    bool? isIOS,
    bool isDanger = false,
  }) async {
    if (appRouter.context != null) context = appRouter.context!;
    // set up the button
    final _isIOS = isIOS ?? Platform.isIOS;
    Widget dialog;
    if (!_isIOS) {
      dialog = AlertDialog(
        title: Text(
          title,
          style: AppTextStyle.w700(
            color: AppColors.text900,
            fontSize: 20,
          ),
        ),
        content: content != null
            ? Text(
                content,
                style: AppTextStyle.w500(
                  color: AppColors.text900,
                  fontSize: 16,
                  lineHeight: 1.5,
                ),
              )
            : null,
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(),
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              cancelText.toUpperCase(),
              style: AppTextStyle.w600(
                fontSize: 16,
                color: AppColors.primary,
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              okText.toUpperCase(),
              style: AppTextStyle.w700(
                fontSize: 16,
                color: isDanger ? AppColors.red : AppColors.primary,
              ),
            ),
          ),
        ],
      );
    } else {
      dialog = CupertinoAlertDialog(
        title: Text(title),
        content: content != null ? Text(content) : null,
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(cancelText),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(okText),
            isDestructiveAction: isDanger,
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      );
    }

    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  static Future<dynamic> showTextDialog(
    BuildContext context, {
    required String title,
    String? content,
  }) {
    return showDialog(
      context: appRouter.context ?? context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: content == null ? null : Text(content),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Đóng'),
              onPressed: () {
                Navigator.of(appRouter.context ?? context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showRounedDialog(
    BuildContext context, {
    Color? color,
    String? title,
    String? cancelText,
    String? iconPath,
    String? okText,
    VoidCallback? onClickCancel,
    VoidCallback? onClickOk,
    String? subtitle,
  }) {
    final okButton = OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(
          color: Palette.primaryColor,
          width: 1,
        ),
        backgroundColor: Palette.primaryColor,
      ),
      child: Text(
        okText ?? 'Ok bạn',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop(true);
      },
    );
    Dialog dialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.all(24),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //  Image.asset(Res.question),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Câu hỏi có vấn đề?',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'GoogleSans',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Hãy cho quản trị viên biết có gì không ổn với câu hỏi này',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontFamily: 'GoogleSans',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            RadioListTile<int>(
              title: const Text('Đề bài sai hoặc bị thiếu thông tin'),
              value: 1,
              groupValue: 1,
              onChanged: (int? value) {},
            ),
            const SizedBox(
              height: 24,
            ),
            RadioListTile<int>(
              title: const Text('Một trong các đáp án bị sai'),
              value: 2,
              groupValue: 1,
              onChanged: (int? value) {},
            ),
            const SizedBox(
              height: 24,
            ),
            RadioListTile<int>(
              title: const Text('vấn đề khác'),
              value: 0,
              groupValue: 1,
              onChanged: (int? value) {},
            ),
            const SizedBox(
              height: 24,
            ),
            okButton,
          ],
        ),
      ),
    );
    showDialog(
      context: appRouter.context ?? context,
      useSafeArea: true,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}

class _DismissibleWidget extends StatefulWidget {
  final Widget body;
  final String? title;
  final VoidCallback onDismissed;
  _DismissibleWidget({
    Key? key,
    required this.body,
    this.title,
    required this.onDismissed,
  }) : super(key: key);

  @override
  __DismissibleWidgetState createState() => __DismissibleWidgetState();
}

class __DismissibleWidgetState extends State<_DismissibleWidget> {
  bool hideAppbar = false;
  @override
  Widget build(BuildContext context) {
    return CustomDismissible(
      onDragging: () {
        setState(() {
          hideAppbar = true;
        });
      },
      onCancelDragging: () {
        setState(() {
          hideAppbar = false;
        });
      },
      onDismissed: widget.onDismissed,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: hideAppbar
            ? null
            : AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                systemOverlayStyle: SystemUiOverlayStyle.light,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
                title: widget.title != null
                    ? Text(
                        widget.title!,
                        style: AppTextStyle.appBarTextStyle.copyWith(
                          color: Colors.white,
                        ),
                      )
                    : null,
                // actions: [
                //   IconButton(
                //     onPressed: () {
                //       Navigator.of(context).pop();
                //     },
                //     icon: Icon(
                //       Icons.close,
                //     ),
                //   ),
                // ],
              ),
        body: Center(
          child: widget.body,
        ),
      ),
    );
  }
}
