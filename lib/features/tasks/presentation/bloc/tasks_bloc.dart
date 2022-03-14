import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:road_to_the_dream/core/failure.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/task.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/uuid.dart';
import 'package:road_to_the_dream/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_event.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_state.dart';

@injectable
class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TasksRepository repository;

  TasksBloc(this.repository)
      : super(TasksState.loaded(categories: repository.load())) {
    on<TasksEvent>(handleEvent);
  }

  Future<void> handleEvent(TasksEvent event, Emitter<TasksState> emit) async {
    await event.when<Future<void>>(
      categoryAdded: (category) async =>
          updateState(await repository.addCategory(category), emit),
      taskAdded: (UUID categoryID, Task task) async => updateState(
        await repository.addTaskToCategory(categoryID, task),
        emit,
      ),
      taskRemoved: (UUID taskID) async =>
          updateState(await repository.removeTask(taskID), emit),
      categoryRemoved: (UUID categoryID) async =>
          updateState(await repository.removeCategory(categoryID), emit),
    );
  }

  void updateState(Either<Failure, void> result, Emitter<TasksState> emit) {
    return result.fold<void>(
      (l) {
        GetIt.I<Logger>().e('Error: $l');
        emit(const TasksState.loaded(categories: []));
      },
      (r) {
        emit(TasksState.loaded(categories: List.from(repository.load())));
      },
    );
  }
}
