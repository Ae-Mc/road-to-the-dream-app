import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_to_the_dream/app/router/app_router.gr.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/category.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/task.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_state.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/create_category_dialog.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/category_card.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/styled_icon_button.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/task_preview_row.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return ListView(
          padding: const Pad(all: 16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'Categories',
                    style: AppTheme.of(context).textTheme.headline1,
                  ),
                ),
                StyledIconButton(
                  icon: Icons.search,
                  iconSize: 64,
                  onPressed: () =>
                      AutoRouter.of(context).push(const SearchCategoryRoute()),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...state.when(
              loaded: (categories) => categories
                  .map<Widget>(
                    (e) => Padding(
                      padding: const Pad(vertical: 8),
                      child: CategoryCard(category: e),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            ...state.when<List<Widget>>(
              loaded: (categories) {
                final now = DateTime.now();
                final List<MapEntry<Category, Task>> todayTasks = [];

                for (final category in categories) {
                  for (final task in category.tasks) {
                    final start = task.start;
                    if (start == null) {
                      continue;
                    }

                    final end = task.end;
                    if (end == null) {
                      if (now.isSameDate(start)) {
                        todayTasks.add(MapEntry(category, task));
                      }
                    } else {
                      if (now.compareTo(start) >= 0 &&
                          now.compareTo(end) <= 0) {
                        todayTasks.add(MapEntry(category, task));
                      }
                    }
                  }
                }

                return todayTasks.isNotEmpty
                    ? [
                        Text(
                          'Today',
                          style: AppTheme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(height: 10),
                        ...todayTasks
                            .map((e) => Padding(
                                  padding: const Pad(vertical: 6),
                                  child: TaskPreviewRow(
                                    task: e.value,
                                    categoryColor:
                                        Color(0xFF000000 + e.key.color),
                                  ),
                                ))
                            .toList(),
                        const SizedBox(height: 10),
                      ]
                    : [];
              },
            ),
            Center(
              child: StyledIconButton(
                icon: Icons.add_circle_outline,
                iconSize: 72,
                onPressed: () => AutoRouter.of(context).pushNativeRoute(
                  DialogRoute(
                    context: context,
                    builder: (context) => const CreateCategoryDialog(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
