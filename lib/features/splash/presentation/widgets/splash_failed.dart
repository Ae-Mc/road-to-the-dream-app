import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/core/widgets/styled_icon.dart';
import 'package:road_to_the_dream/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:road_to_the_dream/features/splash/presentation/bloc/splash_event.dart';

class SplashFailed extends StatelessWidget {
  const SplashFailed({Key? key}) : super(key: key);

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
          child: FloatingActionButton.small(
            onPressed: () => BlocProvider.of<SplashBloc>(context)
                .add(const SplashEvent.retryInitialization()),
            child: const Icon(Icons.replay),
            backgroundColor: colorTheme.primary,
            foregroundColor: colorTheme.onPrimary,
          ),
        ),
      ],
    );
  }
}
