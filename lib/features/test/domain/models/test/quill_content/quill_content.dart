import 'package:freezed_annotation/freezed_annotation.dart';

part 'quill_content.freezed.dart';
part 'quill_content.g.dart';

@freezed
class QuillOperation with _$QuillOperation {
  const factory QuillOperation({
    String? content,
    required QuillContentTypeEnum type,
    Map<String, dynamic>? attributes,
  }) = _QuillOperation;

  factory QuillOperation.fromJson(Map<String, dynamic> json) =>
      _$QuillOperationFromJson(json);
}

@freezed
class QuillContent with _$QuillContent {
  const factory QuillContent({
    @Default([]) List<QuillOperation> operations,
    String? html,
  }) = _QuillContent;

  factory QuillContent.fromJson(Map<String, dynamic> json) =>
      _$QuillContentFromJson(json);
}

enum QuillContentTypeEnum {
  @JsonValue("text")
  Text,
  @JsonValue("formula")
  Formula
}
