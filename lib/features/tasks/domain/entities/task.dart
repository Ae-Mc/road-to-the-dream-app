import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/uuid.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required UUID id,
    required String name,
    DateTime? start,
    DateTime? end,
  }) = _Task;
}
