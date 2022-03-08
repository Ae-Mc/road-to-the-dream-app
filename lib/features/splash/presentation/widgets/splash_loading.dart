import 'package:flutter/material.dart';
import 'package:flutter_template_project/app/theme/bloc/app_theme.dart';

class SplashLoading extends StatelessWidget {
  const SplashLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const FlutterLogo(size: 128),
        SizedBox(
          height: 48,
          width: 48,
          child: CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation(
              AppTheme.of(context).colorTheme.onBackground,
            ),
          ),
        ),
      ],
    );
  }
}
