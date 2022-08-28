// export interface ITextbookExcercise<T extends ITextbookExerciseData = any> {
//     id?: number;
//     index: number;
//     title: string;
//     dataType: ExerciseTypeEnum;
//     sectionGroupId: string | null;
//     data?: T;
// }

import 'package:test_app/features/exercises/domain/section_types/choices.dart';
import 'enums/exercise_type_enum.dart';
import 'file_attachment.dart';
import './enums/exercise_type_enum.dart';

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
  int? id;
  int? index;
  String? title;
  ExerciseTypeEnum? dataType;
  T? data;
  BaseExerciseModel({
    this.id,
    this.index,
    this.title,
    this.dataType,
    this.data,
  });

  BaseExerciseModel.fromJson(Map<String, dynamic> json) {
    index = json['index'] as int?;
    dataType = convertStringToExerciseTypeEnum(json['dataType']);
    title = json['title'] as String?;
    data = (json['data'] as Map<String,dynamic>?) != null
      ? _convertGenericToFromJson(json)
      : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['index'] = index;
    json['dataType'] = dataType?.enumString;
    json['title'] = title;
    json['data'] = _convertGenericToToJson();
    return json;
  }

  T? _convertGenericToFromJson(Map<String, dynamic> json) {
    switch (T) {
      case ChoicesExerciseData:
        return ChoicesExerciseData.fromJson(json['data'] as Map<String,dynamic>) as T?;
      default:
        return null;
    }
  }

  Map<String, dynamic>? _convertGenericToToJson() {
    switch (T) {
      case ChoicesExerciseData:
        return (data as ChoicesExerciseData).toJson();
      default:
        return null;
    }
  }

}
