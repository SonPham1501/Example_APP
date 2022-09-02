import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/config/palette.dart';

enum AnswerResultEnum {
  @JsonValue("correct")
  correct,
  @JsonValue("incorrect")
  incorrect,
  @JsonValue("notanswer")
  notanswer
}

extension AnswerResultEnumExtention on AnswerResultEnum {
  Color get color {
    switch (this) {
      case AnswerResultEnum.correct:
        return AppColors.green;
      case AnswerResultEnum.incorrect:
        return AppColors.red;
      case AnswerResultEnum.notanswer:
        return AppColors.orange;
      default:
        return AppColors.orange;
    }
  }
}
