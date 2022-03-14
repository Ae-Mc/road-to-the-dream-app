import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_to_the_dream/app/router/app_router.gr.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/uuid.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_state.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/stroke_text.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/styled_icon_button.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/switcher_line.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/stage.dart';

class TaskDetailsPage extends StatelessWidget {
  final UUID taskID;

  const TaskDetailsPage({Key? key, required this.taskID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppTheme.of(context).colorTheme;
    final textTheme = AppTheme.of(context).textTheme;

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return state.when(
          loaded: (categories) {
            final category = categories.firstWhere((element) =>
                element.tasks.any((element) => element.id == taskID));
            final task =
                category.tasks.firstWhere((element) => element.id == taskID);

            return Stack(
              children: [
                ListView(
                  padding: const Pad(all: 16, bottom: 32),
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
                            'Task',
                            style: textTheme.headline1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        color: colorTheme.tertiary,
                      ),
                      padding: const Pad(all: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(1000),
                              ),
                              color: colorTheme.secondary,
                            ),
                            // width: double.infinity,
                            child: Text(
                              task.name,
                              maxLines: 3,
                              style: textTheme.title1
                                  .copyWith(color: colorTheme.primary),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ...task.stages.map(
                            (stage) => Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(height: 16),
                                StrokeText(
                                  stage.name,
                                  style: textTheme.title2,
                                  strokeColor: colorTheme.primary,
                                  strokeWidth: textTheme.strokeWidth,
                                ),
                                if (stage.from != null)
                                  Text(
                                    stage.getDateRangeString(),
                                    style: textTheme.caption
                                        .copyWith(color: colorTheme.primary),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final taskWidth = constraints.maxWidth / 3;
                      final orderedTasks = [
                        task,
                        ...category.tasks
                            .where((element) => element.id != task.id),
                      ];

                      final tiles = <TextAndColor>[];

                      for (int i = 0; i < orderedTasks.length; i++) {
                        tiles.add(TextAndColor(
                          text: orderedTasks[i].name,
                          color: Color(category.color)
                              .withOpacity([1.0, 0.75, 0.5, 0.75][i % 4]),
                        ));
                      }

                      return SwitcherLine(
                        tiles: tiles,
                        tileWidth: taskWidth,
                        onTileTap: (index) => AutoRouter.of(context).replace(
                          TaskDetailsRoute(taskID: orderedTasks[index].id),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
