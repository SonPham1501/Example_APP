import 'package:flutter/material.dart';
import '../../../../../../core/base_state/widgets/base_stream_widet.dart';
import '../../../../../../core/config/palette.dart';
import '../../../../domain/enums/test_question_type_enum.dart';
import '../../../../domain/models/test/test_type/test_type.dart';
import '../../../controllers/test_doing_page_controller.dart';
import '../test_question_types/test_question_input_widget.dart';
import '../test_question_types/test_question_rearrange_widget.dart';
import '../test_question_types/test_question_true_false_widget.dart';
import '../test_question_types/test_question_write_widget.dart';
import 'index.dart';

class QuestionWidget extends StatelessWidget {
  final int index;
  final TestQuestionType _question;
  // final List<String> selectedAnswerIds;
  //final ValueChanged<String> onSelect;
  //final ValueChanged<String> onAnswering;
  final TestDoingPageController controller;
  const QuestionWidget(
    this.index,
    this._question, {
    Key? key,
    // this.selectedAnswerIds = const [],
    // required this.onSelect,
    // required this.onAnswering,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_question.type == TestQuestionTypeEnum.Input) ...[
            BaseStreamWidget<Map<String, List<String>>>(
              stream: controller.userSelects.stream,
              builder: (context, selections) {
                final selectedAnswerIds = selections[_question.id] ?? [];
                return TestQuestionInputWidget(
                  question: _question,
                  questionIndex: index,
                  onAnswering: (val) => controller.answering(_question.id, val),
                  answered: selectedAnswerIds,
                );
              },
            ),
            const SizedBox(
              height: 12,
            ),
          ] else if (_question.type == TestQuestionTypeEnum.Choices) ...[
            // const Divider(
            //   color: AppColors.text400,
            //   height: 48,
            // ),
            BaseStreamWidget<Map<String, List<String>>>(
              stream: controller.userSelects.stream,
              builder: (context, selections) {
                final selectedAnswerIds = selections[_question.id] ?? [];
                return TestQuestionChoicesWidget(
                  question: _question,
                  questionIndex: index,
                  onAnswering: (val) =>
                      controller.answering(_question.id, [val]),
                  answered: selectedAnswerIds,
                );
              },
            ),
          ] else if (_question.type == TestQuestionTypeEnum.TrueFalse) ...[
            // const Divider(
            //   color: AppColors.text400,
            //   height: 48,
            // ),
            BaseStreamWidget<Map<String, List<String>>>(
              stream: controller.userSelects.stream,
              builder: (context, selections) {
                final selectedAnswerIds = selections[_question.id] ?? [];
                return TestQuestionTrueFalseWidget(
                  question: _question,
                  questionIndex: index,
                  onAnswering: (val) =>
                      controller.answering(_question.id, [val]),
                  answered: [
                    selectedAnswerIds.isNotEmpty ? selectedAnswerIds.first : ''
                  ],
                );
              },
            ),
            const SizedBox(height: 12),
          ] else if (_question.type == TestQuestionTypeEnum.Write) ...[
            BaseStreamWidget<Map<String, List<String>>>(
              stream: controller.userSelects.stream,
              builder: (context, selections) {
                final selectedAnswerIds = selections[_question.id] ?? [];
                return TestQuestionWriteWidget(
                  question: _question,
                  questionIndex: index,
                  onAnswering: (val) =>
                      controller.answering(_question.id, [val]),
                  answered: [
                    selectedAnswerIds.isNotEmpty ? selectedAnswerIds.first : ''
                  ],
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
          ] else if (_question.type == TestQuestionTypeEnum.Rearrange) ...[
            BaseStreamWidget<Map<String, List<String>>>(
              stream: controller.userSelects.stream,
              builder: (context, selections) {
                final selectedAnswerIds = selections[_question.id] ?? [];
                return TestQuestionRearrangeWidget(
                  question: _question,
                  questionIndex: index,
                  onAnswering: (val) =>
                      controller.answering(_question.id, [val]),
                  answered: [
                    selectedAnswerIds.isNotEmpty ? selectedAnswerIds.first : ''
                  ],
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
          ]
        ],
      ),
    );
  }
}

class QuestionReportModal extends StatefulWidget {
  const QuestionReportModal({Key? key}) : super(key: key);

  @override
  State<QuestionReportModal> createState() => _QuestionReportModalState();
}

class _QuestionReportModalState extends State<QuestionReportModal> {
  int? selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/faces/question.png'),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Câu hỏi có vấn đề?',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.black,
            fontFamily: DefaultTextStyle.of(context).style.fontFamily,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Hãy cho quản trị viên biết có gì không ổn với câu hỏi này',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontFamily: DefaultTextStyle.of(context).style.fontFamily,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 24,
        ),
        _buildOption("Đề bài sai hoặc bị thiếu thông tin", 1),
        const SizedBox(
          height: 24,
        ),
        _buildOption("Một trong các đáp án bị sai", 2),
        const SizedBox(
          height: 24,
        ),
        _buildOption("Vấn đề khác", 0),
      ],
    );
  }

  Widget _buildOption(String label, int value) {
    return RadioListTile<int>(
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
        side: selected == value
            ? BorderSide(
                color: AppColors.primary,
              )
            : BorderSide(
                color: AppColors.border,
              ),
      ),
      selected: selected == value,
      title: Text(
        label,
        style: TextStyle(
          color: Palette.textBlack,
          fontSize: DefaultTextStyle.of(context).style.fontSize,
          fontFamily: DefaultTextStyle.of(context).style.fontFamily,
        ),
      ),
      value: value,
      groupValue: selected,
      onChanged: (int? value) {
        setState(() {
          selected = value;
        });
      },
    );
  }
}
