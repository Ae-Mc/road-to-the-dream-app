import 'package:freezed_annotation/freezed_annotation.dart';

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
