import 'package:test_app/features/test/presentation/controllers/test_doing_page_controller.dart';
import 'package:test_app/routes/di.dart';

import '../../../../injection.dart';

class TestDoingBindings extends Bindings {
  @override
  void dependencies() {
    putLazy(() => TestDoingPageController(appRouter.arguments));
  }
}
