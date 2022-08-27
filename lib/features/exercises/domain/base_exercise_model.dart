// export interface ITextbookExcercise<T extends ITextbookExerciseData = any> {
//     id?: number;
//     index: number;
//     title: string;
//     dataType: ExerciseTypeEnum;
//     sectionGroupId: string | null;
//     data?: T;
// }

import 'enums/exercise_type_enum.dart';
import 'file_attachment.dart';

abstract class TextbookExerciseData {
  FileAttachment? audio;
  String? paragraph;
  List<String>? paragraphs, words;
  List<FileAttachment>? images;
  // extraContents?: { value: string, position: string }[];
  bool? viewOnly;
  void check();
  bool isValid();
}

abstract class BaseTextbookExercise {
    FileAttachment? audio;
    String? paragraph;
    List<String>? paragraphs, words;
    List<FileAttachment>? images;
    // extraContents?: { value: string, position: string }[];
    bool? viewOnly;
    BaseTextbookExercise({
      this.audio,
      this.images,
      this.paragraph,
      this.paragraphs,
      this.viewOnly,
      this.words,
    });
}

class BaseExerciseModel<T extends TextbookExerciseData> {
  final int? id;
  final int index;
  final String title;
  final ExerciseTypeEnum dataType;
  final T data;
  BaseExerciseModel({
    this.id,
    required this.index,
    required this.title,
    required this.dataType,
    required this.data,
  });
}
