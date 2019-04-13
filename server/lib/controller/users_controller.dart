import 'package:ros_server/model/user.dart';

import '../ros_server.dart';

class UsersController extends ResourceController {
  UsersController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getUser() async {
    return Response.ok(await (Query<User>(context)
      ..where((u) => u.id).equalTo(request.authorization.ownerID)
    ).fetchOne());
  }

  @Operation.get('user')
  Future<Response> getUserAdmin(@Bind.path('user') int userId) async {
    if (!request.authorization.isAuthorizedForScope('users'))
      return Response.unauthorized();

    var user = await (Query<User>(context)
      ..where((u) => u.id).equalTo(userId)
    ).fetchOne();

    if (user == null)
      return Response.notFound();

    return Response.ok(user);
  }
}