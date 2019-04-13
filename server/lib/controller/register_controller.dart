import 'package:ros_server/model/user.dart';

import '../ros_server.dart';

class RegisterController extends ResourceController {
  RegisterController(this.context, this.authServer);

  final ManagedContext context;
  final AuthServer authServer;

  @Operation.post()
  Future<Response> register(@Bind.body(reject: ['id', 'state', 'oldState'], require: ['username', 'password', 'email']) User user) async {

    user
      ..salt = AuthUtility.generateRandomSalt()
      ..hashedPassword = authServer.hashPassword(user.password, user.salt);
    final outUser = await Query(context, values: user).insert();

    return Response.ok(outUser);
  }

  @override
  Map<String, APIResponse> documentOperationResponses(APIDocumentContext context, Operation operation) {
    if (operation.method == "GET") {
      return {
        "200": APIResponse.schema("The user has been registerd!", User().documentSchema(context))
      };
    }
    return null;
  }
}