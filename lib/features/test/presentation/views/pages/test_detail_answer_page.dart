import 'package:flutter/material.dart';
import 'package:test_app/core/widgets/quill_content/quill_content_widget.dart';
import '../../../../../core/config/palette.dart';
import '../../../domain/models/test/test_type/test_type.dart';

class TestDetailAnswerPage extends StatelessWidget {
  final TestQuestionType _question;
  final int index;
  const TestDetailAnswerPage(this._question, this.index, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lời giải chi tiết"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Câu $index:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Palette.neutral_700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _QuestionResultAnswerWidget(_question),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Lời giải:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Palette.neutral_700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                QuillContentWidget(
                  _question.note?.operations ?? [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _QuestionResultAnswerWidget extends StatelessWidget {
  final TestQuestionType _question;
  const _QuestionResultAnswerWidget(
    this._question, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        QuillContentWidget(
          _question.name?.operations ?? [],
        ),
        const SizedBox(height: 15),
        Column(
          children: List.generate(
            _question.answers.length,
            (index) => Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    String.fromCharCode(index + 65) + ". ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: QuillContentWidget(
                      _question.answers[index].content?.operations ?? [],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
