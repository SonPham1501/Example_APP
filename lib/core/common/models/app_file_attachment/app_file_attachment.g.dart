// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_file_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppFileAttachmentType _$$_AppFileAttachmentTypeFromJson(
        Map<String, dynamic> json) =>
    _$_AppFileAttachmentType(
      path: json['path'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      contentType: json['contentType'] as String?,
      resourceType: json['resourceType'] as String?,
      size: (json['size'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_AppFileAttachmentTypeToJson(
        _$_AppFileAttachmentType instance) =>
    <String, dynamic>{
      'path': instance.path,
      'id': instance.id,
      'name': instance.name,
      'contentType': instance.contentType,
      'resourceType': instance.resourceType,
      'size': instance.size,
    };
