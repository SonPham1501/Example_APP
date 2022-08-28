import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_app/features/exercises/domain/base_exercise_model.dart';
import 'package:test_app/features/exercises/domain/section_types/choices.dart';

abstract class ExeciseService {

  static Future<BaseExerciseModel<ChoicesExerciseData>> getChoicesExerciseData() async {
    final String response = await rootBundle.loadString('assets/jsons/choices.json');
    final data = await json.decode(response);
    final baseExerciseModel = BaseExerciseModel<ChoicesExerciseData>.fromJson(data);
    return baseExerciseModel;
  }

}