import 'package:flutter/material.dart';
import '../../../../../../core/config/app_text_style.dart';
import '../../../../../../core/config/palette.dart';
import '../../../../../../core/widgets/quill_content/quill_content_widget.dart';
import '../../../../domain/models/test/test_type/test_type.dart';

class TestQuestionWriteWidget extends StatefulWidget {
  final TestQuestionType question;
  final int questionIndex;
  final ValueChanged<String> onAnswering;
  final List<String> answered;
  TestQuestionWriteWidget({
    Key? key,
    required this.question,
    required this.questionIndex,
    required this.onAnswering,
    this.answered = const [],
  }) : super(key: key);

  @override
  State<TestQuestionWriteWidget> createState() =>
      _TestQuestionWriteWidgetState();
}

class _TestQuestionWriteWidgetState extends State<TestQuestionWriteWidget> {
  final _textEditingController = TextEditingController();
  @override
  void initState() {
    if (widget.answered.length > 0) {
      _textEditingController.text = widget.answered[0];
    }

    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if ((widget.question.name?.operations ?? []).isNotEmpty) ...[
          QuillContentWidget(
            widget.question.name?.operations ?? [],
            fontSize: DefaultTextStyle.of(context).style.fontSize,
            fontWeight: FontWeight.w500,
            prefix: TextSpan(
              text: "${widget.questionIndex + 1}. ",
              style: AppTextStyle.w700(
                color: AppColors.primary,
                fontFamily: 'Roboto',
                lineHeight: 1.5,
                fontSize: DefaultTextStyle.of(context).style.fontSize,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ] else ...[
          Text(
            "Câu ${widget.questionIndex + 1}",
            style: AppTextStyle.w700(
              fontSize: 18,
              color: AppColors.text900,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
        TextField(
          controller: _textEditingController,
          // fullwidth: true,
          // minFontSize: 18,
          // maxFontSize: 20,

          onChanged: widget.onAnswering,
          enableSuggestions: false,
          maxLines: 3,
          minLines: 1,
          style: AppTextStyle.w500(
            fontSize: (DefaultTextStyle.of(context).style.fontSize ?? 16) + 2,
            color: AppColors.primary,
          ),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 0),
            isDense: true,
          ),
        ),
      ],
    );
  }
}
