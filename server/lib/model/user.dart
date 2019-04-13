import '../ros_server.dart';

import 'state.dart';

class User extends ManagedObject<_User> implements _User, ManagedAuthResourceOwner<_User> {
  @Serialize(input: true, output: false)
  String password;
}

class _User extends ResourceOwnerTableDefinition {
  @Column(unique: true)
  String email;

  @Relate(#user)
  State state;

  @Relate(#ouser)
  State oldState;
}