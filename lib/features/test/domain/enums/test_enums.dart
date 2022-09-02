import 'package:freezed_annotation/freezed_annotation.dart';

enum TestUserStatusEnum {
  @JsonValue("started")
  Started,
  @JsonValue("finished")
  Finished
}

enum TestPrivacyEnum {
  @JsonValue("public")
  Public,
  @JsonValue("private")
  Private,
  @JsonValue("school")
  School
}

enum TestTypeEnum {
  @JsonValue("test")
  Test,
  @JsonValue("attachment")
  Attachment
}
