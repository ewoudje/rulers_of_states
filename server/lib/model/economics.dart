import '../ros_server.dart';

import 'state.dart';

class Economics extends ManagedObject<_Economics> implements _Economics {}

class _Economics {
  @primaryKey
  int id;

  @Relate(#economics, onDelete: DeleteRule.cascade)
  State state;
}