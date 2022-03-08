import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_event.freezed.dart';

@freezed
class TasksEvent with _$TasksEvent {
  const factory TasksEvent.started() = _Started;
}
