import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    final start = task.start;
    final end = task.end;

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
              if (start != null)
                Text(
                  end == null
                      ? (start.isMidnight
                          ? DateFormat('d MMMM').format(start)
                          : DateFormat('d MMMM. H:mm a').format(start))
                      : buildDateDiffString(start, end),
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

  String buildDateDiffString(DateTime start, DateTime end) {
    if (start.year == end.year) {
      if (start.month == end.month) {
        return '${start.day}-${DateFormat("d MMMM").format(end)}';
      } else {
        final format = DateFormat('d MMMM');

        return format.format(start) + ' - ' + format.format(end);
      }
    } else {
      final format = DateFormat('d MMMM y');

      return format.format(start) + ' - ' + format.format(end);
    }
  }
}

extension on DateTime {
  bool get isMidnight =>
      difference(DateTime(year, month, day)) == Duration.zero;
}
