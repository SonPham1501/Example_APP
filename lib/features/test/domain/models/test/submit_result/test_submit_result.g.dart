// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_submit_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TestSubmitResult _$$_TestSubmitResultFromJson(Map<String, dynamic> json) =>
    _$_TestSubmitResult(
      testArchivedId: json['testArchivedId'] as int,
      index: json['index'] as int,
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      title: json['title'] as String?,
      testId: json['testId'] as int?,
      testVersion: json['testVersion'] as int?,
      score: (json['score'] as num?)?.toDouble() ?? 0,
      top: json['top'] as int? ?? 0,
      totalRewardCoin: (json['totalRewardCoin'] as num?)?.toDouble() ?? 0,
      duration: (json['duration'] as num?)?.toDouble() ?? 0,
      totalRightAnswer: json['totalRightAnswer'] as int? ?? 0,
      totalQuestions: json['totalQuestions'] as int? ?? 0,
      totalUser: json['totalUser'] as int? ?? 1,
      rankingPoint: (json['rankingPoint'] as num?)?.toDouble(),
      resultList: (json['resultList'] as List<dynamic>?)
              ?.map((e) =>
                  TestSubmitResultQuestion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      result: (json['result'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, TestSubmitResultAnswerType.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_TestSubmitResultToJson(_$_TestSubmitResult instance) =>
    <String, dynamic>{
      'testArchivedId': instance.testArchivedId,
      'index': instance.index,
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'testId': instance.testId,
      'testVersion': instance.testVersion,
      'score': instance.score,
      'top': instance.top,
      'totalRewardCoin': instance.totalRewardCoin,
      'duration': instance.duration,
      'totalRightAnswer': instance.totalRightAnswer,
      'totalQuestions': instance.totalQuestions,
      'totalUser': instance.totalUser,
      'rankingPoint': instance.rankingPoint,
      'resultList': instance.resultList,
      'result': instance.result,
    };

_$_TestSubmitResultQuestion _$$_TestSubmitResultQuestionFromJson(
        Map<String, dynamic> json) =>
    _$_TestSubmitResultQuestion(
      state: $enumDecodeNullable(_$AnswerResultEnumEnumMap, json['state']) ??
          AnswerResultEnum.notanswer,
      question:
          TestQuestionType.fromJson(json['question'] as Map<String, dynamic>),
      selectedAnswers: (json['selectedAnswers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TestSubmitResultQuestionToJson(
        _$_TestSubmitResultQuestion instance) =>
    <String, dynamic>{
      'state': _$AnswerResultEnumEnumMap[instance.state]!,
      'question': instance.question,
      'selectedAnswers': instance.selectedAnswers,
    };

const _$AnswerResultEnumEnumMap = {
  AnswerResultEnum.correct: 'correct',
  AnswerResultEnum.incorrect: 'incorrect',
  AnswerResultEnum.notanswer: 'notanswer',
};
