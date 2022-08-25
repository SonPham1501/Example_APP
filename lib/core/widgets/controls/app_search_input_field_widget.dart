import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/palette.dart';

typedef OnSearchFieldChanged(String value);
typedef OnSearchFieldSubmit(String value);

class AppSearchInputFieldwidget extends StatefulWidget {
  final Widget searchIcon;
  final Color backgroundColor;
  final Color fousBackgroundColor;
  final String? placeholder;
  final OnSearchFieldChanged? onChanged;
  final OnSearchFieldSubmit? onSubmit;
  final String? initialValue;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final TextEditingController? controller;

  const AppSearchInputFieldwidget({
    this.searchIcon = const Icon(
      Icons.search,
      size: 24,
      color: Palette.subTextColor,
    ),
    this.onChanged,
    this.onSubmit,
    this.placeholder,
    this.backgroundColor = Palette.input_bg,
    this.fousBackgroundColor = Palette.input_bg,
    this.initialValue,
    this.autoFocus = false,
    this.textInputAction,
    this.readOnly = false,
    this.controller,
  });

  @override
  _AppSearchInputFieldwidget createState() => _AppSearchInputFieldwidget();
}

class _AppSearchInputFieldwidget extends State<AppSearchInputFieldwidget> {
  late bool isFocus;
  final _focusNode = FocusNode();
  late String _currentText;
  late TextEditingController _controller;

  @override
  void initState() {
    _currentText = "";
    _controller = widget.controller ?? new TextEditingController();
    _controller.addListener(() {
      setState(() {
        _currentText = _controller.value.text;
      });
    });
    if (widget.initialValue != null) _controller.text = widget.initialValue!;
    this.isFocus = false;
    _focusNode.addListener(() {
      setState(() {
        this.isFocus = _focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
   // _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autoFocus,
      focusNode: _focusNode,
      readOnly: widget.readOnly,
      obscureText: false,
      keyboardType: TextInputType.text,
      textInputAction: widget.textInputAction,
      controller: _controller,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        hintStyle: TextStyle(fontSize: 14.0),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Padding(
          child: widget.searchIcon,
          padding: const EdgeInsets.only(left: 5.0),
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 35.0, minWidth: 40),
        suffixIconConstraints: BoxConstraints(maxHeight: 35.0),
        suffixIcon: this.isFocus && _currentText.length > 0
            ? _buildClearTextButton()
            : null,
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(
            color: const Color(0xffeeeeee),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: const BorderSide(
            color: Palette.fourthColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.backgroundColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: const BorderSide(
            color: Palette.fourthColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        filled: true,
        fillColor:
            this.isFocus ? widget.fousBackgroundColor : widget.backgroundColor,
      ),
      autocorrect: false,
      style: const TextStyle(fontSize: 16.0),
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmit,
    );
  }

  IconButton _buildClearTextButton() {
    return IconButton(
      padding: const EdgeInsets.only(right: 0),
      onPressed: () {
        _controller.clear();
        if (widget.onChanged != null) {
          widget.onChanged!('');
        }
      },
      color: Palette.subTextColor,
      icon: const Icon(
        Icons.close,
        size: 24.0,
      ),
    );
  }
}
