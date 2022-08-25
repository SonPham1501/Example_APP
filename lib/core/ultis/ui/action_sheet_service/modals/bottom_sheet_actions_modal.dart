import 'package:flutter/material.dart';

class BottomSheetActionModal extends StatelessWidget {
  final bool isConfirm;
  final String? title;
  final String? description;
  final String? icon;
  final bool showIcon;
  const BottomSheetActionModal({
    required this.isConfirm,
    this.title,
    this.description,
    this.icon,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          showIcon ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        if (showIcon) ...[
          Image.asset(icon ?? 'assets/images/faces/question.png'),
          const SizedBox(
            height: 24,
          ),
        ],
        Text(
          title ?? 'Bạn chắn chứ?',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.black,
            fontFamily: 'GoogleSans',
          ),
          textAlign: TextAlign.center,
        ),
        if (description != null) ...[
          const SizedBox(
            height: 24,
          ),
          Text(
            description!,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontFamily: 'GoogleSans',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
