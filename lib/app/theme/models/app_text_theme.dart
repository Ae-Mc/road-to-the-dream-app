import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

@immutable
abstract class AppTextTheme {
  String get fontFamily;

  TextStyle get body1Regular;
  TextStyle get headline1;
  TextStyle get headline2;
  TextStyle get title1;
  TextStyle get title2;
  TextStyle get title3;
}

class DefaultTextTheme implements AppTextTheme {
  @override
  String get fontFamily => 'Rokkitt';

  @override
  TextStyle get body1Regular => const TextStyle(
        fontFamily: 'Rokkitt',
        fontSize: 16,
        overflow: TextOverflow.ellipsis,
      );

  @override
  TextStyle get headline1 => const TextStyle(
        fontFamily: 'Headland One',
        fontSize: 36,
        overflow: TextOverflow.ellipsis,
      );

  @override
  TextStyle get headline2 => const TextStyle(
        fontFamily: 'Headland One',
        fontSize: 24,
        overflow: TextOverflow.ellipsis,
      );

  @override
  TextStyle get title1 => const TextStyle(
        fontFamily: 'Rokkitt',
        fontSize: 24,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      );

  @override
  TextStyle get title2 => const TextStyle(
        fontFamily: 'Rokkitt',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      );

  @override
  TextStyle get title3 => const TextStyle(
        fontFamily: 'Rokkitt',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      );
}
