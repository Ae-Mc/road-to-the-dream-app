import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/category.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/task.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/uuid.dart';

part 'tasks_event.freezed.dart';

@freezed
class TasksEvent with _$TasksEvent {
  const factory TasksEvent.categoryAdded(Category category) =
      TasksEventCategoryAdded;
  const factory TasksEvent.categoryRemoved(UUID categoryID) =
      TasksEventCategoryRemoved;
  const factory TasksEvent.taskAdded(UUID categoryID, Task task) =
      TasksEventTaskAdded;
  const factory TasksEvent.taskRemoved(UUID taskID) = TasksEventTaskRemoved;
}
