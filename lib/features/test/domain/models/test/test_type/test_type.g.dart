// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TestType _$$_TestTypeFromJson(Map<String, dynamic> json) => _$_TestType(
      id: json['id'] as int,
      title: json['title'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      totalQuestions: json['totalQuestions'] as int? ?? 0,
      duration: json['duration'] as int? ?? 0,
      rankings: json['rankings'] == null
          ? const ApiListResponseWrapper<TestUserType>()
          : _getTestUsersFromJson(json['rankings'] as Map<String, dynamic>?),
      testHistories: json['testHistories'] == null
          ? const ApiListResponseWrapper<TestUserType>()
          : _getTestUsersFromJson(
              json['testHistories'] as Map<String, dynamic>?),
      stats: json['stats'] == null
          ? null
          : TestStatsType.fromJson(json['stats'] as Map<String, dynamic>),
      categoryId: json['categoryId'] as int?,
      testVersion: json['testVersion'] as int?,
      sections: (json['sections'] as List<dynamic>?)
              ?.map((e) => TestSectionType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TestTypeToJson(_$_TestType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createdAt': instance.createdAt?.toIso8601String(),
      'totalQuestions': instance.totalQuestions,
      'duration': instance.duration,
      'rankings': instance.rankings,
      'testHistories': instance.testHistories,
      'stats': instance.stats,
      'categoryId': instance.categoryId,
      'testVersion': instance.testVersion,
      'sections': instance.sections,
    };

_$_TestSectionType _$$_TestSectionTypeFromJson(Map<String, dynamic> json) =>
    _$_TestSectionType(
      id: json['id'] as int,
      name: QuillContent.fromJson(json['name'] as Map<String, dynamic>),
      type: $enumDecodeNullable(_$TestQuestionTypeEnumEnumMap, json['type']),
      extraData: json['extraData'] as String?,
      note: json['note'] == null
          ? null
          : QuillContent.fromJson(json['note'] as Map<String, dynamic>),
      paragraph: json['paragraph'] == null
          ? null
          : QuillContent.fromJson(json['paragraph'] as Map<String, dynamic>),
      totalScore: (json['totalScore'] as num?)?.toDouble() ?? 0,
      questions: (json['questions'] as List<dynamic>?)
              ?.map((e) => TestQuestionType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      images: (json['images'] as List<dynamic>?)
          ?.map(
              (e) => AppFileAttachmentType.fromJson(e as Map<String, dynamic>))
          .toList(),
      audios: (json['audios'] as List<dynamic>?)
          ?.map(
              (e) => AppFileAttachmentType.fromJson(e as Map<String, dynamic>))
          .toList(),
      words:
          (json['words'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_TestSectionTypeToJson(_$_TestSectionType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$TestQuestionTypeEnumEnumMap[instance.type],
      'extraData': instance.extraData,
      'note': instance.note,
      'paragraph': instance.paragraph,
      'totalScore': instance.totalScore,
      'questions': instance.questions,
      'images': instance.images,
      'audios': instance.audios,
      'words': instance.words,
    };

const _$TestQuestionTypeEnumEnumMap = {
  TestQuestionTypeEnum.Choices: 'choices',
  TestQuestionTypeEnum.TrueFalse: 'trueFalse',
  TestQuestionTypeEnum.Write: 'write',
  TestQuestionTypeEnum.Input: 'input',
  TestQuestionTypeEnum.Match: 'match',
  TestQuestionTypeEnum.Rearrange: 'rearrange',
  TestQuestionTypeEnum.CompleteParagraph: 'completeParagraph',
  TestQuestionTypeEnum.FindMistake: 'findMistake',
};

_$_TestQuestionType _$$_TestQuestionTypeFromJson(Map<String, dynamic> json) =>
    _$_TestQuestionType(
      id: json['id'] as String,
      name: json['name'] == null
          ? null
          : QuillContent.fromJson(json['name'] as Map<String, dynamic>),
      score: (json['score'] as num?)?.toDouble(),
      type: $enumDecode(_$TestQuestionTypeEnumEnumMap, json['type']),
      extraData: json['extraData'] as String?,
      note: json['note'] == null
          ? null
          : QuillContent.fromJson(json['note'] as Map<String, dynamic>),
      testSectionId: json['testSectionId'] as int,
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) =>
                  TestQuestionAnswerType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      images: (json['images'] as List<dynamic>?)
          ?.map(
              (e) => AppFileAttachmentType.fromJson(e as Map<String, dynamic>))
          .toList(),
      audios: (json['audios'] as List<dynamic>?)
          ?.map(
              (e) => AppFileAttachmentType.fromJson(e as Map<String, dynamic>))
          .toList(),
      words:
          (json['words'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_TestQuestionTypeToJson(_$_TestQuestionType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'score': instance.score,
      'type': _$TestQuestionTypeEnumEnumMap[instance.type]!,
      'extraData': instance.extraData,
      'note': instance.note,
      'testSectionId': instance.testSectionId,
      'answers': instance.answers,
      'images': instance.images,
      'audios': instance.audios,
      'words': instance.words,
    };

_$_TestQuestionAnswerType _$$_TestQuestionAnswerTypeFromJson(
        Map<String, dynamic> json) =>
    _$_TestQuestionAnswerType(
      id: json['id'] as String,
      hint: json['hint'] == null
          ? null
          : QuillContent.fromJson(json['hint'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : QuillContent.fromJson(json['content'] as Map<String, dynamic>),
      isCorrect: json['isCorrect'] as bool? ?? false,
      detail: json['detail'] == null
          ? null
          : QuillContent.fromJson(json['detail'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map(
              (e) => AppFileAttachmentType.fromJson(e as Map<String, dynamic>))
          .toList(),
      audios: (json['audios'] as List<dynamic>?)
          ?.map(
              (e) => AppFileAttachmentType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TestQuestionAnswerTypeToJson(
        _$_TestQuestionAnswerType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hint': instance.hint,
      'content': instance.content,
      'isCorrect': instance.isCorrect,
      'detail': instance.detail,
      'images': instance.images,
      'audios': instance.audios,
    };

_$_TestStatsType _$$_TestStatsTypeFromJson(Map<String, dynamic> json) =>
    _$_TestStatsType(
      totalChallengeUsed: json['totalChallengeUsed'] as int? ?? 0,
      totalComment: json['totalComment'] as int? ?? 0,
      totalFeedback: json['totalFeedback'] as int? ?? 0,
      totalRating: json['totalRating'] as int? ?? 0,
      totalUser: json['totalUser'] as int? ?? 0,
      totalUserRating: json['totalUserRating'] as int? ?? 0,
    );

Map<String, dynamic> _$$_TestStatsTypeToJson(_$_TestStatsType instance) =>
    <String, dynamic>{
      'totalChallengeUsed': instance.totalChallengeUsed,
      'totalComment': instance.totalComment,
      'totalFeedback': instance.totalFeedback,
      'totalRating': instance.totalRating,
      'totalUser': instance.totalUser,
      'totalUserRating': instance.totalUserRating,
    };
