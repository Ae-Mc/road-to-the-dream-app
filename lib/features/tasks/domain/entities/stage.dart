import 'package:freezed_annotation/freezed_annotation.dart';

part 'stage.freezed.dart';

@freezed
class Stage with _$Stage {
  const factory Stage({
    required String name,
    DateTime? from,
    DateTime? to,
    String? description,
  }) = _Stage;
}
