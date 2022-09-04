import 'package:flutter/material.dart';
import 'package:test_app/features/test/domain/enums/test_question_type_enum.dart';
import '../../../../../../core/base_state/widgets/base_stream_widet.dart';
import '../../../../../../core/config/app_text_style.dart';
import '../../../../../../core/config/palette.dart';
import '../../../../../../core/widgets/quill_content/quill_content_widget.dart';
import '../../../../domain/models/test/test_type/test_type.dart';
import '../../../controllers/test_doing_page_controller.dart';
import '../test_question_types/test_question_complete_paragraph_widget.dart';
import '../test_question_types/test_question_match_widget.dart';
import 'test_content_audio_widget.dart';
import 'test_content_image_widget.dart';

class GroupQuestionWidget extends StatefulWidget {
  final int index;
  final TestSectionType section;
  final TestDoingPageController controller;
  const GroupQuestionWidget({
    required this.index,
    required this.section,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<GroupQuestionWidget> createState() => _GroupQuestionWidgetState();
}

class _GroupQuestionWidgetState extends State<GroupQuestionWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          QuillContentWidget(
            widget.section.name.operations,
            fontWeight: FontWeight.w600,
            fontSize: (DefaultTextStyle.of(context).style.fontSize ?? 14) + 2,
            // color: const Color(0xff2559bf),
            color: AppColors.primary,
            // prefix: TextSpan(
            //   text: 'Bài ${widget.index + 1}: ',
            //   style: AppTextStyle.w700(
            //     color: AppColors.primary,
            //     fontFamily: 'Roboto',
            //     lineHeight: 1.5,
            //     fontSize: DefaultTextStyle.of(context).style.fontSize,
            //   ),
            // ),
          ),
          if ((widget.section.audios ?? []).isNotEmpty) ...[
            const SizedBox(height: 16),
            TestContentAudioWidget(widget.section.audios!),
          ],
          if ((widget.section.type != TestQuestionTypeEnum.CompleteParagraph) &&
              (widget.section.paragraph?.operations != null)) ...[
            const SizedBox(
              height: 8,
            ),
            QuillContentWidget(
              widget.section.paragraph!.operations,
              fontSize: DefaultTextStyle.of(context).style.fontSize,
            ),
          ],
          if ((widget.section.images ?? []).isNotEmpty) ...[
            const SizedBox(
              height: 16,
            ),
            TestContentImageWidget(widget.section.images!),
          ],
          if (widget.section.type ==
              TestQuestionTypeEnum.CompleteParagraph) ...[
            BaseStreamWidget<Map<String, List<String>>>(
              stream: widget.controller.userSelects.stream,
              builder: (context, selections) {
                List<String> _answered = [];
                final _selectedAnswerIds =
                    widget.section.questions.map((e) => e.id).toList();
                for (var i = 0; i < _selectedAnswerIds.length; i++) {
                  final _id = _selectedAnswerIds[i];
                  if (selections.containsKey(_id)) {
                    if (selections[_id]!.isNotEmpty) {
                      _answered.add(selections[_id]!.first);
                    } else {
                      _answered.add('');
                    }
                  }
                }
                // selections[_question.id] ?? [];
                return TestQuestionCompleteParagraphWidget(
                  section: widget.section,
                  onAnswering: (index, value) => widget.controller
                      .answering(widget.section.questions[index].id, [value]),
                  answered: _answered,
                );
              },
            ),
          ] else if (widget.section.type == TestQuestionTypeEnum.Match) ...[
            const SizedBox(
              height: 16,
            ),
            TestQuestionMatchWidget(
              section: widget.section,
              onAnswering: (index, value) => widget.controller.answering(
                  widget.section.questions[index].id,
                  value == null ? [] : [value]),
            )
          ]
        ],
      ),
    );

    // return Container(
    //   padding: const EdgeInsets.only(
    //     left: padding,
    //     bottom: 16,
    //     top: 16,
    //   ),
    //   decoration: BoxDecoration(
    //     border: Border(
    //       bottom: BorderSide(
    //         color: AppColors.border,
    //       ),
    //     ),
    //   ),
    //   child: ExpandableNotifier(
    //     controller: widget.controller.expandableControllers[widget.index],
    //     // initialExpanded: true,
    //     child: Container(
    //       decoration: BoxDecoration(
    //         border: Border(
    //           left: BorderSide(
    //             color: AppColors.green,
    //             width: 6,
    //           ),
    //         ),
    //       ),
    //       // padding: EdgeInsets.only(left: 16),
    //       child: ExpandablePanel(
    //         theme: ExpandableThemeData(
    //           headerAlignment: ExpandablePanelHeaderAlignment.center,
    //           iconPadding: EdgeInsets.only(right: 24),
    //           tapBodyToExpand: false,
    //           tapHeaderToExpand: true,
    //           tapBodyToCollapse: false,
    //           hasIcon: true,
    //         ),
    //         collapsed: SizedBox.shrink(),
    //         header: Container(
    //           color: Colors.white,
    //           padding: const EdgeInsets.symmetric(
    //             horizontal: padding,
    //             vertical: 3,
    //           ),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               Text(
    //                 "BÀI TẬP ${widget.index + 1}",
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.w700,
    //                   fontSize: 20,
    //                   fontFamily: 'GoogleSans',
    //                   //  DefaultTextStyle.of(context).style.fontFamily,
    //                 ),
    //               ),
    //               SizedBox(
    //                 width: 8,
    //               ),
    //               TagWidget(
    //                 text:
    //                     '${DataConverter.scoreToString(widget.section.totalScore)} điểm',
    //                 color: AppColors.primary,
    //                 backgroundColor: AppColors.primary10,
    //                 minHeight: 38,
    //                 borderRadius: 19,
    //                 padding: EdgeInsets.symmetric(horizontal: 16),
    //               ),
    //             ],
    //           ),
    //         ),
    //         expanded: Container(
    //           padding: const EdgeInsets.symmetric(horizontal: padding),
    //           //  width: double.infinity,
    //           child: Column(
    //             mainAxisSize: MainAxisSize.max,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               const SizedBox(
    //                 height: 8,
    //               ),
    //               QuillContentWidget(
    //                 widget.section.name.operations,
    //                 fontWeight: FontWeight.w600,
    //                 fontSize: DefaultTextStyle.of(context).style.fontSize,
    //               ),
    //               if ((widget.section.audios ?? []).length > 0) ...[
    //                 const SizedBox(height: 16),
    //                 TestContentImageWidget(widget.section.audios!),
    //               ],
    //               if (widget.section.paragraph?.operations != null) ...[
    //                 const SizedBox(
    //                   height: 8,
    //                 ),
    //                 QuillContentWidget(
    //                   widget.section.paragraph!.operations,
    //                   fontSize: DefaultTextStyle.of(context).style.fontSize,
    //                 ),
    //               ],
    //               if ((widget.section.images ?? []).length > 0) ...[
    //                 const SizedBox(
    //                   height: 16,
    //                 ),
    //                 TestContentImageWidget(widget.section.images!),
    //               ],
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
