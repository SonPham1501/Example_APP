
import 'package:test_app/features/exercises/domain/base_exercise_model.dart';

abstract class IChoicesExerciseData extends TextbookExerciseData {
  List<Questions>? questions;
}

class ChoicesExerciseData extends BaseTextbookExercise implements IChoicesExerciseData {
  ChoicesExerciseData({this.questions});

  @override
  List<Questions>? questions;

  @override
  void check() {
    // TODO: implement check
  }

  @override
  bool isValid() {
    // TODO: implement isValid
    throw UnimplementedError();
  }

  factory ChoicesExerciseData.fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }


}


//Model này để hấng response
class Data {
  String? content;
  Audio? audio;
  List<Images>? images;
  String? layout;
  List<Questions>? questions;

  Data({
    this.content,
    this.audio,
    this.images,
    this.layout,
    this.questions,
  });

  Data.fromJson(Map<String, dynamic> json) {
    content = json['content'] as String?;
    audio = (json['audio'] as Map<String,dynamic>?) != null ? Audio.fromJson(json['audio'] as Map<String,dynamic>) : null;
    images = (json['images'] as List?)?.map((dynamic e) => Images.fromJson(e as Map<String,dynamic>)).toList();
    layout = json['layout'] as String?;
    questions = (json['questions'] as List?)?.map((dynamic e) => Questions.fromJson(e as Map<String,dynamic>)).toList();
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
}

class Audio {
  String? contentType;
  int? id;
  String? name;
  String? path;
  int? size;

  Audio({
    this.contentType,
    this.id,
    this.name,
    this.path,
    this.size,
  });

  Audio.fromJson(Map<String, dynamic> json) {
    contentType = json['contentType'] as String?;
    id = json['id'] as int?;
    name = json['name'] as String?;
    path = json['path'] as String?;
    size = json['size'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['contentType'] = contentType;
    json['id'] = id;
    json['name'] = name;
    json['path'] = path;
    json['size'] = size;
    return json;
  }
}

class Images {
  int? id;
  String? contentType;
  String? name;
  int? size;
  String? path;

  Images({
    this.id,
    this.contentType,
    this.name,
    this.size,
    this.path,
  });

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    contentType = json['contentType'] as String?;
    name = json['name'] as String?;
    size = json['size'] as int?;
    path = json['path'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['contentType'] = contentType;
    json['name'] = name;
    json['size'] = size;
    json['path'] = path;
    return json;
  }
}

class Questions {
  String? content;
  int? index;
  String? correctOption;
  String? layout;
  List<Options>? options;

  Questions({
    this.content,
    this.index,
    this.correctOption,
    this.layout,
    this.options,
  });

  Questions.fromJson(Map<String, dynamic> json) {
    content = json['content'] as String?;
    index = json['index'] as int?;
    correctOption = json['correctOption'] as String?;
    layout = json['layout'] as String?;
    options = (json['options'] as List?)?.map((dynamic e) => Options.fromJson(e as Map<String,dynamic>)).toList();
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

class Options {
  String? id;
  int? index;
  String? content;

  Options({
    this.id,
    this.index,
    this.content,
  });

  Options.fromJson(Map<String, dynamic> json) {
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

