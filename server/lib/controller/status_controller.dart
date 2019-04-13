import 'package:ros_server/model/state.dart';

import '../ros_server.dart';

class StatusController extends ResourceController {
  StatusController(this.context);

  final ManagedContext context;

  @Operation.get('state')
  Future<Response> getStatus(@Bind.path('state') int id) async {
    var state = await (Query<State>(context)
        ..where((t) => t.id).equalTo(id)
        ..join(object: (a) => a.people)
        ..join(object: (a) => a.military)
        ..join(object: (a) => a.economics)
    ).fetchOne();

    if (state == null)
      return Response.notFound();

    return Response.ok(state);
  }
}