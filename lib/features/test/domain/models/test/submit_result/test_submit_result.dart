import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../enums/test_answer_result_enum.dart';
import '../test_type/test_type.dart';
import '../test_user_type/test_user_type.dart';

part 'test_submit_result.freezed.dart';
part 'test_submit_result.g.dart';

@freezed
class TestSubmitResult with _$TestSubmitResult {
  const factory TestSubmitResult({
    required int testArchivedId,
    required int index,
    int? id,
    int? userId,
    String? title,
    int? testId,
    int? testVersion,
    @Default(0) double score,
    @Default(0) int top,
    @Default(0) double totalRewardCoin,
    @Default(0) double duration,
    @Default(0) int totalRightAnswer,
    @Default(0) int totalQuestions,
    @Default(1) int totalUser,
    double? rankingPoint,
    @Default([]) List<TestSubmitResultQuestion> resultList,
    required Map<String, TestSubmitResultAnswerType> result,
  }) = _TestSubmitResult;

  factory TestSubmitResult.fromJson(Map<String, dynamic> json) =>
      _$TestSubmitResultFromJson(json);

  factory TestSubmitResult.fromTestUserModel(TestUserType model) {
    TestSubmitResultQuestion _getUserSelection(TestQuestionType _question) {
      TestSubmitResultAnswerType? tmp = model.result[_question.id];
      if (tmp == null)
        return TestSubmitResultQuestion(
            question: _question,
            state: AnswerResultEnum.notanswer,
            selectedAnswers: []);
      if (tmp.answers.length == 0)
        return TestSubmitResultQuestion(
            question: _question,
            state: AnswerResultEnum.notanswer,
            selectedAnswers: []);
      return TestSubmitResultQuestion(
          question: _question,
          state: tmp.isCorrect
              ? AnswerResultEnum.correct
              : AnswerResultEnum.incorrect,
          selectedAnswers: tmp.answers);
    }

    List<TestSubmitResultQuestion> _result = [];
    if (model.testArchived?.sections != null) {
      for (var _section in model.testArchived!.sections) {
        for (var _question in _section.questions) {
          _result.add(_getUserSelection(_question));
        }
      }
    }
    return TestSubmitResult(
      testArchivedId: model.testArchivedId,
      userId: model.userId,
      score: 0,
      totalRewardCoin: 0,
      resultList: _result,
      result: Map(),
      index: 1,
      title: model.testArchived?.title ?? "Hoàn thành bài tập",
    );
  }
}

@freezed
class TestSubmitResultQuestion with _$TestSubmitResultQuestion {
  const factory TestSubmitResultQuestion({
    @Default(AnswerResultEnum.notanswer) AnswerResultEnum state,
    required TestQuestionType question,
    @Default([]) List<String> selectedAnswers,
  }) = _TestSubmitResultQuestion;

  factory TestSubmitResultQuestion.fromJson(Map<String, dynamic> json) =>
      _$TestSubmitResultQuestionFromJson(json);
}

// class TestUserAnswerObject {
//   final bool isCorrect;
//   final List<String> answers;
//   TestUserAnswerObject({
//     required this.isCorrect,
//     this.answers = const [],
//   });

//   TestUserAnswerObject copyWith({
//     bool? isCorrect,
//     List<String>? answers,
//   }) {
//     return TestUserAnswerObject(
//       isCorrect: isCorrect ?? this.isCorrect,
//       answers: answers ?? this.answers,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'isCorrect': isCorrect,
//       'answers': answers,
//     };
//   }

//   factory TestUserAnswerObject.fromMap(Map<String, dynamic> map) {
//     return TestUserAnswerObject(
//       isCorrect: map['isCorrect'] ?? false,
//       answers: List<String>.from(map['answers']),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory TestUserAnswerObject.fromJson(String source) =>
//       TestUserAnswerObject.fromMap(json.decode(source));

//   @override
//   String toString() =>
//       'TestUserAnswerObject(isCorrect: $isCorrect, answers: $answers)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is TestUserAnswerObject &&
//         other.isCorrect == isCorrect &&
//         listEquals(other.answers, answers);
//   }

//   @override
//   int get hashCode => isCorrect.hashCode ^ answers.hashCode;
// }
