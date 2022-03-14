import 'package:dartz/dartz.dart' hide Task;
import 'package:injectable/injectable.dart';
import 'package:road_to_the_dream/features/tasks/data/datasources/tasks_local_datasource.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/uuid.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/task.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/category.dart';
import 'package:road_to_the_dream/core/failure.dart';
import 'package:road_to_the_dream/features/tasks/domain/repositories/tasks_repository.dart';

@LazySingleton(as: TasksRepository)
class TasksRepositoryImpl implements TasksRepository {
  final TasksLocalDataSource localDataSource;

  TasksRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, void>> addCategory(Category category) =>
      localDataSource.save([...load(), category]);

  @override
  Future<Either<Failure, void>> addTaskToCategory(
    UUID categoryID,
    Task task,
  ) =>
      localDataSource.save(load()
        ..firstWhere((element) => element.id == categoryID).tasks.add(task));

  @override
  List<Category> load() => localDataSource.load();

  @override
  Future<Either<Failure, void>> removeCategory(UUID categoryID) =>
      localDataSource.save(
        load()..removeWhere((element) => element.id == categoryID),
      );

  @override
  Future<Either<Failure, void>> removeTask(UUID taskID) =>
      localDataSource.save(load()
        ..forEach(
          (element) =>
              element..tasks.removeWhere((element) => element.id == taskID),
        ));

  @override
  Future<Either<Failure, void>> replaceTask(UUID taskID, Task newTask) =>
      localDataSource.save(
        load()
          ..forEach((category) =>
              category.tasks.any((task) => task.id == taskID)
                  ? (category.tasks[category.tasks
                      .indexWhere((task) => task.id == taskID)] = newTask)
                  : null),
      );
}
