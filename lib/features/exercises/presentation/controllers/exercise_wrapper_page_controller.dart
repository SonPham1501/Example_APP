import 'package:flutter/material.dart';
import 'package:test_app/features/exercises/domain/section_types/choices.dart';

import '../../../../core/base_state/base_bloc.dart';
import '../../../../core/base_state/rx_state.dart';
import '../../domain/base_exercise_model.dart';
import '../../domain/enums/exercise_type_enum.dart';

class ExerciseWrapperPageController extends BaseBloc<TextbookExerciseData> {
  ExerciseWrapperPageController(this.model);
  final BaseTextBookExercise model;

  int currentPage = 0;
  final result = <String, String>{};

  final RxState<List<String?>> _userSelections = RxState<List<String?>>([]);
  List<String?> get userSelections => _userSelections.value.value;

  Stream<List<String?>> get userSelectionsStream =>
      _userSelections.value.stream;

  final RxState<bool> _done = RxState<bool>(false);
  final RxState<int> _time = RxState<int>(60);

  Stream<bool> get doneSteam => _done.value.stream;
  Stream<int> get timeSteam => _time.value.stream;

  int get time => _time.value.value;
  //int time = 60;
  final pageController = PageController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  initUserSelection() {
    if (model.dataType == ExerciseTypeEnum.choices) {
      final _tmp = model.data as ChoicesExerciseData;
      _userSelections.emit([]);
      List<String?> _selection = [];
      for (var i = 0; i < (_tmp.questions ?? []).length; i++) {
        _selection.add(null);
      }
      _userSelections.emit(_selection);
    }
  }

  Future<void> replay() async {
    _done.emit(false);
    _time.emit(60);
    pageController.jumpTo(0);
  }

  submit() {}

  onTimeEnd() {
    _time.emit(0);
    _done.emit(true);
  }

  onSelectItem(int questionId, String value) {
    List<String?> tmp = userSelections;
    tmp[questionId] = value;
    _userSelections.emit(tmp);
  }

  onPageChanged(int value) {}
}
