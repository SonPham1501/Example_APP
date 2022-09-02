import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture svgIcon(String iconPath, {Color? color, double? width, double? height}) =>
    SvgPicture.asset(
      iconPath,
      color: color ?? null,
      width: width ?? null,
      height: height ?? null,
    );