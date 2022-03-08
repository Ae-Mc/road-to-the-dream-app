import 'package:dartz/dartz.dart';
import 'package:flutter_template_project/core/failure.dart';

abstract class StartupRepository {
  bool get isInitialized;
  Future<Either<List<Failure>, void>> initialize();
  Future<Either<List<Failure>, void>> retryInitialization();
}
