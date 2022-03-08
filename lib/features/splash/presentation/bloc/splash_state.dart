import 'package:road_to_the_dream/core/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.loading() = SplashStateLoading;
  const factory SplashState.failure(Failure failure) = SplashStateFailure;
}
