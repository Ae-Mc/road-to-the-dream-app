import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.of(context).colorTheme.background,
        body: const AutoRouter(),
      ),
    );
  }
}
