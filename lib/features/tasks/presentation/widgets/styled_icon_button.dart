import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/core/widgets/styled_icon.dart';

class StyledIconButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final double iconSize;

  const StyledIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: AppTheme.of(context).colorTheme.secondary,
      icon: StyledIcon(icon),
      iconSize: iconSize,
      onPressed: onPressed,
      padding: Pad.zero,
      visualDensity: VisualDensity.compact,
    );
  }
}
