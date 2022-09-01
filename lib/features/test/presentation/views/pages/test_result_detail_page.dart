// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:math' as math;
// import '../../../../../core/widgets/layouts/adaptive_loading_widget.dart';
// import '../../../../../injection.dart';
// import '../../../domain/models/test/test_archived_type/test_archived_type.dart';
// import 'test_detail_answer_page.dart';

// class TestResultDetailPage extends StatefulWidget {
//   final int? index;
//   final int? testArchivedId;
//   final int? userId;

//   final int? classTestUserId;

//   final TestArchivedType? testArchived;
//   final BaseTestResultModel? result;
//   TestResultDetailPage({
//     this.result,
//     this.testArchived,
//     this.index,
//     this.testArchivedId,
//     this.userId,
//     this.classTestUserId,
//   });

//   @override
//   State<TestResultDetailPage> createState() => _TestResultDetailPageState();
// }

// class _TestResultDetailPageState extends State<TestResultDetailPage>
//     with CommonStateMethodMixin {
//   final TestRepository testRepository = getIt<TestRepository>();
//   final ClassTestRepository classTestRepository = getIt<ClassTestRepository>();
//   BaseTestResultModel? _result;
//   // TestArchivedType? _test;

//   //TestArchivedType get test => _test!;
//   BaseTestResultModel? get result => _result;

//   bool loading = true;

//   @override
//   void initState() {
//     getTestUserDetail();
//     super.initState();
//   }

//   Future<void> getTestUserDetail() async {
//     if (widget.result != null) {
//       _result = widget.result;
//       if (widget.testArchived != null) {
//         _result = _result?.copyWith(testArchived: widget.testArchived);
//       }
//       if (mounted) {
//         setState(() {
//           loading = false;
//         });
//       }
//       return;
//     } else if (this.widget.classTestUserId != null) {
//       final either = await this
//           .classTestRepository
//           .getClassTestUser(id: this.widget.classTestUserId!);
//       either.fold((l) {
//         showErrorMessage(l);
//       }, (r) {
//         //print(_test);

