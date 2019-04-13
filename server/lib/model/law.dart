import '../ros_server.dart';

import 'state.dart';

class Law extends ManagedObject<_Law> implements _Law {}

class _Law {
  @primaryKey
  int id;

  Document data;

  @Relate(#laws, onDelete: DeleteRule.cascade)
  State state;
}