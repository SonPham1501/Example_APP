import 'package:flutter/material.dart';
import 'package:test_app/features/test/domain/models/test/test_type/test_type.dart';

import '../../../../../../core/config/app_text_style.dart';
import '../../../../../../core/config/palette.dart';
import '../../../../../../core/widgets/quill_content/quill_content_widget.dart';
import 'base_test_question_widget.dart';

class TestQuestionTrueFalseWidget extends BaseTestQuestionWidget {
  const TestQuestionTrueFalseWidget({
    required super.question,
    required super.questionIndex,
    required super.answered,
    required super.onAnswering,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if ((question.name?.operations ?? []).isNotEmpty) ...[
          QuillContentWidget(
            question.name?.operations ?? [],
            fontSize: DefaultTextStyle.of(context).style.fontSize,
            fontWeight: FontWeight.w500,
            prefix: TextSpan(
              text: "${questionIndex + 1}. ",
              style: AppTextStyle.w700(
                color: AppColors.primary,
                fontFamily: 'Roboto',
                lineHeight: 1.5,
                fontSize: DefaultTextStyle.of(context).style.fontSize,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ] else ...[
          Text(
            "Câu ${questionIndex + 1}",
            style: AppTextStyle.w700(
              fontSize: 18,
              color: AppColors.text900,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
        Row(
          children: List.generate(
            question.answers.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () {
                    onAnswering(question.answers[index].id);
                  },
                  child: _TrueFalseOptionButton(
                    index: index,
                    answer: question.answers[index],
                    selected: answered.contains(question.answers[index].id),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class _TrueFalseOptionButton extends StatelessWidget {
  final int index;
  final TestQuestionAnswerType answer;
  final bool selected;
  final Color selectedColor;
  _TrueFalseOptionButton({
    required this.index,
    required this.answer,
    this.selectedColor = AppColors.primary,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: selected ? const Color(0xffF1F3FF) : const Color(0xffF8F7FA),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: selected ? AppColors.primary : AppColors.border,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff112A50).withOpacity(.01),
            spreadRadius: 10,
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Text(
        index == 0 ? "True" : "False",
        style: AppTextStyle.w500(
          color: selected ? AppColors.primary : AppColors.text900,
        ),
      ),
    );
  }
}
