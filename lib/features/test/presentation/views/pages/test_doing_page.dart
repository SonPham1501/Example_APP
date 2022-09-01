import "dart:core";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../core/config/app_text_style.dart';
import '../../../../../core/base_state/bloc_state.dart';
import '../../../../../core/base_state/widgets/base_stream_widet.dart';
import '../../../../../core/base_state/widgets/base_view.dart';
import '../../../../../core/config/constants/asset_path.dart';
import '../../../../../core/config/palette.dart';
import '../../../../../core/ultis/helpers/app_utils.dart';
import '../../../../../core/ultis/ui/action_sheet_service/action_sheet_service.dart';
import '../../../../../core/widgets/app_buttons.dart';
import '../../../../../core/widgets/controls/count_down_widget.dart';
import '../../../../../core/widgets/layouts/adaptive_loading_widget.dart';
import '../../../domain/enums/test_question_type_enum.dart';
import '../../../domain/models/test/test_type/test_type.dart';
import '../../controllers/test_doing_page_controller.dart';
import '../widgets/test_doing/choices_answer_widget.dart';
import '../widgets/test_doing/circle_character_widget.dart';
import '../widgets/test_doing/group_question_widget.dart';
import '../widgets/test_doing/question_widget.dart';

class TestDoingPage extends BaseView<TestDoingPageController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: DefaultTextStyle(
        style: const TextStyle(
          inherit: true,
          fontFamily: 'Roboto',
          fontSize: 16,
          color: AppColors.text900,
        ),
        child: WillPopScope(
          onWillPop: () async {
            if (controller.submitted == true) Navigator.of(context).pop();
            ActionSheetService.showConfirm(
              context,
              'Bạn chắc chắn muốn thoát?',
              content:
                  'Hãy nộp bài trước khi thoát bạn nhé, nếu không bạn sẽ bị điểm 0 đó',
              onOk: () {
                Navigator.of(context).pop();
              },
              isDanger: true,
              icon: face_worry,
            );
            return false;
          },
          child: GestureDetector(
            onTap: () => AppUtils.dismissKeyboard(),
            child: Scaffold(
              appBar: _buildAppBar(context, controller),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              resizeToAvoidBottomInset: false,
              floatingActionButton: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: BaseStreamWidget<int>(
                  stream: controller.currentIndex.stream,
                  builder: (_, currentSlide) => Column(
                    children: [
                      BaseStreamWidget<int>(
                        stream: controller.totalAnswered.stream,
                        builder: (context, data) {
                          return LinearProgressIndicator(
                            value: data / controller.userSelects.value.length,
                            color: AppColors.primary,
                            minHeight: 2,
                            backgroundColor: AppColors.text400,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: currentSlide > 0 ? 1 : .4,
                                  child: AppButtons.outlined(
                                    customSize: const Size(48, 42),
                                    label: "Quay lại",
                                    onPressed: () {
                                      if (currentSlide > 0) {
                                        controller.previousSlide();
                                      }
                                    },
                                    textStyle: AppTextStyle.w600(
                                      color: AppColors.text700,
                                    ),
                                    borderColor: AppColors.text500,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: currentSlide <
                                          controller.test.sections.length - 1
                                      ? 1
                                      : .4,
                                  child: AppButtons.rounded(
                                    customSize: const Size(48, 42),
                                    label: "Tiếp theo",
                                    borderRadius: 360,
                                    onPressed: () {
                                      if (currentSlide <
                                          controller.test.sections.length - 1) {
                                        controller.nextSlide();
                                      }
                                    },
                                    textStyle: AppTextStyle.w600(
                                      color: Colors.white,
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 36, 142, 89),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: SafeArea(
                child: Container(
                  color: const Color(0xfff3f6fd),
                  child: Column(
                    children: [
                      Expanded(
                        child: StreamBuilder<BlocState>(
                          stream: controller.stateStream,
                          builder: (context, snapshot) {
                            return snapshot.data is SuccessState
                                ? PageView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: controller.test.sections.length,
                                    onPageChanged: controller.onSlideChanged,
                                    controller: controller.pageController,
                                    itemBuilder: (context, sectionIndex) {
                                      // final position =
                                      //     controller.testSlideData[index];
                                      // final _scrollController =
                                      //     position.section?.type ==
                                      //             TestQuestionTypeEnum.Match
                                      //         ? ScrollController()
                                      //         : null;
                                      return SingleChildScrollView(
                                        //  controller: _scrollController,
                                        padding: const EdgeInsets.only(
                                            top: 16, bottom: 86),
                                        child: Column(
                                          children: [
                                            GroupQuestionWidget(
                                              index: sectionIndex,
                                              section: controller
                                                  .test.sections[sectionIndex],
                                              controller: controller,
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            ...List.generate(
                                              controller
                                                  .test
                                                  .sections[sectionIndex]
                                                  .questions
                                                  .length,
                                              (qIndex) => QuestionWidget(
                                                qIndex,
                                                controller
                                                    .test
                                                    .sections[sectionIndex]
                                                    .questions[qIndex],
                                                controller: controller,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                : const Center(
                                    child: ApdaptiveLoadingWidget(),
                                  );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(
      BuildContext context, TestDoingPageController controller) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      toolbarTextStyle: const TextStyle(
        // inherit: true,
        fontFamily: 'Roboto',
        fontSize: 16,
        color: Palette.textBlack,
      ),
      elevation: 0,
      toolbarHeight: 60,
      backgroundColor: Colors.white,
      // backgroundColor: Colors.transparent,
      // leadingWidth: 115,
      //titleSpacing: 0,
      leading: IconButton(
        alignment: Alignment.center,
        onPressed: () {
          Navigator.maybePop(context);
        },
        icon: Icon(
          Icons.close,
          size: 24,
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      //   child: BaseStreamWidget<bool>(
      //       stream: controller.expanded.stream,
      //       builder: (_, expanded) => expanded
      //           ? IconButton(
      //               alignment: Alignment.centerLeft,
      //               onPressed: () {
      //                 controller.toggle();
      //               },
      //               icon: Icon(
      //                 Icons.close,
      //                 size: 24,
      //               ),
      //             )
      //           : BaseStreamWidget<int>(
      //               stream: controller.currentIndex.stream,
      //               builder: (context, snapshot) {
      //                 return OutlinedButton(
      //                   style: OutlinedButton.styleFrom(
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(16),
      //                     ),
      //                     side: BorderSide(
      //                       color: AppColors.primary,
      //                     ),
      //                     minimumSize: Size(0, 0),
      //                   ),
      //                   child: Row(
      //                     children: [
      //                       Text(
      //                         "Bài ${snapshot + 1}",
      //                         style: AppTextStyle.w600(
      //                           color: AppColors.primary,
      //                           fontSize: 14,
      //                         ),
      //                       ),
      //                       const SizedBox(
      //                         width: 6,
      //                       ),
      //                       Icon(
      //                         CupertinoIcons.chevron_down,
      //                         color: AppColors.primary,
      //                         size: 12,
      //                       ),
      //                     ],
      //                   ),
      //                   onPressed: () {
      //                     controller.toggle();
      //                   },
      //                 );
      //               })

      //       // IconButton(
      //       //     onPressed: () {
      //       //       controller.toggle();
      //       //     },
      //       //     icon: svgIcon(
      //       //       'assets/icons/common/ic_menu.svg',
      //       //       width: 24,
      //       //     ),
      //       //   ),
      //       ),
      // ),
      // leadingWidth: 0,
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.text700),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.clock, size: 18, color: Colors.black),
                const SizedBox(width: 4),
                // SizedBox(
                //   //width: 50,
                //   child: CountDownWidget(
                //     widgetOnTimeEnd: Text(
                //       '--:--',
                //       style: TextStyle(
                //         fontWeight: FontWeight.w700,
                //         color: Colors.black,
                //         fontSize: 16,
                //         fontFamily: 'Roboto',
                //       ),
                //     ),
                //     controller: controller.countDownController,
                //     textStyle: TextStyle(
                //       fontWeight: FontWeight.w500,
                //       fontSize: 16,
                //       fontFamily: 'Roboto',
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: AppButtons.rounded(
            label: "Nộp bài",
            padding: EdgeInsets.all(0),
            customSize: Size(90, 32),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: AppColors.primary,
            textStyle: AppTextStyle.w600(
              color: Colors.white,
            ),
            // style: TextButton.styleFrom(
            //   alignment: Alignment.centerRight,
            //   padding: EdgeInsets.only(right: 16),
            // ),
            onPressed: () {
              // setState(() {});
              // controller.onTimeoutAlert();
              ActionSheetService.showFloatingBottomSheet(
                context,
                widgetBuilder: (context) => _SubmitTestModal(),
                okText: "Nộp bài",
                cancelText: "Hủy bỏ",
                okButtonBackground: AppColors.primary,
                screenPadding: 12,
              ).then((value) {
                if (value == true) {
                  controller.submit();
                }
              });
              // print(controller.userSelects);
            },
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Text(
            //       'Nộp bài',
            //       style: TextStyle(
            //         fontWeight: FontWeight.w500,
            //         color: Colors.white,
            //         fontSize: 16,
            //         fontFamily: 'Roboto',
            //       ),
            //     ),
            //     const SizedBox(width: 5),
            //     Icon(
            //       CupertinoIcons.chevron_right,
            //       color: Colors.white,
            //       size: 14,
            //     )
            //   ],
            // ),
          ),
        ),
      ],
    );
  }
}

class _PopupSelections extends StatefulWidget {
  final Map<String, List<String>> userSelects;
  final int currentSection;
  final List<TestQuestionSlideModel> slides;
  final int totalSections;
  final ValueChanged<TestQuestionSlideModel> onSelect;
  const _PopupSelections({
    required this.userSelects,
    required this.currentSection,
    required this.slides,
    required this.onSelect,
    required this.totalSections,
  });

  @override
  State<_PopupSelections> createState() => _PopupSelectionsState();
}

class _PopupSelectionsState extends State<_PopupSelections> {
  int currentSection = 1;

  List<TestQuestionSlideModel> get _questions =>
      widget.slides.where((x) => x.sectionIndex == currentSection).toList();

  @override
  void initState() {
    currentSection = widget.currentSection;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _GroupQuestionSelectingWidget(
          selectedIndex: currentSection,
          totalSections: widget.totalSections,
          onSelect: (val) {
            setState(() {
              currentSection = val;
            });
          },
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, idx) {
              final question = _questions[idx];
              return QuestionStatusWidget(
                index: idx,
                question: question.question,
                selections: widget.userSelects[question.question.id] ?? [],
                onClick: () {
                  widget.onSelect(question);
                },
              );
            },
            separatorBuilder: (ctx, idx) => const Divider(
              height: 1,
            ),
            itemCount: _questions.length,
          ),
        ),
      ],
    );
  }
}

class QuestionStatusWidget extends StatelessWidget {
  final int index;
  final TestQuestionType question;
  final List<String> selections;
  final VoidCallback onClick;
  final Color? backgroundColor;
  QuestionStatusWidget({
    required this.index,
    required this.question,
    required this.selections,
    required this.onClick,
    this.backgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        backgroundColor: backgroundColor,
      ),
      onPressed: onClick,
      child: _statusWidget(context),
    );
  }

  Widget _statusWidget(BuildContext context) {
    if (selections.length == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Icons.warning,
                color: AppColors.orange,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                "Câu hỏi ${index + 1}",
                style: AppTextStyle.w500(
                  color: Palette.textBlack,
                  fontSize: DefaultTextStyle.of(context).style.fontSize,
                  fontFamily: DefaultTextStyle.of(context).style.fontFamily,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryRed.withOpacity(.2),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Row(
                children: [
                  Text(
                    "Trả lời",
                    style: AppTextStyle.w700(
                      color: AppColors.primaryRed,
                      fontSize: 14,
                      fontFamily: DefaultTextStyle.of(context).style.fontFamily,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColors.primaryRed,
                    size: 14,
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }

    switch (question.type) {
      case TestQuestionTypeEnum.Choices:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: AppColors.primary,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Câu hỏi ${index + 1}",
                  style: AppTextStyle.w500(
                    color: Palette.textBlack,
                    fontSize: DefaultTextStyle.of(context).style.fontSize,
                    fontFamily: DefaultTextStyle.of(context).style.fontFamily,
                  ),
                ),
              ],
            ),
            CircleCharacterWidget(
              text: ChoiceAnswerWidget.getLabelFromAnswer(
                question.answers,
                selections[0],
              ),
              backgroundColor: AppColors.primary,
              titleTextStyle: AppTextStyle.w500(
                color: Colors.white,
                fontSize: DefaultTextStyle.of(context).style.fontSize,
                fontFamily: DefaultTextStyle.of(context).style.fontFamily,
              ),
            ),
          ],
        );

      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.edit,
                  color: AppColors.green,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Câu hỏi ${index + 1}",
                  style: AppTextStyle.w500(
                    color: Palette.textBlack,
                    fontSize: DefaultTextStyle.of(context).style.fontSize,
                    fontFamily: DefaultTextStyle.of(context).style.fontFamily,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primary10,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  "Đã trả lời",
                  style: AppTextStyle.w700(
                    color: AppColors.primary,
                    fontSize: DefaultTextStyle.of(context).style.fontSize,
                    fontFamily: DefaultTextStyle.of(context).style.fontFamily,
                  ),
                ),
              ),
            ),
          ],
        );
    }
  }
}

class _GroupQuestionSelectingWidget extends StatelessWidget {
  final int totalSections;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  _GroupQuestionSelectingWidget({
    required this.totalSections,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          alignment: Alignment.centerLeft,
          height: 40,
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, i) => const SizedBox(
              width: 16,
            ),
            itemCount: totalSections,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(80, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  //fixedSize: Size(32, 32),
                  backgroundColor: selectedIndex == index
                      ? AppColors.primary
                      : Color(0xffF4F4F4),
                ),
                onPressed: () => this.onSelect(index),
                child: Text(
                  'Bài ${index + 1}',
                  style: TextStyle(
                    fontSize: DefaultTextStyle.of(context).style.fontSize,
                    fontFamily: DefaultTextStyle.of(context).style.fontFamily,
                    fontWeight: FontWeight.w500,
                    color: selectedIndex == index
                        ? Colors.white
                        : Palette.textBlack,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SubmitTestModal extends StatelessWidget {
  const _SubmitTestModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/faces/question.png'),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Nộp bài nhé!',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.black,
            fontFamily: DefaultTextStyle.of(context).style.fontFamily,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Hãy đảm bảo bạn đã làm hết các câu hỏi trước khi nộp bài',
          style: TextStyle(
            fontSize: DefaultTextStyle.of(context).style.fontSize,
            fontFamily: DefaultTextStyle.of(context).style.fontFamily,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
