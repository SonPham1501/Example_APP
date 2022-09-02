import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import '../../../../core/base_state/base_bloc.dart';
import '../../../../core/base_state/rx_state.dart';
import '../../domain/enums/test_question_type_enum.dart';
import '../../domain/models/test/test_archived_type/test_archived_type.dart';
import '../../domain/models/test/test_type/test_type.dart';

class TestDoingPageController extends BaseBloc<TestArchivedType> {
  TestDoingPageController(this.test);
  //final TestRepository repository = BaseBloc.find<TestRepository>();

  // final TestAssignmentRepository testAssignmentRepository =
  //     BaseBloc.find<TestAssignmentRepository>();

  final _expanded = RxState<bool>(false);

  RxValue<bool> get expanded => _expanded.value;

  final _currentIndex = RxState<int>(0);

  RxValue<int> get currentIndex => _currentIndex.value;
  // final _currentSlideQuestion = new RxState<TestQuestionSlideModel?>(null);

  // RxValue<TestQuestionSlideModel?> get currentSlideQuestion =>
  //     _currentSlideQuestion.value;

  final TestArchivedType test;

  final PageController pageController = PageController();
  bool get isLastSlide => currentIndex.value == test.sections.length - 1;

  bool get isFirstSlide => currentIndex.value == 0;

  List<TestQuestionSlideModel> _testSlideData = [];

  List<TestQuestionSlideModel> get testSlideData => _testSlideData;

  final _userSelects = RxState<Map<String, List<String>>>(new Map());

  RxValue<Map<String, List<String>>> get userSelects => _userSelects.value;

  late CountdownController countDownController;

  final _totalAnswered = RxState<int>(0);

  RxValue<int> get totalAnswered => _totalAnswered.value;

  bool submitted = false;

  // final List<ExpandableController> expandableControllers = [];

  @override
  void onInit() {
    init();
    super.onInit();
    //loadTest();
    //countDownController = new CountdownController(duration: Duration(seconds: test.duration);
  }

  @override
  void dispose() {
    //countDownController.removeListener(countDownListener);
    _expanded.close();
    _currentIndex.close();
    _userSelects.close();
    _totalAnswered.close();
    // _currentSlideQuestion.close();
    pageController.dispose();
    super.dispose();
  }

  void init() async {
    _initUserSelections(test);
    _initSlideModels(test);
    final _duration = test.duration * 60;
    countDownController = CountdownController(
      duration: Duration(seconds: _duration),
    );
    countDownController.addListener(countDownListener);
    await Future.delayed(const Duration(seconds: 1));
    countDownController.start();
    setSuccess(test);
  }

  countDownListener() {
    if (isClosed) return;
    if (countDownController.value == 0) {
      onTimeout();
    } else if (countDownController.value == 10 * 1000) {
      onTimeoutAlert();
    }
  }

  Future<void> submit() async {
    // if (countDownController.isRunning) countDownController.stop();
    // if (classTestId != null && classTestToken != null) {
    //   showLoading();
    //   var either = await testAssignmentRepository.submit(
    //         id: classTestId!,
    //         userSelections: userSelects.value,
    //         token: classTestToken ?? "",
    //         classAssignmentUserId: classTestUserId,
    //       );
    //   submitted = true;
    //   closeLoading();
    //   either.fold(
    //     (l) => showErrorMessage(l),
    //     (r) {
    //       _reloadClassTestDetailPage(classTestId);
    //       appRouter.popAndPushNamed(
    //         Routes.TEST_FINISH_RESULT,
    //         arguments: {
    //           'result': r.testSubmitResult,
    //           'classTest': r.assignment,
    //           'testArchived': test,
    //         },
    //       );
    //     },
    //   );
    // } else {
    //   showLoading();
    //   var either = await repository.submitTest(
    //         testArchivedId: test.id,
    //         index: index ?? 1,
    //         userSelections: userSelects.value,
    //       );
    //   closeLoading();
    //   either.fold(
    //     (l) => showErrorMessage(l),
    //     (r) {
    //       _reloadTestDetailPage(test.testId);
    //       appRouter.popAndPushNamed(
    //         Routes.TEST_FINISH_RESULT,
    //         arguments: {
    //           'result': r,
    //           'testArchived': test,
    //         },
    //       );
    //     },
    //   );
    // }
  }

