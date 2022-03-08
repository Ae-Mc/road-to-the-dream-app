import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_to_the_dream/arch/single_result_bloc/single_result_bloc_builder.dart';
import 'package:road_to_the_dream/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:road_to_the_dream/features/splash/presentation/bloc/splash_event.dart';
import 'package:road_to_the_dream/features/splash/presentation/bloc/splash_state.dart';
import 'package:road_to_the_dream/features/splash/presentation/widgets/splash_failed.dart';
import 'package:road_to_the_dream/features/splash/presentation/widgets/splash_loading.dart';
import 'package:get_it/get_it.dart';

class SplashPage extends StatelessWidget {
  final void Function() onLoad;
  const SplashPage({Key? key, required this.onLoad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<SplashBloc>()..add(const SplashEvent.init()),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Expanded(
                flex: 3,
                child: SingleResultBlocBuilder<SplashBloc, SplashState,
                    SplashSingleResult>(
                  onSingleResult: (context, singleResult) =>
                      singleResult.when(loaded: onLoad),
                  builder: (context, state) => state.when(
                    loading: () => const SplashLoading(),
                    failure: (_) => const SplashFailed(),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
