import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_bloc.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.of(context).colorTheme.background,
        body: BlocProvider<TasksBloc>(
          create: (context) => GetIt.I<TasksBloc>(),
          child: const AutoRouter(),
        ),
      ),
    );
  }
}
