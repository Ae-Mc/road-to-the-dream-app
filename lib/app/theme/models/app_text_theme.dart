import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

@immutable
abstract class AppTextTheme {
  String get fontFamily;

  double get strokeWidth;

  TextStyle get body1Bold;
  TextStyle get body1Regular;
  TextStyle get caption;
  TextStyle get headline1;
  TextStyle get headline2;
  TextStyle get title1;
  TextStyle get title2;
  TextStyle get title3;
}

class DefaultTextTheme implements AppTextTheme {
  @override
  get fontFamily => 'Rokkitt';

  @override
  get strokeWidth => 2;

  @override
  get body1Bold => const TextStyle(
        fontFamily: 'Rokkitt',
        fontSize: 14,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      );

  @override
  get body1Regular => const TextStyle(
        fontFamily: 'Rokkitt',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        overflow: TextOverflow.ellipsis,
      );

  @override
  get caption => const TextStyle(
        fontFamily: 'Rokkitt',
        fontSize: 10,
        fontWeight: FontWeight.normal,
        overflow: TextOverflow.ellipsis,
      );

  @override
  get headline1 => const TextStyle(
        fontFamily: 'Headland One',
        fontSize: 36,
        overflow: TextOverflow.ellipsis,
      );

  @override
  get headline2 => const TextStyle(
        fontFamily: 'Headland One',
        fontSize: 24,
        overflow: TextOverflow.ellipsis,
      );

  @override
  get title1 => const TextStyle(
        fontFamily: 'Rokkitt',
        fontSize: 24,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      );

  @override
  get title2 => const TextStyle(
        fontFamily: 'Rokkitt',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      );

  @override
  get title3 => const TextStyle(
        fontFamily: 'Rokkitt',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      );
}
