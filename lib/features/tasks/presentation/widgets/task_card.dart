import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/task.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_event.dart';
import 'package:road_to_the_dream/features/tasks/presentation/widgets/universal_card.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Color color;

  const TaskCard({Key? key, required this.task, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) => UniversalCard(
        color: color,
        onCardTap: () => GetIt.I<Logger>().d('Open task details page'),
        onDelete: () => BlocProvider.of<TasksBloc>(context)
            .add(TasksEvent.taskRemoved(task.id)),
        onRename: () => GetIt.I<Logger>().d('Open task rename page'),
        subtitle: task.getDateRangeString(),
        title: task.name,
      );
}
