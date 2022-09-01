import 'package:flutter/material.dart';
import '../../../../../../core/config/palette.dart';
import '../../../../../../core/widgets/layouts/cached_image_network_widget.dart';
import '../../../../../../core/widgets/quill_content/quill_content_widget.dart';
import '../../../../domain/models/test/test_type/test_type.dart';
import 'circle_character_widget.dart';

class QuestionAnswersWidget extends StatelessWidget {
  final List<String> selectedAnswerIds;
  final List<TestQuestionAnswerType> answers;
  final ValueChanged<String> onSelect;
  const QuestionAnswersWidget({
    this.selectedAnswerIds = const [],
    required this.onSelect,
    required this.answers,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(selectedAnswerIds);
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: answers.length,
      itemBuilder: (BuildContext ctx, int index) => InkWell(
        onTap: () => this.onSelect(answers[index].id),
        child: ChoiceAnswerWidget(
          index: index,
          answer: answers[index],
          selected: selectedAnswerIds.contains(answers[index].id),
        ),
      ),
      separatorBuilder: (ctx, index) => const SizedBox(
        height: 16,
      ),
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
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: selected ? Color(0xffF1F3FF) : Color(0xffF8F7FA),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: selected ? AppColors.primary : AppColors.border,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff112A50).withOpacity(.01),
            spreadRadius: 10,
            blurRadius: 4,
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
            border: Border.all(color: Color(0xffD7D6DB)),
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
            width: 16,
          ),
          QuillContentWidget(
            answer.content?.operations ?? [],
            color: AppColors.text900,
            fontSize: DefaultTextStyle.of(context).style.fontSize,
            //fontWeight: FontWeight.w400,
          ),
          if ((answer.images ?? []).length > 0) ...[
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
