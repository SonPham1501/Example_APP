// export interface ITextbookExerciseData {
//    audio?: FileAttachment;
//     paragraph?: string;
//     paragraphs?: string[];
//     images?: FileAttachment[];
//     words?: string[];
//     extraContents?: { value: string, position: string }[];
//     viewOnly?:boolean;
//     check(): void;
//     isValid(): boolean;
//     // copyFrom(data: ITextbookExerciseData): ITextbookExerciseData;
// }

// export interface ITextbookExcercise<T extends ITextbookExerciseData = any> {
//     id?: number;
//     index: number;
//     title: string;
//     dataType: ExerciseTypeEnum;
//     sectionGroupId: string | null;
//     data?: T;
// }
import 'enums/exercise_type_enum.dart';

abstract class TextbookExerciseData {
  dynamic audio;
  String? paragraph;
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
