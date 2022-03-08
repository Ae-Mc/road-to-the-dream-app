import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class InfrastructureModule {
  @lazySingleton
  Logger logger() => Logger(
        printer: PrettyPrinter(),
      );
}
