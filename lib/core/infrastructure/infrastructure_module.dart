import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

@module
abstract class InfrastructureModule {
  @lazySingleton
  Logger logger() => Logger(
        printer: PrettyPrinter(),
      );

  @lazySingleton
  Uuid uuid() => const Uuid();

  @lazySingleton
  SharedPreferences sharedPreferences() => GetIt.I<SharedPreferences>(
        instanceName: 'innerSharedPreferencesInstance',
      );
}
