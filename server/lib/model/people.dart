import '../ros_server.dart';

import 'state.dart';

class People extends ManagedObject<_People> implements _People {}

class _People {
  @primaryKey
  int id;

  int turnsAgo;

  int happiness;

  int quantity;

  @Relate(#people, onDelete: DeleteRule.cascade)
  State state;
}