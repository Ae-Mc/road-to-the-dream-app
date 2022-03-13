import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:road_to_the_dream/app/router/app_router.gr.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/category.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/universal_card.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UniversalCard(
      color: Color(category.color + 0xFF000000),
      onCardTap: () =>
          AutoRouter.of(context).push(CategoryDetailsRoute(category: category)),
      onDelete: () => deleteCategory(context),
      onRename: () => renameCategory(context),
      subtitle: '${category.tasks.length} tasks',
      title: category.name,
    );
  }

  void deleteCategory(BuildContext context) {
    //TODO
    GetIt.I<Logger>().d('Delete category');
  }

  void renameCategory(BuildContext context) {
    // TODO
    GetIt.I<Logger>().d('Rename category');
  }
}
