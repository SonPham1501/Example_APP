// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FileAttachment _$$_FileAttachmentFromJson(Map<String, dynamic> json) =>
    _$_FileAttachment(
      id: json['id'],
      size: (json['size'] as num?)?.toDouble(),
      name: json['name'] as String?,
      path: json['path'] as String,
      contentType: json['contentType'] as String,
      resourceType: json['resourceType'] as String?,
      type: json['type'] as int?,
    );

Map<String, dynamic> _$$_FileAttachmentToJson(_$_FileAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'size': instance.size,
      'name': instance.name,
      'path': instance.path,
      'contentType': instance.contentType,
      'resourceType': instance.resourceType,
      'type': instance.type,
    };
