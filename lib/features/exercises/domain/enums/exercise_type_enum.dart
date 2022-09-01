// ignore_for_file: constant_identifier_names

enum ExerciseTypeEnum {
  undefined,
  true_false,
  listen_and_read,
  listen_and_repeat,
  column_input,
  choices
}

extension ConvertsExerciseTypeEnum on ExerciseTypeEnum {
  String? get enumString {
    switch (this) {
      case ExerciseTypeEnum.choices:
        return 'choices';
      default:
        return null;
    }
  }
}

ExerciseTypeEnum convertStringToExerciseTypeEnum(String dataType) {
  switch (dataType) {
    case 'choices':
      return ExerciseTypeEnum.choices;
    default:
      return ExerciseTypeEnum.undefined;
  }
}

// export type ExerciseTypeEnum = 'undefined' | 'true_false' | 'listen_and_read' | 'listen_and_repeat' | 'column_input'
//     | 'match' | 'write_answers' | 'choices' | 'write_input' | 'underline'
//     | 'complete_paragraph' | 'rearrange_sentence' | 'reorder_line' | 'drag_columns' | 'tick_options' | 'match_picture' | 'listen_repeat_underline' | 'discuss'
//     | 'match_2' | 'comic_page' | 'input_picture' | 'transform_sentence' | 'choose_mistake' | 'html_only';