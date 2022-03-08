import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String name,
    DateTime? start,
    DateTime? end,
  }) = _Task;
}
