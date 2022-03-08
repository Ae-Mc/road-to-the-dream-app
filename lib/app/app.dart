import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_project/app/router/app_router.gr.dart';
import 'package:flutter_template_project/app/theme/bloc/app_theme.dart';
import 'package:flutter_template_project/app/theme/bloc/app_theme_bloc.dart';
import 'package:get_it/get_it.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final router = GetIt.I.get<AppRouter>();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return BlocProvider(
      create: (context) => AppThemeBloc(),
      child: BlocBuilder<AppThemeBloc, AppTheme>(
        builder: (context, state) {
          return MaterialApp.router(
            title: "Flutter template project",
            routeInformationParser: router.defaultRouteParser(),
            routerDelegate: router.delegate(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: const ColorScheme.light().copyWith(
                background: state.colorTheme.background,
                brightness: state.colorTheme.brightness,
                onPrimary: state.colorTheme.onPrimary,
                primary: state.colorTheme.primary,
              ),
              iconTheme: IconThemeData(color: state.colorTheme.primary),
              textTheme: TextTheme(
                bodyText1: state.textTheme.body1Regular,
                headline1: state.textTheme.headline1,
                headline2: state.textTheme.headline2,
                button: state.textTheme.button,
              ),
              fontFamily: state.textTheme.fontFamily,
            ),
          );
        },
      ),
    );
  }
}
