import 'package:flutter/material.dart';

import '../config/app_text_style.dart';
import '../config/constants/constants.dart';
import '../config/palette.dart';

enum AppButtonSize { big, normal, small }

class AppButtons {
  static Widget outlined({
    required String label,
    VoidCallback? onPressed,
    Color? backgroundColor,
    Color? borderColor,
    double borderRadius = 360,
    EdgeInsets? padding,
    MaterialTapTargetSize? tapTargetSize,
    TextStyle? textStyle,
    bool loading = false,
    Widget? prefix,
    Size? customSize,
    bool fullWidth = false,
    AppButtonSize buttonSize = AppButtonSize.small,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: tapTargetSize,
        padding: padding ?? EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor ?? AppColors.border),
        ),
        backgroundColor:
            loading ? Color(0xffcccccc) : backgroundColor ?? Colors.transparent,
        minimumSize: customSize ?? _getButtonSize(buttonSize),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
        children: [
          if (loading) ...[
            SizedBox(
              width: 12,
              height: 12,
              child: Center(
                child: CircularProgressIndicator(
                  color: Color(0xff666666),
                  strokeWidth: 2,
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
          ],
          if (!loading && prefix != null) ...[
            prefix,
            const SizedBox(
              width: 8,
            ),
          ],
          Text(
            label,
            style: textStyle ??
                TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: loading ? Color(0xff666666) : Colors.white,
                ),
          ),
        ],
      ),
    );
  }

  static Widget rounded({
    required String label,
    VoidCallback? onPressed,
    Color? backgroundColor,
    double borderRadius = 16,
    EdgeInsets? padding,
    MaterialTapTargetSize? tapTargetSize,
    TextStyle? textStyle,
    bool loading = false,
    Widget? prefix,
    Size? customSize,
    Widget? suffix,
    AppButtonSize buttonSize = AppButtonSize.small,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: tapTargetSize,
        padding: padding ?? EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        backgroundColor: loading ? Color(0xffcccccc) : backgroundColor,
        minimumSize: customSize ?? _getButtonSize(buttonSize),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (loading) ...[
            SizedBox(
              width: 12,
              height: 12,
              child: Center(
                child: CircularProgressIndicator(
                  color: Color(0xff666666),
                  strokeWidth: 2,
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
          ],
          if (!loading && prefix != null) ...[
            prefix,
            const SizedBox(
              width: 8,
            ),
          ],
          Text(
            label,
            style: textStyle ??
                TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: loading ? Color(0xff666666) : Colors.white,
                ),
          ),
          if (!loading && suffix != null) ...[
            const SizedBox(
              width: 8,
            ),
            suffix,
          ]
        ],
      ),
    );
  }

  static Size _getButtonSize(AppButtonSize buttonSize) {
    switch (buttonSize) {
      case AppButtonSize.big:
        return Size(56, 56);
      case AppButtonSize.normal:
        return Size(48, 48);
      default:
        return Size(32, 32);
    }
  }

  static Widget flat({
    required String label,
    VoidCallback? onPressed,
    Color? backgroundColor,
    double borderRadius = 16,
    EdgeInsets? padding,
    MaterialTapTargetSize? tapTargetSize,
    TextStyle? textStyle,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: tapTargetSize,
        padding: padding ?? EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: backgroundColor,
        minimumSize: Size(32, 32),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: textStyle ??
            AppTextStyle.w400(
              fontFamily: AppFont.GoogleSans,
              color: Colors.white,
              fontSize: 14,
            ),
      ),
    );
  }
}
