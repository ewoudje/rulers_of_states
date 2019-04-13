import 'package:ros_server/model/state.dart';
import 'package:ros_server/model/user.dart';

import '../ros_server.dart';

class NewStateController extends ResourceController {
  NewStateController(this.context);

  final ManagedContext context;

  @Operation.post()
  Future<Response> newState() async {
    var user = await (Query<User>(context)
        ..where((u) => u.id).equalTo(request.authorization.ownerID)
        ..where((u) => u.state).equalTo(null)
    ).fetchOne();

    if (user == null)
      return Response.badRequest(body: {"error": "can't create a new state if you already have one!", "code": 1});
    final data = await request.body.decode();

    final state = await (Query<State>(context)..where((s) => s.name).equalTo(data['name'] as String)).fetchOne();

    if (state != null)
      return Response.badRequest(body: {"error": "can't create a with that name! it is already in use", "code": 2});

    return Response.ok(await State.newState(context, data['name'] as String, user));
  }
}