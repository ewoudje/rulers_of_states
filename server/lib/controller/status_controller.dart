import 'package:ros_server/model/state.dart';

import '../ros_server.dart';

class StatusController extends ResourceController {
  StatusController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getSelfStatus({@Bind.query("turns-ago") int turnsAgo = 0}) async {
    var state = await (Query<State>(context)
      ..where((t) => t.user.id).equalTo(request.authorization.ownerID)
      ..join(set: (a) => a.people).where((t) => t.turnsAgo).equalTo(turnsAgo)
      ..join(set: (a) => a.military).where((t) => t.turnsAgo).equalTo(turnsAgo)
      ..join(set: (a) => a.economics).where((t) => t.turnsAgo).equalTo(turnsAgo)
    ).fetchOne();

    if (state == null)
      return Response.notFound();

    return Response.ok(state);
  }

  @Operation.get('state')
  Future<Response> getStatus(@Bind.path('state') int id, {@Bind.query("turns-ago") int turnsAgo = 0}) async {
    if (!request.authorization.isAuthorizedForScope('users'))
      return Response.forbidden();

    var state = await (Query<State>(context)
        ..where((t) => t.id).equalTo(id)
        ..join(set: (a) => a.people).where((t) => t.turnsAgo).equalTo(turnsAgo)
        ..join(set: (a) => a.military).where((t) => t.turnsAgo).equalTo(turnsAgo)
        ..join(set: (a) => a.economics).where((t) => t.turnsAgo).equalTo(turnsAgo)
    ).fetchOne();

    if (state == null)
      return Response.notFound();

    return Response.ok(state);
  }

  @override
  Map<String, APIResponse> documentOperationResponses(APIDocumentContext context, Operation operation) {
    if (operation.method == "GET") {
      return {
        "200": APIResponse.schema("The state has been found!", State().documentSchema(context)),
        "403": APIResponse("The authoized has no access to be able to see other users!"),
        "404": APIResponse("The state you asked for cannot be found!")
      };
    }
    return null;
  }
}