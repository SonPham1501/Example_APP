// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_archived_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TestArchivedType _$$_TestArchivedTypeFromJson(Map<String, dynamic> json) =>
    _$_TestArchivedType(
      id: json['id'] as int,
      title: json['title'] as String,
      testId: json['testId'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      totalQuestions: json['totalQuestions'] as int? ?? 0,
      description: json['description'] as String?,
      duration: json['duration'] as int? ?? 0,
      systemRewardPoint: (json['systemRewardPoint'] as num?)?.toDouble() ?? 0,
      sections: (json['sections'] as List<dynamic>?)
              ?.map((e) => TestSectionType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TestArchivedTypeToJson(_$_TestArchivedType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'testId': instance.testId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'totalQuestions': instance.totalQuestions,
      'description': instance.description,
      'duration': instance.duration,
      'systemRewardPoint': instance.systemRewardPoint,
      'sections': instance.sections,
    };
