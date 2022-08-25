import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/palette.dart';

class ApdaptiveLoadingWidget extends StatelessWidget {
  final Color color;
  final double? size;
  const ApdaptiveLoadingWidget({
    Key? key,
    this.color = AppColors.primaryDark,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Theme(
            data: ThemeData(
              cupertinoOverrideTheme:
                  CupertinoThemeData(brightness: Brightness.dark),
            ),
            child: const CupertinoActivityIndicator(),
          )
        : Center(
            child: SizedBox(
              width: size ?? 18,
              height: size ?? 18,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(this.color),
              ),
            ),
          );
  }
}
