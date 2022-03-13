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
  int get hashCode => uuid.hashCode;

  @override
  String toString() => 'UUID($uuid)';

  @override
  bool operator ==(Object other) => other is UUID ? uuid == other.uuid : false;

  UUID copyWith({required String uuid}) => UUID(uuid: uuid);
}
