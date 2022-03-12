import 'dart:ui';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/stage.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/task.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/uuid.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/create_task_dialog/widgets/create_stage_widget.dart';
import 'package:road_to_the_dream/features/tasks/presentation/pages/create_task_dialog/widgets/create_task_widget.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/styled_icon_button.dart';

class CreateTaskDialog extends StatefulWidget {
  const CreateTaskDialog({Key? key}) : super(key: key);

  @override
  State<CreateTaskDialog> createState() => _CreateTaskDialogState();
}

class _CreateTaskDialogState extends State<CreateTaskDialog>
    with TickerProviderStateMixin {
  late Task task;
  int stagesCount = 0;
  int currentStageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: ListView(
          padding: const Pad(horizontal: 32, top: 32, bottom: 16),
          shrinkWrap: true,
          children: [
            Card(
              color: AppTheme.of(context).colorTheme.tertiary,
              child: Padding(
                padding: const Pad(all: 16),
                child: IndexedStack(
                  index: currentStageNumber,
                  children: [
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: const Offset(0, 0),
                      ).animate(
                        CurvedAnimation(
                          parent: AnimationController(
                            duration: const Duration(milliseconds: 500),
                            vsync: this,
                          )..forward(),
                          curve: Curves.easeInOut,
                        ),
                      ),
                      child: CreateTaskWidget(
                        onNext: onCreateTaskDialogComplete,
                      ),
                    ),
                    ...List.generate(
                      stagesCount,
                      (index) => SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1, 0),
                          end: const Offset(0, 0),
                        ).animate(
                          CurvedAnimation(
                            parent: AnimationController(
                              duration: const Duration(milliseconds: 500),
                              vsync: this,
                            )..forward(),
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: CreateStageWidget(
                          stageNumber: index + 1,
                          isLastStage: index + 1 == stagesCount,
                          onNext: ({
                            required String name,
                            required String description,
                            DateTime? from,
                            DateTime? to,
                          }) =>
                              onNextStage(
                            index,
                            Stage(
                              description:
                                  description.isEmpty ? null : description,
                              from: from,
                              name: name,
                              to: to,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            StyledIconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: CupertinoIcons.clear_circled,
              iconSize: 72,
            ),
          ],
        ),
      ),
    );
  }

  // ignore: long-parameter-list
  void onNextStage(int currenStageIndex, Stage stage) {
    // ignore: avoid-ignoring-return-values
    task = task.copyWith(stages: [...task.stages, stage]);
    if (currenStageIndex + 1 == stagesCount) {
      GetIt.I<Logger>().d(task.toString().split(', ').join(',\n     '));
    } else {
      setState(() => currentStageNumber++);
    }
  }

  void onCreateTaskDialogComplete({
    required String name,
    required int stagesCount,
    DateTime? from,
    DateTime? to,
  }) {
    setState(() {
      this.stagesCount = stagesCount;
      currentStageNumber = 1;
      task = Task(id: UUID(), name: name, start: from, end: to);
    });
  }
}
