import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/task.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String name,
    required int color,
    required List<Task> tasks,
  }) = _Category;
}