  void toggle([bool? val]) {
    _expanded.emit(val ?? !expanded.value);
  }

  void selectIndex(TestQuestionSlideModel val) {
    final slideIndex = testSlideData.indexOf(val);
    if (expanded.value) _expanded.emit(false);

    pageController.animateToPage(
      slideIndex,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 500),
    );
  }

  void onSlideChanged(int index) {
    _currentIndex.emit(index);
  }

  void nextSlide() {
    //if (!isLastSlide)

    pageController.nextPage(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
    );
  }

  void previousSlide() {
    // if (!isFirstSlide)
    pageController.previousPage(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
    );
  }

  void pauseCountDown() {}

  Future<void> onTimeout() async {
    // if (isClosed) return;
    // showErrorMessageStr("Hết giờ làm bài tập, tự động nộp bài", 0);
    // await Future.delayed(Duration(seconds: 1));
    // submit();
  }

  Future<void> onTimeoutAlert() async {
    if (isClosed) return;
    showInfoMessage("Bạn còn 10 giây để nộp bài");
    // showBanner("Sắp hết thời gian, hãy mau chóng nộp bài",
    //     isWarning: true);
  }

  //!User Selections
  void selectAnswer(String questionId, String answerId) {
    final tmp = userSelects.value;
    tmp.update(questionId, (value) => [answerId]);

    _userSelects.emit(tmp);
    _totalAnswered.emit(userSelects.value.values
        .toList()
        .where((element) => element.where((e) => e.length > 0).length > 0)
        .length);
  }

  void answering(String questionId, List<String> val) {
    if (val.length == 0) {
      userSelects.value.update(questionId, (value) => val);
    } else
      userSelects.value.update(questionId, (value) => val);

    _userSelects.emit(userSelects.value);

    _totalAnswered.emit(this
        .userSelects
        .value
        .values
        .toList()
        .where((element) => element.where((e) => e.length > 0).length > 0)
        .length);
  }

  void onMatchAnswering(String questionId, String? val) {
    if ((val == null) || (val.length == 0)) {
      userSelects.value.update(questionId, (value) => []);
    } else
      userSelects.value.update(questionId, (value) => [val]);

    _totalAnswered.emit(this
        .userSelects
        .value
        .values
        .toList()
        .where((element) => element.length > 0)
        .length);
  }

  _initUserSelections(TestArchivedType t) {
    Map<String, List<String>> tmp = new Map();
    for (var i = 0; i < t.sections.length; i++) {
      var s = t.sections[i];
      for (var j = 0; j < s.questions.length; j++) {
        var q = s.questions[j];
        tmp[q.id] = [];
      }
    }
    _userSelects.emit(tmp);
  }

  _initSlideModels(TestArchivedType t) {
    for (var i = 0; i < t.sections.length; i++) {
      var s = t.sections[i];
      // expandableControllers
      //     .add(new ExpandableController(initialExpanded: true));
      if (s.type == TestQuestionTypeEnum.Match) {
        _testSlideData.add(
          TestQuestionSlideModel(
            sectionIndex: i,
            questionIndex: 0,
            section: s,
            question: s.questions.first,
          ),
        );
      } else {
        for (var j = 0; j < s.questions.length; j++) {
          var q = s.questions[j];
          _testSlideData.add(
            TestQuestionSlideModel(
              sectionIndex: i,
              questionIndex: j,
              question: q,
            ),
          );
        }
      }
    }
    // if (testSlideData.length > 0) {
    //   _currentSlideQuestion.emit(testSlideData[0]);
    // }
  }
}

class TestQuestionSlideModel {
  final int sectionIndex;
  final int questionIndex;
  final TestQuestionType question;
  final TestSectionType? section;
  TestQuestionSlideModel({
    required this.sectionIndex,
    required this.questionIndex,
    required this.question,
    this.section,
  });
}
