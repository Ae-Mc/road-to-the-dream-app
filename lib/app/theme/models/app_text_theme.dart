import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

@immutable
abstract class AppTextTheme {
  String get fontFamily;

  TextStyle get body1Regular;
  TextStyle get button;
  TextStyle get headline1;
  TextStyle get headline2;
}

class DefaultTextTheme implements AppTextTheme {
  @override
  String get fontFamily => 'roboto';

  @override
  TextStyle get body1Regular => const TextStyle(fontSize: 16);

  @override
  TextStyle get button => const TextStyle(fontSize: 18);

  @override
  TextStyle get headline1 => const TextStyle(fontSize: 24);

  @override
  TextStyle get headline2 => const TextStyle(fontSize: 20);
}
