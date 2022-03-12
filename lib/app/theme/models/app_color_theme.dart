import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:road_to_the_dream/app/theme/models/app_pallete.dart';

@immutable
abstract class AppColorTheme {
  Brightness get brightness;

  Color get background;
  Color get disabled;
  Color get error;
  Color get onBackground;
  Color get onPrimary;
  Color get primary;
  Color get secondary;
  Color get shadow;
  Color get tertiary;
}

class LightColorTheme implements AppColorTheme {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get background => AppPallete.darkBlue;

  @override
  Color get error => AppPallete.red;

  @override
  Color get disabled => AppPallete.grey;

  @override
  Color get onBackground => AppPallete.white;

  @override
  Color get onPrimary => AppPallete.white;

  @override
  Color get primary => AppPallete.darkBlue;

  @override
  Color get secondary => AppPallete.beige;

  @override
  Color get shadow => AppPallete.black30;

  @override
  Color get tertiary => AppPallete.lightBlue;
}
