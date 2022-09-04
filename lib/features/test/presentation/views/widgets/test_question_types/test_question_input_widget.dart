import 'package:flutter/material.dart';
import 'package:test_app/features/test/presentation/ultis/test_ultis.dart';
import '../../../../../../core/config/app_text_style.dart';
import '../../../../../../core/config/palette.dart';
import '../../../../domain/models/test/test_type/test_type.dart';
import '../common/test_input_field.dart';

class TestQuestionInputWidget extends StatelessWidget {
  final TestQuestionType question;
  final int questionIndex;
  final ValueChanged<List<String>> onAnswering;
  final List<String> answered;
  TestQuestionInputWidget({
    Key? key,
    required this.question,
    required this.questionIndex,
    required this.onAnswering,
    this.answered = const [],
  }) : super(key: key);
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${questionIndex + 1}.",
          style: DefaultTextStyle.of(context).style.copyWith(
                height: 2,
                fontFamily: 'Roboto',
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: _InputLineWidget(
            question: question,
            onAnswering: onAnswering,
            answered: answered,
          ),
        ),
      ],
    );
  }
}

class _InputLineWidget extends StatelessWidget {
  final TestQuestionType question;
  final ValueChanged<List<String>> onAnswering;
  final List<String> answered;
  const _InputLineWidget({
    Key? key,
    required this.question,
    required this.onAnswering,
    this.answered = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final operators = TestUltis.stringToOperators(
        TestUltis.quillContentToString(
          question.name,
        ),
      );
      int totalInputs =
          operators.where((element) => element.type == 'input').length;
      List<String> _answered = [];
      if (answered.length != totalInputs) {
        _answered = List.filled(totalInputs, '');
        onAnswering(_answered);
      } else {
        _answered = [...answered];
      }

      // Xlogger.d(operators);
      return RichText(
        text: TextSpan(
          style: AppTextStyle.w500(
            fontSize: DefaultTextStyle.of(context).style.fontSize,
            color: Colors.black,
            lineHeight: 2,
          ),
          children: List.generate(
            operators.length,
            (index) {
              if (operators[index].type == 'input') {
                return WidgetSpan(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2, right: 2),
                    child: TestInputField(
                      onChanged: (value) => onAnswering(_onUpdateAnswer(
                          _answered, value, operators[index].index ?? 0)),
                      inital: _answered[operators[index].index ?? 0],
                    ),
                  ),
                );
              } else {
                return TextSpan(text: operators[index].value);
              }
            },
          ),
        ),
      );
    });
  }

  _onUpdateAnswer(List<String> answers, String value, int index) {
    answers[index] = value;
    return answers;
  }
}
