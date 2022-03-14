import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:road_to_the_dream/features/tasks/presentation/utils/date_range_to_text.dart';

part 'stage.freezed.dart';
part 'stage.g.dart';

@freezed
class Stage with _$Stage {
  const factory Stage({
    required String name,
    DateTime? from,
    DateTime? to,
    String? description,
  }) = _Stage;

  factory Stage.fromJson(Map<String, dynamic> json) => _$_Stage.fromJson(json);
}

extension StageDateRange on Stage {
  String getDateRangeString() => dateRangeToText(from, to);
}
