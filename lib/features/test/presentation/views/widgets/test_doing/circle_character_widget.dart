import 'package:flutter/material.dart';

class CircleCharacterWidget extends StatelessWidget {
  final Color backgroundColor;
  final TextStyle titleTextStyle;
  final String text;
  final double? size;
  final Border? border;
  CircleCharacterWidget({
    this.size,
    this.border,
    required this.text,
    required this.backgroundColor,
    required this.titleTextStyle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 32,
      width: size ?? 32,
      child: Center(
        child: Text(
          text,
          style: titleTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: border,
      ),
    );
  }
}
