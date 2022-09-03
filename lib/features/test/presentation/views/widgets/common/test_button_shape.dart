import 'package:flutter/material.dart';

import '../../../../../../core/config/index.dart';

class TestButtonShape extends StatelessWidget {
  final bool selected;
  final Color? backgroundColor;
  final Color? activeColor;
  final String title;
  final bool shadow;
  final bool border;
  const TestButtonShape({
    Key? key,
    this.selected = false,
    this.backgroundColor = const Color(0xffF8F7FA),
    this.activeColor = const Color(0xffF1F3FF),
    required this.title,
    this.shadow = true,
    this.border = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: selected ? activeColor : backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: border
            ? Border.all(
                color: selected
                    ? AppColors.primary
                    : AppColors.border.withOpacity(.4),
                width: 1,
              )
            : null,
        boxShadow: !shadow
            ? null
            : [
                // const BoxShadow(
                //   color: Color.fromRGBO(0, 0, 0, 0.05),
                //   spreadRadius: 6,
                //   blurRadius: 24,
                //   offset: Offset(0, 0),
                // ),
                const BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  spreadRadius: 1,
                  blurRadius: 0,
                  offset: Offset(0, 0),
                ),
              ],
      ),
      child: Text(
        title,
        style: AppTextStyle.w500(
          color: selected ? AppColors.primary : AppColors.text900,
          fontSize: DefaultTextStyle.of(context).style.fontSize,
        ),
      ),
    );
  }
}
