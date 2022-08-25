import 'package:flutter/material.dart';

class CommonOutlineButton extends StatefulWidget {
  final String text;
  final Function? press;
  final Size? size;
  final TextStyle? textStyle;
  final double? fontSize;
  final String? sufIcon;
  final TextAlign textAlign;
  final RichText? lableText;
  final bool isForcus;
  final double radius;

  const CommonOutlineButton({Key? key, 
    this.text = '',
    this.press,
    this.size,
    this.textStyle,
    this.fontSize,
    this.sufIcon,
    this.textAlign = TextAlign.center,
    this.lableText,
    this.isForcus = false,
    this.radius = 10,
  }) : super(key: key);

  @override
  _OutlineButtonState createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<CommonOutlineButton> {
  bool _condition = true;

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        minimumSize: widget.size ?? const Size(100, 40),
        side: widget.press != null ? BorderSide(width: 1.5, color: widget.isForcus ? Theme.of(context).buttonColor : Theme.of(context).dividerColor) : null,
      ),
      onPressed: widget.press == null ? null : checkCondition,
      child: SizedBox(
        width: widget.size?.width ?? 0,
        child: Row(
          children: [
            widget.lableText ?? const SizedBox(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.text,
                  style: widget.textStyle ?? TextStyle(fontSize: widget.fontSize ?? 14, fontWeight: FontWeight.w400, color: const Color(0xFF4E4B66)),
                  textAlign: widget.textAlign,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
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
