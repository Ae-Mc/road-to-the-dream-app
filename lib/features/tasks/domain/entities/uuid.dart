import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

class UUID {
  final String uuid;

  UUID({
    String? uuid,
  }) : uuid = uuid ?? GetIt.I<Uuid>().v4();

  String toJson() => uuid;
  const UUID.fromJson(String json) : uuid = json;

  @override
  String toString() => 'UUID($uuid)';
}
