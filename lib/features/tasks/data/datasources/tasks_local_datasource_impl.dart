import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:road_to_the_dream/core/failure.dart';
import 'package:road_to_the_dream/features/tasks/data/datasources/tasks_local_datasource.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/category.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: TasksLocalDataSource)
class TasksLocalDataSourceImpl implements TasksLocalDataSource {
  final SharedPreferences sharedPreferences;

  TasksLocalDataSourceImpl(this.sharedPreferences);

  @override
  List<Category> load() {
    final categories = sharedPreferences.getStringList('categories');
    if (categories == null) {
      return [];
    }

    return categories.map((e) => Category.fromJson(jsonDecode(e))).toList();
  }

  @override
  Future<Either<Failure, void>> save(List<Category> categories) async {
    final result = await sharedPreferences.setStringList(
      'categories',
      categories.map((e) => jsonEncode(e.toJson())).toList(),
    );

    if (!result) {
      GetIt.I<Logger>().d('Error saving categories to disk');
    }

    return result ? const Right(null) : const Left(Failure.unknownFailure());
  }
}
