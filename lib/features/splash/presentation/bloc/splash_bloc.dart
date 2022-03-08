import 'package:flutter_template_project/arch/single_result_bloc/single_result_bloc.dart';
import 'package:flutter_template_project/features/splash/domain/repositories/startup_repository.dart';
import 'package:flutter_template_project/features/splash/presentation/bloc/splash_event.dart';
import 'package:flutter_template_project/features/splash/presentation/bloc/splash_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashBloc
    extends SingleResultBloc<SplashEvent, SplashState, SplashSingleResult> {
  final StartupRepository repository;

  SplashBloc(this.repository) : super(const SplashState.loading()) {
    on<SplashEvent>((event, emit) async {
      await event.when<Future<void>>(
        init: () async => (await repository.initialize()).fold(
          (l) => emit(SplashState.failure(l.first)),
          (r) => addSingleResult(const SplashSingleResult.loaded()),
        ),
        retryInitialization: () async {
          emit(const SplashState.loading());
          (await repository.retryInitialization()).fold(
            (l) => emit(SplashState.failure(l.first)),
            (r) => addSingleResult(const SplashSingleResult.loaded()),
          );
        },
      );
    });
  }
}
