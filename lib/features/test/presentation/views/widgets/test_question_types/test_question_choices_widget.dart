import 'package:flutter/material.dart';
import '../../../../../../core/config/app_text_style.dart';
import '../../../../../../core/config/palette.dart';
import '../../../../../../core/widgets/layouts/cached_image_network_widget.dart';
import '../../../../../../core/widgets/quill_content/quill_content_widget.dart';
import '../../../../domain/models/test/test_type/test_type.dart';
import '../test_doing/circle_character_widget.dart';
import 'base_test_question_widget.dart';

class TestQuestionChoicesWidget extends BaseTestQuestionWidget {
  // final List<String> selectedAnswerIds;
  // final List<TestQuestionAnswerType> answers;
  // final ValueChanged<String> onSelect;
  const TestQuestionChoicesWidget({
    required super.question,
    required super.questionIndex,
    required super.answered,
    required super.onAnswering,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //print(selectedAnswerIds);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
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
            height: 16,
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
            height: 16,
          ),
        ],
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: question.answers.length,
          itemBuilder: (BuildContext ctx, int index) => InkWell(
            onTap: () => onAnswering(question.answers[index].id),
            child: ChoiceAnswerWidget(
              index: index,
              answer: question.answers[index],
              selected: answered.contains(question.answers[index].id),
            ),
          ),
          separatorBuilder: (ctx, index) => const SizedBox(
            height: 16,
          ),
        ),
      ],
    );
  }
}

class ChoiceAnswerWidget extends StatelessWidget {
  final int index;
  final TestQuestionAnswerType answer;
  final bool selected;
  final Color selectedColor;
  ChoiceAnswerWidget({
    required this.index,
    required this.answer,
    this.selectedColor = AppColors.primary,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: selected ? const Color(0xffF1F3FF) : const Color(0xffF8F7FA),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: selected ? AppColors.primary : Colors.transparent,
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            spreadRadius: 1,
            blurRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Wrap(
        //spacing: 16,
        runSpacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CircleCharacterWidget(
            text: getLabelFromIndex(index),
            border: Border.all(color: const Color(0xffD7D6DB)),
            titleTextStyle: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w700,
              height: 1,
              fontSize: DefaultTextStyle.of(context).style.fontSize,
              fontFamily: DefaultTextStyle.of(context).style.fontFamily,
            ),
            backgroundColor: selected ? AppColors.primary : Colors.transparent,
          ),
          const SizedBox(
            width: 12,
          ),
          QuillContentWidget(
            answer.content?.operations ?? [],
            color: AppColors.text900,
            fontSize: DefaultTextStyle.of(context).style.fontSize,
            //fontWeight: FontWeight.w400,
          ),
          if ((answer.images ?? []).isNotEmpty) ...[
            const SizedBox(
              width: 16,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: CachedNetworkImagekWidget(
                  fit: BoxFit.contain,
                  imageUrl: answer.images![0].path ?? "",
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  static String getLabelFromAnswer(
      List<TestQuestionAnswerType> answers, String answerId) {
    for (var i = 0; i < answers.length; i++) {
      if (answers[i].id == answerId) return getLabelFromIndex(i);
    }
    return "Đã trả lời";
  }

  static String getLabelFromIndex(int index) {
    switch (index) {
      case 0:
        return "A";
      case 1:
        return "B";
      case 2:
        return "C";
      case 3:
        return "D";
      case 4:
        return "E";
      case 5:
        return "F";
      default:
        return "G";
    }
  }
}
