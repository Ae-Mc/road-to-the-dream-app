import 'package:auto_route/auto_route.dart';
import 'package:road_to_the_dream/app/router/guards/init_guard.dart';
import 'package:road_to_the_dream/core/root_page.dart';
import 'package:road_to_the_dream/features/splash/presentation/pages/splash_page.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/categories_page.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/category_details_page.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/search_category_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: RootPage,
      initial: true,
      children: [
        AutoRoute(page: CategoriesPage, initial: true, guards: [InitGuard]),
        AutoRoute(page: CategoryDetailsPage, guards: [InitGuard]),
        AutoRoute(page: SearchCategoryPage, guards: [InitGuard]),
        AutoRoute(page: SplashPage),
      ],
    ),
  ],
)
class $AppRouter {}
