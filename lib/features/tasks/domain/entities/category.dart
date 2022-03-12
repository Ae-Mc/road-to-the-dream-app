import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/task.dart';
import 'package:road_to_the_dream/features/tasks/domain/entities/uuid.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required UUID id,
    required String name,
    required int color,
    required List<Task> tasks,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;
}
