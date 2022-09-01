import 'package:flutter/material.dart';


class EmptyWidget extends StatelessWidget {
  final String? content;

  const EmptyWidget({Key? key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            content ?? 'Danh sách rỗng.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          // svgIcon(img_empty),
        ],
      ),
    );
  }
}
