
import 'package:test_app/features/exercises/domain/section_types/choices.dart';

import '../../../../core/base_state/base_bloc.dart';
import '../../../../core/base_state/rx_state.dart';
import '../../domain/base_exercise_model.dart';
import '../../domain/enums/exercise_type_enum.dart';

class ExerciseWrapperPageController extends BaseBloc<TextbookExerciseData> {
  ExerciseWrapperPageController(this.model);
  final BaseTextBookExercise model;

  final result = <String, String>{};

  final RxState<List<String?>> _userSelections = RxState<List<String?>>([]);
  List<String?> get userSelections => _userSelections.value.value;

  Stream<List<String?>> get userSelectionsStream =>
      _userSelections.value.stream;

  final RxState<int> _time = RxState<int>(60);

  Stream<int> get timeSteam => _time.value.stream;

  int get time => _time.value.value;
  //int time = 60;

  final RxState<int> _qIndex = RxState<int>(0);
  Stream<int> get qIndexStream => _qIndex.value.stream;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
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
    _time.emit(60);
  }

  submit() {}

  onTimeEnd() {
    _time.emit(0);
  }

  onSelectItem(int questionId, String value) {
    List<String?> tmp = userSelections;
    tmp[questionId] = value;
    _userSelections.emit(tmp);
  }

  nextQuestion(int index) {
    _qIndex.emit(index);
  }

}
