import 'package:ros_server/model/state.dart';
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
      return Response.forbidden();

    var user = await (Query<User>(context)
      ..where((u) => u.id).equalTo(userId)
    ).fetchOne();

    if (user == null)
      return Response.notFound();

    return Response.ok(user);
  }

  @override
  Map<String, APIResponse> documentOperationResponses(APIDocumentContext context, Operation operation) {
    if (operation.method == "GET") {
      if (operation.pathVariables.contains("user")) {
        return {
          "200": APIResponse.schema("The user has been found!", User().documentSchema(context)),
          "403": APIResponse("The authoized has no access to be able to see other users!"),
          "404": APIResponse("The user you asked cannot be found!")
        };
      } else {
        return {
          "200": APIResponse.schema("The user himself", User().documentSchema(context)),
        };
      }
    }
    return null;
  }
}