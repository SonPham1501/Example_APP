// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quill_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuillOperation _$$_QuillOperationFromJson(Map<String, dynamic> json) =>
    _$_QuillOperation(
      content: json['content'] as String?,
      type: $enumDecode(_$QuillContentTypeEnumEnumMap, json['type']),
      attributes: json['attributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_QuillOperationToJson(_$_QuillOperation instance) =>
    <String, dynamic>{
      'content': instance.content,
      'type': _$QuillContentTypeEnumEnumMap[instance.type]!,
      'attributes': instance.attributes,
    };

const _$QuillContentTypeEnumEnumMap = {
  QuillContentTypeEnum.Text: 'text',
  QuillContentTypeEnum.Formula: 'formula',
};

_$_QuillContent _$$_QuillContentFromJson(Map<String, dynamic> json) =>
    _$_QuillContent(
      operations: (json['operations'] as List<dynamic>?)
              ?.map((e) => QuillOperation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      html: json['html'] as String?,
    );

Map<String, dynamic> _$$_QuillContentToJson(_$_QuillContent instance) =>
    <String, dynamic>{
      'operations': instance.operations,
      'html': instance.html,
    };
