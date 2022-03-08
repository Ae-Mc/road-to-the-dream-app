import 'package:dartz/dartz.dart';
import 'package:road_to_the_dream/core/failure.dart';

abstract class StartupRepository {
  bool get isInitialized;
  Future<Either<List<Failure>, void>> initialize();
  Future<Either<List<Failure>, void>> retryInitialization();
}
