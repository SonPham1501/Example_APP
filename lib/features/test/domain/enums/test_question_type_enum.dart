import 'package:freezed_annotation/freezed_annotation.dart';

enum TestQuestionTypeEnum {
  @JsonValue("choices")
  Choices,
  @JsonValue("trueFalse")
  TrueFalse,
  @JsonValue("write")
  Write,
  @JsonValue("input")
  Input,
  @JsonValue("match")
  Match,
  @JsonValue("rearrange")
  Rearrange,
  @JsonValue("completeParagraph")
  CompleteParagraph,
  @JsonValue("findMistake")
  FindMistake
}

extension TestQuestionTypeEnumExtension on TestQuestionTypeEnum {
  String get name {
    switch (this) {
      case TestQuestionTypeEnum.Choices:
        return "Chọn đáp án chính xác";
      case TestQuestionTypeEnum.TrueFalse:
        return "True or False";
      case TestQuestionTypeEnum.Write:
        return "Điền đáp án";
      case TestQuestionTypeEnum.Input:
        return "Điều vào chỗ trống";
      case TestQuestionTypeEnum.Match:
        return "Nối";
      case TestQuestionTypeEnum.Rearrange:
        return "Sắp xếp lại câu";
      case TestQuestionTypeEnum.CompleteParagraph:
        return "Hoàn thành đoạn văn";
      case TestQuestionTypeEnum.FindMistake:
        return "Tìm lỗi sai trong câu";
      default:
        return "Chọn đáp án chính xác";
    }
  }

  String get value {
    switch (this) {
      case TestQuestionTypeEnum.Choices:
        return "choices";
      case TestQuestionTypeEnum.TrueFalse:
        return "trueFalse";
      case TestQuestionTypeEnum.Write:
        return "write";
      case TestQuestionTypeEnum.Input:
        return "input";
      case TestQuestionTypeEnum.Match:
        return "match";
      case TestQuestionTypeEnum.Rearrange:
        return "rearrange";
      case TestQuestionTypeEnum.CompleteParagraph:
        return "completeParagraph";
      case TestQuestionTypeEnum.FindMistake:
        return "findMistake";
      default:
        return "choices";
    }
  }
}
