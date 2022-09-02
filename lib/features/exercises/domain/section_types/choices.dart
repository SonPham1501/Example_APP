import 'package:test_app/features/exercises/domain/base_exercise_model.dart';
import 'package:test_app/features/exercises/domain/file_attachment.dart';

import '../../../../core/common/models/file_attachment/file_attachment.dart';

// abstract class IChoicesExerciseData extends TextbookExerciseData {
//   List<Questions>? questions;
// }

//Model này để hấng response
class ChoicesExerciseData extends TextbookExerciseData {
  String? content;
  String? layout;
  List<ChoiceQuestion>? questions;

  ChoicesExerciseData({
    this.content,
    // this.audio,
    // this.images,
    this.layout,
    this.questions,
  });

  ChoicesExerciseData.fromJson(Map<String, dynamic> json) {
    content = json['content'] as String?;
    audio = (json['audio'] as Map<String, dynamic>?) != null
        ? FileAttachment.fromJson(json['audio'] as Map<String, dynamic>)
        : null;
    images = (json['images'] as List?)
        ?.map((dynamic e) => FileAttachment.fromJson(e as Map<String, dynamic>))
        .toList();
    layout = json['layout'] as String?;
    questions = (json['questions'] as List?)
        ?.map((dynamic e) => ChoiceQuestion.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['content'] = content;
    json['audio'] = audio?.toJson();
    json['images'] = images?.map((e) => e.toJson()).toList();
    json['layout'] = layout;
    json['questions'] = questions?.map((e) => e.toJson()).toList();
    return json;
  }

  // @override
  // void check() {
  //   // TODO: implement check
  // }

  // @override
  // bool isValid() {
  //   // TODO: implement isValid
  //   throw UnimplementedError();
  // }
}

class ChoiceQuestion {
  String? content;
  int? index;
  String? correctOption;
  String? layout;
  List<ChoiceQuestionOption>? options;

  ChoiceQuestion({
    this.content,
    this.index,
    this.correctOption,
    this.layout,
    this.options,
  });

  ChoiceQuestion.fromJson(Map<String, dynamic> json) {
    content = json['content'] as String?;
    index = json['index'] as int?;
    correctOption = json['correctOption'] as String?;
    layout = json['layout'] as String?;
    options = (json['options'] as List?)
        ?.map((dynamic e) =>
            ChoiceQuestionOption.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['content'] = content;
    json['index'] = index;
    json['correctOption'] = correctOption;
    json['layout'] = layout;
    json['options'] = options?.map((e) => e.toJson()).toList();
    return json;
  }
}

class ChoiceQuestionOption {
  String? id;
  int? index;
  String? content;

  ChoiceQuestionOption({
    this.id,
    this.index,
    this.content,
  });

  ChoiceQuestionOption.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    index = json['index'] as int?;
    content = json['content'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['index'] = index;
    json['content'] = content;
    return json;
  }
}
