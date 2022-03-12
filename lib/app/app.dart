import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_to_the_dream/app/router/app_router.gr.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:road_to_the_dream/app/theme/models/app_color_theme.dart';
import 'package:road_to_the_dream/features/tasks/presentation/bloc/tasks_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final router = GetIt.I.get<AppRouter>();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppThemeBloc()),
        BlocProvider(create: (_) => TasksBloc()),
      ],
      child: BlocBuilder<AppThemeBloc, AppTheme>(
        builder: (context, state) {
          return MaterialApp.router(
            title: "Road to the dream",
            routeInformationParser: router.defaultRouteParser(),
            routerDelegate: router.delegate(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              cardTheme: CardTheme(
                color: state.colorTheme.secondary,
                elevation: 8,
                margin: Pad.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
              colorScheme: const ColorScheme.light().copyWith(
                background: state.colorTheme.background,
                brightness: state.colorTheme.brightness,
                error: state.colorTheme.error,
                onBackground: state.colorTheme.onBackground,
                onPrimary: state.colorTheme.onPrimary,
                primary: state.colorTheme.primary,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                  backgroundColor:
                      ElevatedButtonBackgroundColor(state.colorTheme),
                  elevation: ElevatedButtonElevation(),
                  foregroundColor:
                      MaterialStateProperty.all(state.colorTheme.onPrimary),
                  padding: MaterialStateProperty.all(
                    const Pad(horizontal: 16, vertical: 6),
                  ),
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

class ElevatedButtonBackgroundColor extends MaterialStateProperty<Color> {
  final AppColorTheme colorTheme;
  ElevatedButtonBackgroundColor(this.colorTheme);

  @override
  Color resolve(Set<MaterialState> states) {
    return states.contains(MaterialState.disabled)
        ? colorTheme.disabled
        : colorTheme.primary;
  }
}

class ElevatedButtonElevation extends MaterialStateProperty<double> {
  @override
  double resolve(Set<MaterialState> states) {
    return states.contains(MaterialState.disabled) ? 0 : 8;
  }
}
