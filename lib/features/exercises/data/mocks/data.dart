
// // class ChoicesExerciseData extends BaseExerciseModel {
// //   ChoicesExerciseData({
// //     List<Questions> questions = const [],
// //   });
// // }

// class Data {
//   List<Questions>? questions;

//   Data({
//     this.questions,
//   });

//   Data.fromJson(Map<String, dynamic> json) {
//     questions = (json['questions'] as List?)
//         ?.map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['questions'] = questions?.map((e) => e.toJson()).toList();
//     return json;
//   }
// }

// class Questions {
//   String? id;
//   String? content;
//   String? answer;
//   List<String>? choices;

//   Questions({
//     this.id,
//     this.content,
//     this.answer,
//     this.choices,
//   });

//   Questions.fromJson(Map<String, dynamic> json) {
//     id = json['id'] as String?;
//     content = json['content'] as String?;
//     answer = json['answer'] as String?;
//     choices =
//         (json['choices'] as List?)?.map((dynamic e) => e as String).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['id'] = id;
//     json['content'] = content;
//     json['answer'] = answer;
//     json['choices'] = choices;
//     return json;
//   }
// }
