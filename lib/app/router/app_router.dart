import 'package:auto_route/auto_route.dart';
import 'package:road_to_the_dream/app/router/guards/init_guard.dart';
import 'package:road_to_the_dream/features/counter/presentation/pages/counter_page.dart';
import 'package:road_to_the_dream/features/splash/presentation/pages/splash_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: SplashPage),
    AutoRoute(page: CounterPage, initial: true, guards: [InitGuard]),
  ],
)
class $AppRouter {}
