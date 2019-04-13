import 'package:ros_server/model/user.dart';

import '../ros_server.dart';

class RegisterController extends ResourceController {
  RegisterController(this.context, this.authServer);

  final ManagedContext context;
  final AuthServer authServer;

  @Operation.post()
  Future<Response> getStatus(@Bind.body(ignore: ["id"]) User user) async {

    if (user.username == null || user.password == null) {
      return Response.badRequest(
          body: {"error": "username and password required."});
    }

    user
      ..salt = AuthUtility.generateRandomSalt()
      ..hashedPassword = authServer.hashPassword(user.password, user.salt);
    final outUser = await Query(context, values: user).insert();

    return Response.ok(outUser);
  }
}