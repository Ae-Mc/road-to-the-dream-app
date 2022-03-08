import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_to_the_dream/app/router/app_router.gr.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme_bloc.dart';
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
              cardTheme: const CardTheme(
                elevation: 8,
                margin: Pad.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
              colorScheme: const ColorScheme.light().copyWith(
                background: state.colorTheme.background,
                brightness: state.colorTheme.brightness,
                onBackground: state.colorTheme.onBackground,
                onPrimary: state.colorTheme.onPrimary,
                primary: state.colorTheme.primary,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(state.colorTheme.primary),
                  elevation: MaterialStateProperty.all(8),
                  foregroundColor:
                      MaterialStateProperty.all(state.colorTheme.onPrimary),
                  padding: MaterialStateProperty.all(const Pad(horizontal: 16)),
                  minimumSize: MaterialStateProperty.all(Size.zero),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  )),
                  textStyle: MaterialStateProperty.all(state.textTheme.title1),
                ),
              ),
              fontFamily: state.textTheme.fontFamily,
              iconTheme: IconThemeData(color: state.colorTheme.primary),
              popupMenuTheme: PopupMenuThemeData(
                color: state.colorTheme.primary,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                textStyle: state.textTheme.title2,
              ),
              textTheme: TextTheme(
                bodyText1: state.textTheme.body1Regular,
                headline1: state.textTheme.headline1,
                headline2: state.textTheme.headline2,
                subtitle1: state.textTheme.title1,
              ),
            ),
          );
        },
      ),
    );
  }
}
