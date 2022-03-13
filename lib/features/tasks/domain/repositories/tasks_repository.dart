import 'package:dartz/dartz.dart' hide Task;
import 'package:road_to_the_dream/core/failure.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/category.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/task.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/uuid.dart';

abstract class TasksRepository {
  List<Category> load();
  Future<Either<Failure, void>> addCategory(Category category);
  Future<Either<Failure, void>> addTaskToCategory(UUID categoryID, Task task);
  Future<Either<Failure, void>> removeCategory(UUID categoryID);
  Future<Either<Failure, void>> removeTask(UUID taskID);
  Future<Either<Failure, void>> replaceTask(UUID taskID, Task newTask);
}
