import '../ros_server.dart';

import 'state.dart';

class Economics extends ManagedObject<_Economics> implements _Economics {}

class _Economics {
  @primaryKey
  int id;

  int turnsAgo;

  @Relate(#economics, onDelete: DeleteRule.cascade)
  State state;
}