import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/stage.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/uuid.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required UUID id,
    required String name,
    @Default([]) List<Stage> stages,
    DateTime? start,
    DateTime? end,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$_Task.fromJson(json);
}

extension TaskDateRange on Task {
  String getDateRangeString() {
    final start = this.start;
    final end = this.end;
    if (start == null) {
      return '';
    }
    if (end == null) {
      return (start.isMidnight
          ? DateFormat('d MMMM').format(start)
          : DateFormat('d MMMM. H:mm a').format(start));
    }

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
