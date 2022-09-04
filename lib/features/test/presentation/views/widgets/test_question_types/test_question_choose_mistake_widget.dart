import 'package:flutter/material.dart';
import 'package:test_app/core/config/index.dart';
import '../../../ultis/models/test_choose_part_model.dart';
import 'base_test_question_widget.dart';

class TestQuestionChooseMistakeWidget extends BaseTestQuestionWidget {
  const TestQuestionChooseMistakeWidget({
    required super.question,
    required super.questionIndex,
    required super.answered,
    required super.onAnswering,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final TestChooseExtraDataModel _data = initData();
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
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      height: 2,
                    ),
                children: List.generate(
                  _data.parts.length,
                  (index) {
                    if (_data.parts[index].type == 'underlined') {
                      return WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            // onAnswering(question
                            //     .answers[_data.parts[index].indexType].id);
                          },
                          child: Container(
                            //   decoration: BoxDecoration(),
                            padding: const EdgeInsets.only(left: 2, right: 2),
                            child: Text(
                              "(${String.fromCharCode(_data.parts[index].indexType + 65)}) " +
                                  _data.parts[index].value,
                              style:
                                  DefaultTextStyle.of(context).style.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.text900,
                                      ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return TextSpan(text: _data.parts[index].value);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  TestChooseExtraDataModel initData() {
    if (question.extraData != null) {
      return TestChooseExtraDataModel.fromJson(question.extraData!);
    } else {
      return TestChooseExtraDataModel();
    }
    // if (!this.question.extraData?.parts) {
    //   this.question.extraData = {
    //     text: this.question.name?.plainText ?? '',
    //     parts: []
    //   };
    //   this.question.extraData.parts = [{ type: 'text', value: this.question.extraData.text, indexType: 0 }];
    // }
    // return
  }
}
