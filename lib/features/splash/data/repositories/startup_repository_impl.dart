import 'package:road_to_the_dream/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:road_to_the_dream/features/splash/data/models/initialization_status.dart';
import 'package:road_to_the_dream/features/splash/domain/repositories/startup_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: StartupRepository)
class StartupRepositoryImpl implements StartupRepository {
  InitializationStatus initializationStatus = InitializationStatus();

  @override
  bool get isInitialized {
    return initializationStatus.statuses.every((element) => element);
  }

  @override
  Future<Either<List<Failure>, void>> initialize() async {
    List<Failure> failures = [];

    return failures.isEmpty ? const Right(null) : Left(failures);
  }

  @override
  Future<Either<List<Failure>, void>> retryInitialization() async {
    List<Failure> failures = [];

    return failures.isEmpty ? const Right(null) : Left(failures);
  }

  Future<Either<Failure, void>> initializeLoading() async {
    await Future.delayed(const Duration(seconds: 2), () => null);

    return const Right(null);
  }
}
