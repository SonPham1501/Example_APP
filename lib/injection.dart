import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';
import 'routes/router/app_router.dart';

final getIt = GetIt.instance;
final appRouter = AppRouter.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => $initGetIt(getIt);
// Future<void> configureDependencies() async {
//   await $initGetIt(getIt);
// }
