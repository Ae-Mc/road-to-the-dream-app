import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:road_to_the_dream/app/router/app_router.gr.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/category.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_state.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/create_task_dialog/create_task_dialog.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/styled_icon_button.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/switcher_line.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/task_card.dart';

class CategoryDetailsPage extends StatelessWidget {
  final Category category;

  const CategoryDetailsPage({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView(
            padding: const Pad(all: 16),
            children: [
              Row(
                children: [
                  StyledIconButton(
                    icon: Icons.arrow_back,
                    iconSize: 32,
                    onPressed: Navigator.of(context).pop,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Tasks',
                      style: AppTheme.of(context).textTheme.headline1,
                    ),
                  ),
                  const SizedBox(width: 16),
                  StyledIconButton(
                    icon: Icons.search,
                    iconSize: 32,
                    onPressed: () =>
                        GetIt.I<Logger>().d('Open task search page'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ...category.tasks
                  .map((e) => Padding(
                        padding: const Pad(vertical: 8),
                        child: TaskCard(
                          task: e,
                          color: Color(category.color + 0xFF000000),
                        ),
                      ))
                  .toList(),
              const SizedBox(height: 8),
              Center(
                child: StyledIconButton(
                  icon: Icons.add_circle_outline,
                  iconSize: 72,
                  onPressed: () =>
                      AutoRouter.of(context).pushNativeRoute(DialogRoute(
                    context: context,
                    builder: (_) => const CreateTaskDialog(),
                  )),
                ),
              ),
            ],
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) => state.when(
              loaded: (categories) {
                final categoryWidth = constraints.maxWidth / 3;
                final orderedCategories = [
                  category,
                  ...categories.where((element) => element.id != category.id),
                ];

                return SwitcherLine(
                  tiles: orderedCategories
                      .map((e) => TextAndColor(
                            text: e.name,
                            color: Color(e.color + 0xFF000000),
                          ))
                      .toList(),
                  tileWidth: categoryWidth,
                  onTileTap: (index) => AutoRouter.of(context).replace(
                    CategoryDetailsRoute(category: orderedCategories[index]),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
