import 'package:flutter/material.dart';

import 'palette.dart';

class AppTextStyle {
  static const appBarTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Palette.neutral_800,
  );
  //TODO sua textstyle
  //
  static const modalBottomSheetTextStyle =
      TextStyle(fontSize: 14, color: Palette.neutral_800);

  static TextStyle w400({
    double? fontSize,
    Color? color,
    double? lineHeight,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      fontWeight: FontWeight.w400,
      color: color ?? const Color(0xFF363853),
      fontFamily: fontFamily,
      height: lineHeight,
    );
  }

  static TextStyle w500({
    double? fontSize,
    Color? color,
    double? lineHeight,
    String? fontFamily,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      fontWeight: FontWeight.w500,
      color: color ?? const Color(0xFF363853),
      fontFamily: fontFamily,
      height: lineHeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle w600({
    double? fontSize,
    Color? color,
    double? lineHeight,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      fontWeight: FontWeight.w600,
      color: color ?? const Color(0xFF363853),
      fontFamily: fontFamily,
      height: lineHeight,
    );
  }

  static TextStyle w700({
    double? fontSize,
    Color? color,
    double? lineHeight,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      fontWeight: FontWeight.w700,
      color: color ?? const Color(0xFF363853),
      fontFamily: fontFamily,
      height: lineHeight,
    );
  }

  static TextStyle w900({
    double? fontSize,
    Color? color,
    double? lineHeight,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      fontWeight: FontWeight.w900,
      color: color ?? const Color(0xFF363853),
      fontFamily: fontFamily,
      height: lineHeight,
    );
  }

  static const textButtonInAppBarStyle = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    color: Palette.primaryColor_700,
  );

  static const disableTextButtonInAppBarStyle = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    color: Palette.neutral_500,
  );

  static final primaryButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Palette.primaryColor_700),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
