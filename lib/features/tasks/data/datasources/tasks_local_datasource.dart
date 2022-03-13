import 'package:dartz/dartz.dart';
import 'package:road_to_the_dream/core/failure.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/category.dart';

abstract class TasksLocalDataSource {
  List<Category> load();
  Future<Either<Failure, void>> save(List<Category> categories);
}
