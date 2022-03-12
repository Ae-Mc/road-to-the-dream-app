import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';
import 'package:road_to_the_dream/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:road_to_the_dream/features/splash/data/models/initialization_status.dart';
import 'package:road_to_the_dream/features/splash/domain/repositories/startup_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: StartupRepository)
class StartupRepositoryImpl implements StartupRepository {
  InitializationStatus initializationStatus = InitializationStatus(
    intlInitialized: false,
    sharedPreferencesInitialized: false,
  );

  @override
  bool get isInitialized {
    return initializationStatus.statuses.every((element) => element);
  }

  @override
  Future<Either<List<Failure>, void>> initialize() async {
    return await initializeAllNotInitialized();
  }

  @override
  Future<Either<List<Failure>, void>> retryInitialization() async {
    return await initializeAllNotInitialized();
  }

  Future<Either<List<Failure>, void>> initializeAllNotInitialized() async {
    List<Failure> failures = [];

    if (!initializationStatus.intlInitialized) {
      failures.addAll(
        (await initializeIntl()).fold(
          (l) => [l],
          (r) {
            initializationStatus =
                initializationStatus.copyWith(intlInitialized: true);

            return [];
          },
        ),
      );
    }

    if (!initializationStatus.sharedPreferencesInitialized) {
      failures
          .addAll((await initializeSharedPreferences()).fold((l) => [l], (r) {
        initializationStatus =
            initializationStatus.copyWith(sharedPreferencesInitialized: true);

        return [];
      }));
    }

    return failures.isEmpty ? const Right(null) : Left(failures);
  }

  Future<Either<Failure, void>> initializeIntl() async {
    try {
      await initializeDateFormatting();

      return const Right(null);
    } catch (e) {
      return const Left(Failure.unknownFailure());
    }
  }

  Future<Either<Failure, void>> initializeSharedPreferences() async {
    try {
      GetIt.I.registerSingleton(
        await SharedPreferences.getInstance(),
        instanceName: 'innerSharedPreferencesInstance',
      );

      return const Right(null);
    } catch (e) {
      GetIt.I<Logger>().e('Error occured initializing shared_preferences', e);

      return const Left(Failure.unknownFailure());
    }
  }
}
