import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/category.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/stroke_text.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(category.color + 0xFF000000),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        onTap: () => GetIt.I<Logger>().d('Open category details page'),
        child: Padding(
          padding: const Pad(all: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      category.name,
                      style: AppTheme.of(context).textTheme.title1.copyWith(
                            color: AppTheme.of(context).colorTheme.primary,
                          ),
                    ),
                  ),
                  PopupMenuButton(
                    child: const Icon(Icons.more_vert_rounded),
                    color: Colors.transparent,
                    elevation: 0,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Card(
                              color: AppTheme.of(context).colorTheme.primary,
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                              ),
                              child: InkWell(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                                onTap: () => deleteCategory(context),
                                child: Text(
                                  'Delete',
                                  style: AppTheme.of(context).textTheme.title2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Card(
                              color: Color.lerp(
                                AppTheme.of(context).colorTheme.primary,
                                AppTheme.of(context).colorTheme.onPrimary,
                                0.1,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(16),
                                ),
                              ),
                              child: InkWell(
                                borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(16),
                                ),
                                onTap: () => renameCategory(context),
                                child: Text(
                                  'Rename',
                                  style: AppTheme.of(context).textTheme.title2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    offset: const Offset(0, -16),
                    padding: Pad.zero,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              StrokeText(
                '${category.tasks.length} tasks',
                style: AppTheme.of(context).textTheme.body1Regular.copyWith(
                      color: AppTheme.of(context).colorTheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                strokeWidth: 0.5,
                strokeColor: AppTheme.of(context).colorTheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteCategory(BuildContext context) {
    GetIt.I<Logger>().d('Delete category');

    Navigator.of(context).pop();
  }

  void renameCategory(BuildContext context) {
    GetIt.I<Logger>().d('Rename category');

    Navigator.of(context).pop();
  }
}
