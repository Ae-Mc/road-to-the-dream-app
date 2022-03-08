import 'package:auto_route/auto_route.dart';
import 'package:flutter_template_project/app/router/guards/init_guard.dart';
import 'package:flutter_template_project/features/counter/presentation/pages/counter_page.dart';
import 'package:flutter_template_project/features/splash/presentation/pages/splash_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: SplashPage),
    AutoRoute(page: CounterPage, initial: true, guards: [InitGuard]),
  ],
)
class $AppRouter {}
