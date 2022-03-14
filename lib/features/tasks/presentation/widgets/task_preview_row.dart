import 'package:flutter/material.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/task.dart';

class TaskPreviewRow extends StatelessWidget {
  final Task task;
  final Color categoryColor;

  const TaskPreviewRow({
    Key? key,
    required this.task,
    required this.categoryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: categoryColor,
            shape: BoxShape.circle,
          ),
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(task.name, style: AppTheme.of(context).textTheme.title2),
              if (task.from != null)
                Text(
                  task.getDateRangeString(),
                  style: AppTheme.of(context)
                      .textTheme
                      .body1Regular
                      .copyWith(color: categoryColor),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
