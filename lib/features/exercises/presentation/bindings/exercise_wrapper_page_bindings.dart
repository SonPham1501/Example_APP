import 'package:test_app/injection.dart';
import 'package:test_app/routes/di.dart';

import '../controllers/exercise_wrapper_page_controller.dart';

class ExerciseWrapperPageBindings extends Bindings {
  @override
  void dependencies() {
    putLazy(() => ExerciseWrapperPageController(appRouter.arguments));
  }
}
