import 'package:bloc/bloc.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/category.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/task.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/uuid.dart';
import 'package:injectable/injectable.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_event.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_state.dart';

@injectable
class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc()
      : super(
          TasksState.loaded(
            categories: [
              Category(
                id: UUID(),
                name: "Category 1",
                color: 0xF1CACA,
                tasks: [
                  Task(
                    id: UUID(),
                    name: 'To do something',
                    start: DateTime(2022, 3, 8),
                    end: DateTime(2022, 3, 28),
                  ),
                ],
              ),
              Category(
                id: UUID(),
                name: "Category 2",
                color: 0xBFE8E3,
                tasks: [
                  Task(
                    id: UUID(),
                    name: 'To do something else',
                    start: DateTime(2022, 3, 8, 9, 0),
                  ),
                ],
              ),
              Category(
                id: UUID(),
                name: "Category 3",
                color: 0xFFDFA2,
                tasks: [
                  Task(id: UUID(), name: 'Another to do something else'),
                ],
              ),
            ],
          ),
        ) {
    on<TasksEvent>((event, emit) => {});
  }
}
