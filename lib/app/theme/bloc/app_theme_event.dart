import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_theme_event.freezed.dart';

@freezed
class AppThemeEvent with _$AppThemeEvent {
  factory AppThemeEvent.setLightTheme() = AppThemeEventSetLightTheme;
}
