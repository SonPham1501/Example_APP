import 'package:freezed_annotation/freezed_annotation.dart';
import '../test_archived_type/test_archived_type.dart';
import '../test_type/test_type.dart';
part 'test_user_type.freezed.dart';
part 'test_user_type.g.dart';

@freezed
class TestUserType with _$TestUserType {
  factory TestUserType({
    required int testArchivedId,
    required int userId,
    required int index,
    int? testId,
    @Default(0) double rankingPoint,
    @Default(0) int totalRightAnswer,
    @Default(0) double durationInSeconds,
    @Default(0) double totalScore,
    @Default(0) double totalRewardCoin,
    int? testChallengeId,
    int? top,
    DateTime? finishedAt,
    DateTime? startAt,
    TestStatsType? testStats,
    TestArchivedType? testArchived,
    @Default({}) Map<String, TestSubmitResultAnswerType> result,
  }) = _TestUserType;

  factory TestUserType.fromJson(Map<String, dynamic> json) =>
      _$TestUserTypeFromJson(json);

  //int get totalQuestions => this.testArchived?.totalQuestions ?? 0;
}

@freezed
class TestSubmitResultAnswerType with _$TestSubmitResultAnswerType {
  const factory TestSubmitResultAnswerType({
    @Default(false) bool isCorrect,
    @Default([]) List<String> answers,
  }) = _TestSubmitResultAnswerType;

  factory TestSubmitResultAnswerType.fromJson(Map<String, dynamic> json) =>
      _$TestSubmitResultAnswerTypeFromJson(json);
}