//         if (mounted) {
//           setState(() {
//             _result = BaseTestResultModel.fromClassTestUserType(r);
//             loading = false;
//           });
//         }
//       });
//     } else if ((this.widget.index != null) &&
//         (this.widget.testArchivedId != null) &&
//         (this.widget.userId != null)) {
//       final either = await this.testRepository.getTestUser(
//             userId: widget.userId!,
//             testArchivedId: widget.testArchivedId!,
//             result: true,
//             testArchived: true,
//             index: widget.index!,
//             test: true,
//           );
//       either.fold((l) {
//         showErrorMessage(l);
//       }, (r) {
//         if (mounted) {
//           setState(() {
//             _result = BaseTestResultModel.fromTestUserType(r);
//             loading = false;
//           });
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     //print(this.result);
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.dark,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           systemOverlayStyle: SystemUiOverlayStyle.dark,
//           leading: IconButton(
//             icon: Icon(
//               CupertinoIcons.chevron_back,
//               color: Palette.subTextColor,
//             ),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//           elevation: 0,
//           title: const Text(
//             'Đáp án chi tiết',
//             style: AppTextStyle.appBarTextStyle,
//           ),
//           centerTitle: true,
//           actions: [
//             result?.testArchived != null
//                 ? IconButton(
//                     onPressed: () {
//                       ActionSheetService.showBottomSheet(
//                         context,
//                         builder: (ctx) =>
//                             _TestInfoModal(test: result!.testArchived!),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       );
//                     },
//                     icon: Icon(Icons.info),
//                   )
//                 : SizedBox.shrink(),
//           ],
//           bottom: PreferredSize(
//             preferredSize: Size.fromHeight(50),
//             child: Container(
//               decoration: const BoxDecoration(
//                 border: const Border(
//                   bottom: const BorderSide(
//                     color: Palette.commonBorder,
//                   ),
//                 ),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: SizedBox(
//                       height: 50,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 6,
//                         ),
//                         child: Row(
//                           children: [
//                             Container(
//                               width: 20,
//                               height: 20,
//                               decoration: BoxDecoration(
//                                 borderRadius: const BorderRadius.all(
//                                   Radius.circular(6),
//                                 ),
//                                 color: AnswerResultEnum.correct.color,
//                               ),
//                             ),
//                             const SizedBox(width: 5),
//                             Text('Đúng'),
//                             const SizedBox(width: 25),
//                             Container(
//                               width: 20,
//                               height: 20,
//                               decoration: BoxDecoration(
//                                 borderRadius: const BorderRadius.all(
//                                   Radius.circular(6),
//                                 ),
//                                 color: AnswerResultEnum.incorrect.color,
//                               ),
//                             ),
//                             const SizedBox(width: 5),
//                             Text('Sai'),
//                             const SizedBox(width: 25),
//                             Container(
//                               width: 20,
//                               height: 20,
//                               decoration: BoxDecoration(
//                                 borderRadius: const BorderRadius.all(
//                                   Radius.circular(6),
//                                 ),
//                                 color: AnswerResultEnum.notanswer.color,
//                               ),
//                             ),
//                             const SizedBox(width: 5),
//                             Text('Chưa làm'),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         body: SafeArea(
//           child: loading
//               ? const Center(
//                   child: ApdaptiveLoadingWidget(),
//                 )
//               : Builder(
//                   builder: (context) {
//                     if ((_result != null) && (result?.testArchived != null)) {
//                       final data = _result!;
//                       return DefaultTabController(
//                         length: result!.testArchived!.sections.length,
//                         child: SizedBox.expand(
//                           child: Tab(
//                             child: Container(
//                               child: Column(
//                                 children: [
//                                   TabBar(
//                                     tabs: List.generate(
//                                       result!.testArchived!.sections.length,
//                                       (index) => Tab(
//                                         icon: Text('Bài ${index + 1}'),
//                                       ),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                       color: AppColors.text200,
//                                       child: TabBarView(
//                                         physics: NeverScrollableScrollPhysics(),
//                                         children: List.generate(
//                                             data.testArchived!.sections.length,
//                                             (sIndex) {
//                                           if (data.testArchived!
//                                                   .sections[sIndex].type ==
//                                               TestQuestionTypeEnum.Match)
//                                             return SingleChildScrollView(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       horizontal: 12,
//                                                       vertical: 12),
//                                               child: _MatchResultAnswerWidget(
//                                                 data.testArchived!
//                                                     .sections[sIndex],
//                                                 data.resultList,
//                                               ),
//                                             );
//                                           return SingleChildScrollView(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 12, vertical: 12),
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 _GroupQuestionContentWidget(
//                                                   data.testArchived!
//                                                       .sections[sIndex],
//                                                 ),
//                                                 const SizedBox(
//                                                   height: 16,
//                                                 ),
//                                                 ...List.generate(
//                                                   data
//                                                       .testArchived!
//                                                       .sections[sIndex]
//                                                       .questions
//                                                       .length,
//                                                   (index) =>
//                                                       Builder(builder: (ctx) {
//                                                     TestSubmitResultQuestion
//                                                         _answer = data
//                                                             .resultList
//                                                             .firstWhere(
//                                                       (element) =>
//                                                           element.question.id ==
//                                                           data
//                                                               .testArchived!
//                                                               .sections[sIndex]
//                                                               .questions[index]
//                                                               .id,
//                                                       orElse: () =>
//                                                           TestSubmitResultQuestion(
//                                                         question: data
//                                                             .testArchived!
//                                                             .sections[sIndex]
//                                                             .questions[index],
//                                                         state: AnswerResultEnum
//                                                             .notanswer,
//                                                       ),
//                                                     );
//                                                     return _QuestionResultAnswerWidget(
//                                                       index,
//                                                       _answer,
//                                                       question: data
//                                                           .testArchived!
//                                                           .sections[sIndex]
//                                                           .questions[index],
//                                                     );
//                                                   }),
//                                                 ),
//                                               ],
//                                             ),
//                                           );
//                                         }),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     } else
//                       return const Center(
//                         child: Text('Tải thông tin thất bại'),
//                       );
//                   },
//                 ),
//         ),
//       ),
//     );
//   }
// }

// class _MatchResultAnswerWidget extends StatelessWidget {
//   final TestSectionType section;
//   final List<TestSubmitResultQuestion> answers;
//   _MatchResultAnswerWidget(
//     this.section,
//     this.answers,
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ...List.generate(
//           section.questions.length,
//           (index) {
//             TestSubmitResultQuestion _answer = answers.firstWhere(
//               (element) => element.question.id == section.questions[index].id,
//               orElse: () => TestSubmitResultQuestion(
//                 question: section.questions[index],
//                 state: AnswerResultEnum.notanswer,
//               ),
//             );
//             return Container(
//               margin: EdgeInsets.only(bottom: 12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 // border: Border(
//                 //   bottom: BorderSide(
//                 //     color: AppColors.border,
//                 //   ),
//                 // ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppColors.text400,
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(0, 3), // changes position of shadow
//                   ),
//                 ],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _TextStartWithWidget(
//                     index: index,
//                     color: _answer.state.color,
//                     text: QuillContent(
//                       operations:
//                           section.questions[index].name?.operations ?? [],
//                     ),
//                   ),
//                   Container(
//                     width: 32,
//                     padding: EdgeInsets.symmetric(vertical: 8),
//                     alignment: Alignment.center,
//                     transformAlignment: Alignment.center,
//                     transform: Matrix4.rotationZ(90 * math.pi / 180),
//                     child: Icon(
//                       Icons.link,
//                       color: AppColors.primary,
//                       size: 18,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       CircleCharacterWidget(
//                         text: "",
//                         border: Border.all(color: _answer.state.color),
//                         titleTextStyle: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w700,
//                           height: 1,
//                           fontSize: DefaultTextStyle.of(context).style.fontSize,
//                           fontFamily:
//                               DefaultTextStyle.of(context).style.fontFamily,
//                         ),
//                         backgroundColor: _answer.state.color,
//                       ),
//                       const SizedBox(
//                         width: 16,
//                       ),
//                       Expanded(
//                         child: QuillContentWidget(
//                           section.questions[index].name?.operations ?? [],
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

// class _GroupQuestionContentWidget extends StatelessWidget {
//   final TestSectionType section;
//   _GroupQuestionContentWidget(this.section);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(
//           height: 8,
//         ),
//         QuillContentWidget(
//           section.name.operations,
//           fontWeight: FontWeight.w600,
//           fontSize: DefaultTextStyle.of(context).style.fontSize,
//         ),
//         if ((section.audios ?? []).length > 0) ...[
//           const SizedBox(height: 16),
//           TestContentImageWidget(section.audios!),
//         ],
//         if (section.paragraph?.operations != null) ...[
//           const SizedBox(
//             height: 8,
//           ),
//           QuillContentWidget(
//             section.paragraph!.operations,
//             fontSize: DefaultTextStyle.of(context).style.fontSize,
//           ),
//         ],
//         if ((section.images ?? []).length > 0) ...[
//           const SizedBox(
//             height: 16,
//           ),
//           TestContentImageWidget(section.images!),
//         ],
//       ],
//     );
//   }
// }

// class _QuestionResultAnswerWidget extends StatelessWidget {
//   final int _index;
//   final TestSubmitResultQuestion _result;
//   final TestQuestionType question;
//   const _QuestionResultAnswerWidget(
//     this._index,
//     this._result, {
//     required this.question,
//     Key? key,
//   }) : super(key: key);
//   Color? _getAnswerColor(TestQuestionAnswerType answer) {
//     if (answer.isCorrect) return AnswerResultEnum.correct.color.withOpacity(.2);
//     if ((_result.state == AnswerResultEnum.correct) &&
//         answer.id == _result.selectedAnswers[0]) {
//       return AnswerResultEnum.correct.color.withOpacity(.2);
//     }
//     if (_result.state == AnswerResultEnum.notanswer) return null;
//     if (_result.selectedAnswers.length == 0) return null;
//     if ((_result.state == AnswerResultEnum.incorrect) &&
//         answer.id == _result.selectedAnswers[0]) {
//       return AnswerResultEnum.incorrect.color.withOpacity(.2);
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.text300,
//             spreadRadius: 5,
//             blurRadius: 7,
//             offset: Offset(0, 3), // changes position of shadow
//           ),
//         ],
//         borderRadius: BorderRadius.circular(10),
//       ),
//       clipBehavior: Clip.hardEdge,
//       margin: const EdgeInsets.only(bottom: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             color: _result.state.color,
//             padding: const EdgeInsets.symmetric(
//               horizontal: 15,
//             ),
//             height: 38,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Câu ${_index + 1}',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16,
//                   ),
//                 ),
//                 if ((_result.question.note?.operations ?? []).length > 0) ...[
//                   TextButton(
//                     onPressed: () => appRouter.push(TestDetailAnswerPage(
//                       _result.question,
//                       _index + 1,
//                     )),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           'Xem chi tiết',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                         Icon(
//                           CupertinoIcons.chevron_right,
//                           color: Colors.white,
//                           size: 16,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ]
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 16,
//               vertical: 15,
//             ),
//             child: Column(
//               //direction: Axis.vertical,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 QuillContentWidget(_result.question.name?.operations ?? []),
//                 if ((_result.question.images ?? []).length > 0) ...[
//                   const SizedBox(height: 15),
//                   TestContentImageWidget(_result.question.images!),
//                 ],
//                 const SizedBox(height: 15),
//                 if ((_result.question.type == TestQuestionTypeEnum.Choices) ||
//                     (_result.question.type ==
//                         TestQuestionTypeEnum.TrueFalse)) ...[
//                   Column(
//                     children: List.generate(
//                       _result.question.answers.length,
//                       (index) => Container(
//                         margin: const EdgeInsets.only(bottom: 8.0),
//                         color: _getAnswerColor(_result.question.answers[index]),
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               String.fromCharCode(index + 65) + ". ",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             Expanded(
//                               child: QuillContentWidget(
//                                 _result.question.answers[index].content
//                                         ?.operations ??
//                                     [],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//                 if ((_result.question.type == TestQuestionTypeEnum.Write) ||
//                     (_result.question.type == TestQuestionTypeEnum.Input)) ...[
//                   _AnswerWriteWidget(_result),
//                 ],
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _AnswerWriteWidget extends StatelessWidget {
//   final TestSubmitResultQuestion question;
//   _AnswerWriteWidget(this.question);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (question.state == AnswerResultEnum.incorrect) ...[
//           Text(
//             'Bạn chọn: ',
//             style: AppTextStyle.w600(
//               color: AppColors.text700,
//             ),
//           ),
//           const SizedBox(
//             height: 6,
//           ),
//           Text(
//             question.selectedAnswers.length > 0
//                 ? question.selectedAnswers[0]
//                 : "",
//             style: AppTextStyle.w500(
//               color: AppColors.red,
//             ).copyWith(decoration: TextDecoration.lineThrough),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//         ],
//         if (question.state != AnswerResultEnum.correct) ...[
//           Text(
//             'Đáp án: ',
//             style: AppTextStyle.w500(
//               color: AppColors.text700,
//             ),
//           ),
//           const SizedBox(
//             height: 3,
//           ),
//           ...List.generate(question.question.answers.length, (index) {
//             return Container(
//               margin: const EdgeInsets.only(bottom: 8.0),
//               child: QuillContentWidget(
//                 question.question.answers[index].content?.operations ?? [],
//                 color: Colors.green,
//               ),
//             );
//           }),
//         ]
//       ],
//     );
//   }
// }

// class _TextStartWithWidget extends StatelessWidget {
//   final int index;
//   final bool isAnswer;
//   final QuillContent text;
//   final Color? color;
//   const _TextStartWithWidget({
//     Key? key,
//     this.color,
//     required this.index,
//     required this.text,
//     this.isAnswer = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         CircleCharacterWidget(
//           text: isAnswer ? StringUltis.toABC(index) : (index + 1).toString(),
//           border: Border.all(color: color ?? Color(0xffD7D6DB)),
//           titleTextStyle: TextStyle(
//             color: color ?? Colors.black,
//             fontWeight: FontWeight.w700,
//             height: 1,
//             fontSize: DefaultTextStyle.of(context).style.fontSize,
//             fontFamily: DefaultTextStyle.of(context).style.fontFamily,
//           ),
//           backgroundColor: Colors.transparent,
//         ),
//         const SizedBox(
//           width: 16,
//         ),
//         Expanded(
//           child: QuillContentWidget(text.operations),
//         ),
//       ],
//     );
//   }
// }

// class _TestInfoModal extends StatelessWidget {
//   final TestArchivedType test;
//   const _TestInfoModal({
//     Key? key,
//     required this.test,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//         decoration: BoxDecoration(
//           // color: AppColors.primaryDark,
//           //    boxShadow: [commonDropShadow],
//           //color: Palette.scaffold,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ListTile(
//             //   leading: Text('Tên bài tập'),
//             //   title: Text(test.title),
//             // ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     TagWidget(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                       borderRadius: 16,
//                       text: "English",
//                       color: Colors.white,
//                       backgroundColor: AppColors.primaryDark,
//                     ),
//                     const SizedBox(
//                       width: 16,
//                     ),
//                     TagWidget(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                       borderRadius: 16,
//                       text: "${test.duration}'- ${test.totalQuestions} CÂU",
//                       color: AppColors.text900,
//                       backgroundColor: AppColors.text300,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             Text(
//               test.title,
//               style: AppTextStyle.w700(
//                 fontSize: 14,
//                 fontFamily: 'GoogleSans',
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             // const SizedBox(
//             //   height: 16,
//             // ),
//             const Divider(
//               height: 32,
//               color: AppColors.text300,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Wrap(
//                   //spacing: 32,
//                   children: [
//                     SizedBox(
//                       width: 100,
//                       child: Text(
//                         'Ngày tạo',
//                         style: AppTextStyle.w700(color: AppColors.text900),
//                       ),
//                     ),
//                     Text(':  ${DataConverter.dateToString(test.createdAt)}'),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 6,
//                 ),
//                 Wrap(
//                   children: [
//                     SizedBox(
//                       width: 100,
//                       child: Text(
//                         'Giáo viên',
//                         style: AppTextStyle.w700(color: AppColors.text900),
//                       ),
//                     ),
//                     Text(':  ${test.author?.fullName}'),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 6,
//                 ),
//                 Wrap(
//                   children: [
//                     SizedBox(
//                       width: 100,
//                       child: Text(
//                         'Trường',
//                         style: AppTextStyle.w700(color: AppColors.text900),
//                       ),
//                     ),
//                     Text(
//                         ':  ${test.author?.school?.name ?? 'Không công khai'}'),
//                   ],
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
