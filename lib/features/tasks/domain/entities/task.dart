import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/stage.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/uuid.dart';
import 'package:road_to_the_dream/features/tasks/presentation/utils/date_range_to_text.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required UUID id,
    required String name,
    @Default([]) List<Stage> stages,
    DateTime? from,
    DateTime? to,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$_Task.fromJson(json);
}

extension TaskDateRange on Task {
  String getDateRangeString() => dateRangeToText(from, to);
}
