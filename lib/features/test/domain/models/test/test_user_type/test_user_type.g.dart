// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_user_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TestUserType _$$_TestUserTypeFromJson(Map<String, dynamic> json) =>
    _$_TestUserType(
      testArchivedId: json['testArchivedId'] as int,
      userId: json['userId'] as int,
      index: json['index'] as int,
      testId: json['testId'] as int?,
      rankingPoint: (json['rankingPoint'] as num?)?.toDouble() ?? 0,
      totalRightAnswer: json['totalRightAnswer'] as int? ?? 0,
      durationInSeconds: (json['durationInSeconds'] as num?)?.toDouble() ?? 0,
      totalScore: (json['totalScore'] as num?)?.toDouble() ?? 0,
      totalRewardCoin: (json['totalRewardCoin'] as num?)?.toDouble() ?? 0,
      testChallengeId: json['testChallengeId'] as int?,
      top: json['top'] as int?,
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
      startAt: json['startAt'] == null
          ? null
          : DateTime.parse(json['startAt'] as String),
      testStats: json['testStats'] == null
          ? null
          : TestStatsType.fromJson(json['testStats'] as Map<String, dynamic>),
      testArchived: json['testArchived'] == null
          ? null
          : TestArchivedType.fromJson(
              json['testArchived'] as Map<String, dynamic>),
      result: (json['result'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k,
                TestSubmitResultAnswerType.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_TestUserTypeToJson(_$_TestUserType instance) =>
    <String, dynamic>{
      'testArchivedId': instance.testArchivedId,
      'userId': instance.userId,
      'index': instance.index,
      'testId': instance.testId,
      'rankingPoint': instance.rankingPoint,
      'totalRightAnswer': instance.totalRightAnswer,
      'durationInSeconds': instance.durationInSeconds,
      'totalScore': instance.totalScore,
      'totalRewardCoin': instance.totalRewardCoin,
      'testChallengeId': instance.testChallengeId,
      'top': instance.top,
      'finishedAt': instance.finishedAt?.toIso8601String(),
      'startAt': instance.startAt?.toIso8601String(),
      'testStats': instance.testStats,
      'testArchived': instance.testArchived,
      'result': instance.result,
    };

_$_TestSubmitResultAnswerType _$$_TestSubmitResultAnswerTypeFromJson(
        Map<String, dynamic> json) =>
    _$_TestSubmitResultAnswerType(
      isCorrect: json['isCorrect'] as bool? ?? false,
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TestSubmitResultAnswerTypeToJson(
        _$_TestSubmitResultAnswerType instance) =>
    <String, dynamic>{
      'isCorrect': instance.isCorrect,
      'answers': instance.answers,
    };
