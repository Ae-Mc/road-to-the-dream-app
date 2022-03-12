import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';

class StyledIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;
  final Color? shadowColor;

  const StyledIcon(
    this.icon, {
    Key? key,
    this.size,
    this.color,
    this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppTheme.of(context).colorTheme;

    return DecoratedIcon(
      icon,
      color: color ?? colorTheme.secondary,
      size: size,
      shadows: [
        BoxShadow(
          blurRadius: 5,
          color: shadowColor ?? colorTheme.shadow,
          offset: const Offset(0, 4),
          spreadRadius: 1,
        ),
      ],
    );
  }
}
