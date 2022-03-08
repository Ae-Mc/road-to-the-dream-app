import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/counter/presentation/cubit/counter_cubit.dart';
import 'package:get_it/get_it.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<CounterCubit>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: BlocBuilder<CounterCubit, int>(
                  builder: (context, state) => Text(
                    'Counter value: $state',
                    style: AppTheme.of(context).textTheme.headline2,
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton.small(
              child: const Icon(Icons.add),
              onPressed: () =>
                  BlocProvider.of<CounterCubit>(context).increment(),
              backgroundColor: AppTheme.of(context).colorTheme.primary,
              foregroundColor: AppTheme.of(context).colorTheme.onPrimary,
            ),
          );
        },
      ),
    );
  }
}
