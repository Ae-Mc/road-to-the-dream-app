import 'package:flutter/material.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/core/widgets/styled_icon.dart';

class SplashLoading extends StatelessWidget {
  const SplashLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppTheme.of(context).colorTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StyledIcon(Icons.check_circle, color: colorTheme.primary, size: 128),
        SizedBox(
          height: 48,
          width: 48,
          child: CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation(colorTheme.primary),
          ),
        ),
      ],
    );
  }
}
