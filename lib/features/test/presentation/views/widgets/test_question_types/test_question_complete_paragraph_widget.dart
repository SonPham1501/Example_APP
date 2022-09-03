import 'package:flutter/material.dart';

import '../../../../../../core/config/app_text_style.dart';
import '../../../../../../core/config/palette.dart';
import '../../../../domain/models/test/quill_content/quill_content.dart';
import '../../../../domain/models/test/test_type/test_type.dart';

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
  _InputLineWidget({
    Key? key,
    required this.section,
    required this.onAnswering,
    this.answered = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final operators = _getOperators(getPlainText(section.paragraph));
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
      // int totalInputs =
      //     operators.where((element) => element.type == 'input').length;

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
                    child: _TextFieldWidget(
                      onAnswering: (value) => onAnswering(
                        operators[index].index ?? 0,
                        value,
                      ),
                      answered: _answered[operators[index].index ?? 0],
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

  // _onUpdateAnswer(List<String> answers, String value, int index) {
  //   answers[index] = value;
  //   return answers;
  // }

  getPlainText(QuillContent? value) {
    if (value == null) return "";
    return value.operations.map((e) => e.content ?? "").join("");
  }

  List<IOperator> _getOperators(String text) {
    List<IOperator> _arr = [];
    var _text = text.trim();

    //  const _regex = type == 'correct_form' ? new RegExp(/\((.*?)\)/, 'g') : new RegExp(/_{2,}/, 'g');
    final _regex = RegExp(r'_{2,}');

    const _placeholder = r"$__$";

    _text = _text.replaceAll(_regex, _placeholder);
    var _matches = _regex.allMatches(_text).toList();
    //  const _input_length = _matches?.length ?? 0;
    if (_matches.isNotEmpty) {
      while (_text.contains(_placeholder)) {
        var _parts = _text.split(_placeholder);
        if (_parts[0].isNotEmpty) {
          _arr.add(IOperator(type: 'text', value: _parts[0]));
        }
        _arr.add(
          IOperator(
            type: 'input',
            value: "",
            index: _arr.where((x) => x.type == 'input').length,
          ),
        );
        if (_parts[1].isNotEmpty) {
          _arr.add(IOperator(type: 'text', value: _parts[1]));
        }
        var _length = _parts[0].length + _parts[1].length + _placeholder.length;
        _text = _text.substring(_length);
      }
    }
    return _arr;

    //this.text.split(regExpression)
  }
}

class IOperator {
  String type;
  String value;
  int? index;
  IOperator({
    required this.type,
    required this.value,
    this.index,
  });

  @override
  String toString() => 'IOperator(type: $type, value: $value, index: $index)';
}

class _TextFieldWidget extends StatefulWidget {
  final ValueChanged<String> onAnswering;
  final String? answered;
  _TextFieldWidget({
    Key? key,
    required this.onAnswering,
    this.answered,
  }) : super(key: key);

  @override
  State<_TextFieldWidget> createState() => __TextFieldWidgetState();
}

class __TextFieldWidgetState extends State<_TextFieldWidget> {
  final _textController = TextEditingController();
  @override
  void initState() {
    if (widget.answered != null) {
      _textController.text = widget.answered ?? "";
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
          onChanged: widget.onAnswering,
          style: AppTextStyle.w600(
            fontSize: DefaultTextStyle.of(context).style.fontSize,
            color: AppColors.primary,
          ),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.zero,
            isDense: true,
          ),
        ),
      ),
    );
  }
}
