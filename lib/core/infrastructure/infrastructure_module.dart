import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

@module
abstract class InfrastructureModule {
  @lazySingleton
  Logger logger() => Logger(
        printer: PrettyPrinter(),
      );

  @lazySingleton
  Uuid uuid() => const Uuid();
}
