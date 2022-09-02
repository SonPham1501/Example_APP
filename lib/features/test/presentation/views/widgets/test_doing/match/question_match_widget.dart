import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../../core/config/app_text_style.dart';
import '../../../../../../../core/config/constants/asset_path.dart';
import '../../../../../../../core/config/palette.dart';
import '../../../../../../../core/ultis/helpers/string_ultis.dart';
import '../../../../../../../core/ultis/ui/action_sheet_service/action_sheet_service.dart';
import '../../../../../../../core/widgets/app_buttons.dart';
import '../../../../../../../core/widgets/layouts/adaptive_loading_widget.dart';
import '../../../../../../../core/widgets/quill_content/quill_content_widget.dart';
import '../../../../../domain/models/test/quill_content/quill_content.dart';
import '../../../../../domain/models/test/test_type/test_type.dart';
import 'models.dart';
import 'dart:math' as math;
import '../index.dart';
part 'question_match_widgets.dart';

class QuestionMatchWidget extends StatefulWidget {
  final List<TestQuestionType> questions;
  final ScrollController? scrollController;
  final Function(String questionId, String? val) onChanged;
  QuestionMatchWidget({
    Key? key,
    required this.questions,
    required this.onChanged,
    this.scrollController,
  }) : super(key: key);

  @override
  _QuestionMatchWidget createState() => _QuestionMatchWidget();
}

class _QuestionMatchWidget extends State<QuestionMatchWidget>
    with AutomaticKeepAliveClientMixin {
  late List<DragListItemModel<QuillContent>> questions;
  late List<ItemValue<QuillContent>> answers;
  // final GlobalKey _draggableKey = GlobalKey();
  bool loading = false;
//  final _listViewKey = GlobalKey();
  //late ScrollController? _scroller;
  //bool _isDragging = false;

  @override
  void initState() {
    //_scroller = widget.scrollController;
    final widgetQuestions = widget.questions;
    widgetQuestions.shuffle();
    answers = List.generate(widget.questions.length, (index) {
      final _tmp = widgetQuestions[index].answers.isNotEmpty
          ? widgetQuestions[index].answers.first
          : TestQuestionAnswerType(id: '');
      return new ItemValue<QuillContent>(
        id: _tmp.id,
        index: index,
        text: _tmp.content ?? QuillContent(),
      );
    }).toList();
    widgetQuestions.shuffle();

    questions = List.generate(
      widget.questions.length,
      (index) => new DragListItemModel<QuillContent>.fromQuestion(
        id: widgetQuestions[index].id,
        index: index,
        text: widgetQuestions[index].name ?? QuillContent(),
      ),
    ).toList();
    setState(() {
      this.loading = false;
    });

    super.initState();
  }

  @override
  void dispose() {
    if (widget.scrollController != null) widget.scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return loading
        ? Center(
            child: ApdaptiveLoadingWidget(),
          )
        : SingleChildScrollView(
            child: ListView.separated(
              //  key: _listViewKey,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              itemCount: questions.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 12.0,
                );
              },
              itemBuilder: (context, index) {
                final item = questions[index];
                return _ListQuestionItem(
                  item: item,
                  answers: answers,
                  onSelected: (value) {
                    _onAnswerDrop(questionIndex: index, answer: value);
                  },
                  onUnlink: () {
                    ActionSheetService.showConfirm(
                      context,
                      "Bỏ lựa chọn",
                      content: "Bạn muốn thay đổi lựa chọn khác?",
                      icon: face_question,
                      onOk: () {
                        setState(() {
                          if (item.linkText != null) {
                            questions[index] =
                                questions[index].copyWith(linkText: null);

                            answers.add(item.linkText!);
                          }
                        });
                      },
                    );
                  },
                );
              },
            ),
          );
  }

  // Widget _createListener({required Widget child}) {
  //   final _pointTop = MediaQuery.of(context).viewPadding.top + 60;
  //   final _pointBottom = MediaQuery.of(context).size.height -
  //       MediaQuery.of(context).viewPadding.bottom -
  //       120;
  //   return Listener(
  //     child: child,
  //     onPointerMove: (PointerMoveEvent event) {
  //       if (widget.scrollController == null) return;
  //       if (!_isDragging) {
  //         return;
  //       }
  //       // RenderBox render =
  //       //     _listViewKey.currentContext?.findRenderObject() as RenderBox;
  //       // Offset position = render.localToGlobal(Offset.zero);
  //       // double topY = position.dy;
  //       // double bottomY = topY + render.size.height;

  //       // print("x: ${position.dy}, "
  //       //     "y: ${position.dy}, "
  //       //     "height: ${render.size.width}, "
  //       //     "width: ${render.size.height}");

  //       const detectedRange = 100;
  //       const moveDistance = 6;
  //       // print(event.position.dy);
  //       if (event.position.dy <= _pointTop) {
  //         widget.scrollController?.jumpTo(0);
  //         return;
  //       }
  //       if (event.position.dy >= _pointBottom) {
  //         widget.scrollController
  //             ?.jumpTo(widget.scrollController!.position.maxScrollExtent);
  //         return;
  //       }
  //       if (event.position.dy < _pointTop + detectedRange) {
  //         var to = widget.scrollController!.offset - moveDistance;
  //         to = (to < 0) ? 0 : to;
  //         widget.scrollController?.jumpTo(to);
  //       }
  //       if (event.position.dy > _pointBottom - detectedRange) {
  //         widget.scrollController
  //             ?.jumpTo(widget.scrollController!.offset + moveDistance);
  //       }
  //     },
  //   );
  // }

  void _clearAnswer({
    required int questionIndex,
  }) {
    setState(() {
      questions[questionIndex] = questions[questionIndex].copyWith(
        linkText: null,
      );
    });
  }

  void _onAnswerDrop({
    required ItemValue<QuillContent> answer,
    required int questionIndex,
  }) {
    setState(() {
      final _currentAnswerIndex =
          questions.indexWhere((element) => element.linkText == answer);
      //nếu drop từ question list
      if (_currentAnswerIndex != -1) {
        //nếu drop question đã có answer thì swap
        if (questions[questionIndex].linkText != null) {
          //swap
          questions[_currentAnswerIndex] = questions[_currentAnswerIndex]
              .copyWith(linkText: questions[questionIndex].linkText);
        } else {
          questions[_currentAnswerIndex] =
              questions[_currentAnswerIndex].copyWith(linkText: null);
        }
        questions[questionIndex] =
            questions[questionIndex].copyWith(linkText: answer);
      } else {
        if (questions[questionIndex].linkText != null) {
          answers.add(questions[questionIndex].linkText!);
        }
        answers.remove(answer);
        questions[questionIndex] =
            questions[questionIndex].copyWith(linkText: answer);
      }
      this.widget.onChanged(this.questions[questionIndex].text.id,
          this.questions[questionIndex].linkText?.id);
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
