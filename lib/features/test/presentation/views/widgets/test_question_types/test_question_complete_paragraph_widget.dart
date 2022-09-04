import 'package:flutter/material.dart';
import 'package:test_app/features/test/presentation/ultis/test_ultis.dart';
import '../../../../../../core/config/app_text_style.dart';
import '../../../../domain/models/test/test_type/test_type.dart';
import '../common/test_input_field.dart';

typedef ParagraphInputChanged<T> = void Function(int index, T value);

class TestQuestionCompleteParagraphWidget extends StatelessWidget {
  final TestSectionType section;
  final ParagraphInputChanged<String> onAnswering;
  final List<String> answered;
  TestQuestionCompleteParagraphWidget({
    Key? key,
    required this.section,
    required this.onAnswering,
    this.answered = const [],
  }) : super(key: key);
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return _InputLineWidget(
      section: section,
      onAnswering: onAnswering,
      answered: answered,
    );
  }
}

class _InputLineWidget extends StatelessWidget {
  final TestSectionType section;
  final ParagraphInputChanged<String> onAnswering;
  final List<String> answered;
  const _InputLineWidget({
    Key? key,
    required this.section,
    required this.onAnswering,
    this.answered = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final operators = TestUltis.stringToOperators(
          TestUltis.quillContentToString(section.paragraph));
      final _inputs =
          operators.where((element) => element.type == 'input').toList();
      List<String> _answered = [];

      if (answered.length != _inputs.length) {
        for (var i = 0; i < _inputs.length; i++) {
          _answered.add('');
          onAnswering(_inputs[i].index ?? 0, '');
        }
      } else {
        _answered = [...answered];
      }
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
                      onChanged: (value) => onAnswering(
                        operators[index].index ?? 0,
                        value,
                      ),
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
}
