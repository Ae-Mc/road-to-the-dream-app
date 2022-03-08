import 'package:auto_route/auto_route.dart';
import 'package:road_to_the_dream/app/router/app_router.gr.dart';

class InitGuard implements AutoRouteGuard {
  final bool Function() isInitialized;

  InitGuard(this.isInitialized);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!isInitialized()) {
      // ignore: avoid-ignoring-return-values
      router.push(SplashRoute(onLoad: () {
        resolver.next();
        // ignore: avoid-ignoring-return-values
        router.removeWhere((route) => route.name == SplashRoute.name);
      }));
    } else {
      resolver.next();
    }
  }
}
