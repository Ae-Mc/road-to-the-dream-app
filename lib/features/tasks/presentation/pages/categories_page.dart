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
    final textTheme = AppTheme.of(context).textTheme;

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return ListView(
          padding: const Pad(all: 16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Text('Categories', style: textTheme.headline1)),
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
                final todayTasks = categories
                    .map((category) => category.tasks
                        .where((task) =>
                            task.from != null &&
                            (now.isSameDate(task.from!) ||
                                task.to != null &&
                                    now.compareTo(task.from!) >= 0 &&
                                    now.compareTo(task.to!) <= 0))
                        .map((task) => MapEntry(category, task)))
                    .fold<List<MapEntry<Category, Task>>>(
                  [],
                  (previousValue, element) => [...previousValue, ...element],
                );

                return todayTasks.isNotEmpty
                    ? [
                        Text('Today', style: textTheme.headline2),
                        const SizedBox(height: 10),
                        ...todayTasks
                            .map((task) => Padding(
                                  padding: const Pad(vertical: 6),
                                  child: TaskPreviewRow(
                                    task: task.value,
                                    categoryColor:
                                        Color(0xFF000000 + task.key.color),
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
