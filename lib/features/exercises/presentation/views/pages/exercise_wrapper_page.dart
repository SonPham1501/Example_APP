import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_app/core/base_state/di.dart';
import 'package:test_app/core/widgets/empty_widget.dart';
import 'package:test_app/features/exercises/domain/section_types/choices.dart';
import 'package:test_app/features/exercises/domain/enums/exercise_type_enum.dart';
import 'package:test_app/features/exercises/presentation/views/widgets/total_score.dart';
import 'package:test_app/injection.dart';

import '../../controllers/exercise_wrapper_page_controller.dart';
import '../widgets/exercise_types/exercise_choices_widget.dart';
import '../widgets/time_count_down_widget.dart';

class ExerciseWrapperPage extends BaseView<ExerciseWrapperPageController> {
  ExerciseWrapperPage({Key? key}) : super(key: key);

  @override
  void onInit() {
    controller.initUserSelection();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Builder(builder: (context) {
        switch (controller.model.dataType) {
          case ExerciseTypeEnum.choices:
            final data = controller.model.data as ChoicesExerciseData;
            List<String> answers = (data.questions!.map((e) => e.options?.firstWhere((element) => element.id == e.correctOption,orElse: () => ChoiceQuestionOption()).content ?? '')).toList();
            return BaseStreamWidget<int>(
              stream: controller.qIndexStream,
              builder: (context, qIndex) {
                final _q = data.questions![qIndex];
                return BaseStreamWidget<List<String?>>(
                  stream: controller.userSelectionsStream,
                  builder: (context, selectedItem) {
                    String answer = _q.options?.firstWhere((element) => element.id == _q.correctOption,orElse: () => ChoiceQuestionOption()).content ?? '';
                    List<String> items = _q.options?.map((elem) => elem.content ?? "").toList() ?? [];
                    return ExerciseChoiceWidget(
                      id: _q.index ?? 0,
                      content: _q.content ?? "",
                      items: items,
                      answer: answer,
                      onSelected: (v) => controller.onSelectItem(qIndex, v),
                      selectedItem: controller.userSelections[qIndex],
                      onNextQuestion: (v) {
                        if (v <= items.length)  controller.nextQuestion(v);
                        if ((_q.index ?? 0) > (_q.options ?? []).length) {
                          int countCorrect = 0;
                          for (int i = 0; i < selectedItem.length; i++) {
                            if (answers[i] == selectedItem[i]) countCorrect++;
                          }
                          appRouter.pop();
                          appRouter.push(TotalScore(sum: answers.length, core: countCorrect));
                        }
                      },
                    );
                  },
                );
              }
            );
          default:
            return const EmptyWidget();
        }
      }),
    );
  }

  AppBar _buildAppBar(BuildContext context) => AppBar(
    // leading: const Icon(Icons.close, color: Colors.blue),
    actions: _actionAppBar(context),
  );

  List<Widget> _actionAppBar(BuildContext context) => [
    _donotAction(context),
    const SizedBox(width: 10),
    _downTime(),
    const SizedBox(width: 10),
  ];

  Widget _donotAction(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log(controller.userSelections.toString());
      },
      child: Chip(
        label: Text(
          "I don't known",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _downTime() {
    return Chip(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(16),
      ),
      label: CountDownTimer(controller.time, finish: (value) {
        controller.onTimeEnd();
      }),
    );
  }

  Future<void> showSimpleDialog(String message, BuildContext context) async {
    return await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
