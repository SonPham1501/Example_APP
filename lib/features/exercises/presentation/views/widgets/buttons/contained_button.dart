import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ContainedButton extends StatefulWidget {
  final String text;
  final AsyncCallback? press;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final Size? size;
  final double radius;
  final FontWeight fontWeight;
  final TextStyle? textStyle;

  const ContainedButton({
    Key? key,
    required this.text,
    this.press,
    this.color,
    this.textColor,
    this.fontSize,
    this.size,
    this.radius = 50,
    this.textStyle,
    this.fontWeight = FontWeight.w600
  }) : super(key: key);

  @override
  _ContainedButtonState createState() => _ContainedButtonState();
}

class _ContainedButtonState extends State<ContainedButton> {
  bool _condition = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: widget.color,
        minimumSize: widget.size ?? const Size(100, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.radius)),
      ),
      onPressed: widget.press != null ? checkCondition : null,
      child: Text(
        widget.text,
        style: widget.textStyle ?? TextStyle(
          fontSize: widget.fontSize ?? 14,
          fontWeight: widget.fontWeight,
          color: widget.textColor,
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  void checkCondition() async {
    if (_condition) {
      setState(() => _condition = false);
      await widget.press!();
      setState(() => _condition = true);
    }
  }
}
