import 'package:road_to_the_dream/app/router/guards/init_guard.dart';
import 'package:road_to_the_dream/features/splash/domain/repositories/startup_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:road_to_the_dream/app/router/app_router.gr.dart';

@module
abstract class RouterModule {
  @singleton
  AppRouter appRouter(InitGuard initGuard) => AppRouter(initGuard: initGuard);

  @singleton
  InitGuard initGuard(StartupRepository startupRepository) =>
      InitGuard(() => startupRepository.isInitialized);
}
