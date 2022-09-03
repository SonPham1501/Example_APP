import 'package:flutter/material.dart';
import 'package:test_app/core/config/index.dart';
import '../../../../domain/models/test/quill_content/quill_content.dart';
import '../../../../domain/models/test/test_type/test_type.dart';
import '../common/test_button_shape.dart';

class TestQuestionRearrangeWidget extends StatefulWidget {
  final TestQuestionType question;
  final int questionIndex;
  final ValueChanged<String> onAnswering;
  final List<String> answered;
  const TestQuestionRearrangeWidget({
    Key? key,
    required this.question,
    required this.questionIndex,
    required this.onAnswering,
    this.answered = const [],
  }) : super(key: key);

  @override
  State<TestQuestionRearrangeWidget> createState() =>
      _TestQuestionRearrangeWidgetState();
}

class _TestQuestionRearrangeWidgetState
    extends State<TestQuestionRearrangeWidget> {
  List<String> items = [];
  List<String> cloneItems = [];
  List<String> selectedItems = [];
  bool _isInitialized = false;
  @override
  void initState() {
    generateParts(_getPlainText(widget.question.name));
    setState(() {
      _isInitialized = true;
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  generateParts(String val) {
    items = [..._getParts(val)];
    cloneItems = [...items];
  }

  String _getPlainText(QuillContent? value) {
    if (value == null) return "";
    return value.operations.map((e) => e.content ?? "").join("");
  }

  _getParts(String text) {
    var arrs = text.split('/');
    arrs = arrs.where((x) => x.trim().isNotEmpty).toList();
    return arrs;
  }

  toggleListOne(int index) {
    setState(() {
      cloneItems.add(selectedItems.removeAt(index));
    });
    emit();
  }

  toggleListTwo(int index) {
    setState(() {
      selectedItems.add(cloneItems.removeAt(index));
    });
    emit();
  }

  emit() {
    String answer = selectedItems.map((x) => x.trim()).join(' ');
    answer = answer.trim();
    widget.onAnswering(answer);
  }

  @override
  Widget build(BuildContext context) {
    return !_isInitialized
        ? const SizedBox.shrink()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Câu ${widget.questionIndex + 1}",
                style: AppTextStyle.w700(
                  fontSize: DefaultTextStyle.of(context).style.fontSize,
                  color: AppColors.text900,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.border,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Visibility(
                        child: Text(
                          'Ấn các từ bên dưới đến thêm vào đây',
                          style: AppTextStyle.w400(
                            color: AppColors.text700,
                          ),
                        ),
                        visible: selectedItems.isEmpty,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      constraints: const BoxConstraints(minHeight: 110),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(
                          selectedItems.length,
                          (index) => GestureDetector(
                            onTap: () {
                              toggleListOne(index);
                            },
                            child: TestButtonShape(
                              title: selectedItems[index],
                              backgroundColor: Colors.white,
                              border: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (cloneItems.isNotEmpty) ...[
                const SizedBox(
                  height: 24,
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    cloneItems.length,
                    (index) => GestureDetector(
                      onTap: () {
                        toggleListTwo(index);
                      },
                      child: TestButtonShape(
                        title: cloneItems[index],
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          );
  }
}
