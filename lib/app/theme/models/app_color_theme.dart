import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter_template_project/app/theme/models/app_pallete.dart';

@immutable
abstract class AppColorTheme {
  Brightness get brightness;

  Color get background;
  Color get onBackground;
  Color get onPrimary;
  Color get primary;
}

class LightColorTheme implements AppColorTheme {
  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get background => AppPallete.white;

  @override
  Color get onBackground => AppPallete.subBlack;

  @override
  Color get onPrimary => AppPallete.white;

  @override
  Color get primary => AppPallete.subBlack;
}
