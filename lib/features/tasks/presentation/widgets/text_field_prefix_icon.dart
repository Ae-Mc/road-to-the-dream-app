import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';

class TextFieldPrefixIcon extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  final double size;

  const TextFieldPrefixIcon({
    Key? key,
    this.onTap,
    required this.icon,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Ink(
        decoration: ShapeDecoration(
          color: AppTheme.of(context).colorTheme.onPrimary,
          shape: const CircleBorder(),
        ),
        child: IconButton(
          color: AppTheme.of(context).colorTheme.primary,
          icon: Icon(icon),
          iconSize: size * 3 / 4,
          onPressed: onTap,
          padding: Pad.zero,
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            // ignore: no-equal-arguments
            vertical: VisualDensity.minimumDensity,
          ),
        ),
      ),
    );
  }
}
