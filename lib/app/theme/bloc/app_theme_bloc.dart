import 'package:bloc/bloc.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme.dart';
import 'package:road_to_the_dream/app/theme/bloc/app_theme_event.dart';
import 'package:road_to_the_dream/app/theme/models/app_color_theme.dart';
import 'package:road_to_the_dream/app/theme/models/app_text_theme.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppTheme> {
  AppThemeBloc()
      : super(AppTheme(
          colorTheme: LightColorTheme(),
          textTheme: DefaultTextTheme(),
        )) {
    on<AppThemeEventSetLightTheme>((event, emit) {
      emit(state.copyWith(colorTheme: LightColorTheme()));
    });
  }
}
