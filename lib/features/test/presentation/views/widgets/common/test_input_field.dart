import 'package:flutter/material.dart';

import '../../../../../../core/config/palette.dart';

class TestInputField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String? inital;
  const TestInputField({
    Key? key,
    required this.onChanged,
    this.inital,
  }) : super(key: key);

  @override
  State<TestInputField> createState() => _TestInputFieldState();
}

class _TestInputFieldState extends State<TestInputField> {
  final _textController = TextEditingController();
  @override
  void initState() {
    if (widget.inital != null) {
      _textController.text = widget.inital ?? "";
    }
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 48),
      child: IntrinsicWidth(
        child: TextField(
          controller: _textController,
          enableSuggestions: false,
          onChanged: widget.onChanged,
          style: DefaultTextStyle.of(context).style.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.zero,
            isDense: true,
            // constraints: BoxConstraints(maxWidth: 140, minWidth: 80),
          ),
        ),
      ),
    );
  }
}
