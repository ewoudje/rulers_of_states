import 'package:ros_server/model/state.dart';
import 'package:ros_server/model/user.dart';

import '../ros_server.dart';

class NewStateController extends ResourceController {
  NewStateController(this.context);

  final ManagedContext context;

  @Operation.post()
  Future<Response> newState(@Bind.body(require: ['name']) NewStateRequest data) async {
    var user = await (Query<User>(context)
        ..where((u) => u.id).equalTo(request.authorization.ownerID)
        ..where((u) => u.state).equalTo(null)
    ).fetchOne();

    if (user == null)
      return Response.badRequest(body: {"error": "can't create a new state if you already have one!", "code": 1});

    var state = await (Query<State>(context)..where((s) => s.name).equalTo(data.name)).fetchOne();

    if (state != null)
      return Response.badRequest(body: {"error": "can't create a with that name! it is already in use", "code": 2});

    return Response.ok(await State.newState(context, data.name, user));
  }

  @override
  Map<String, APIResponse> documentOperationResponses(APIDocumentContext context, Operation operation) {
    if (operation.method == "POST") {
      return {
        "200": APIResponse.schema("The new state", State().documentSchema(context)),
        "400": APIResponse.schema("An error", APISchemaObject.object({
          "error": APISchemaObject.string(),
          "code": APISchemaObject.integer()
        }))
      };
    }
    return null;
  }
}

class NewStateRequest extends Serializable {
  String name;

  @override
  Map<String, dynamic> asMap() =>
      {
        "name": name
      };

  @override
  void readFromMap(Map<String, dynamic> object) {
    name = object["name"] as String;
  }
}