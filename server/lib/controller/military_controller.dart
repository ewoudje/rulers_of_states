import 'package:ros_server/model/military.dart';

import '../ros_server.dart';

class MilitaryController extends ResourceController {
  MilitaryController(this.context);

  final ManagedContext context;

  @Operation.get('state')
  Future<Response> getUnits(@Bind.path('state') int id) async {
    final query = (Query<MilitaryUnit>(context)
        ..where((t) => t.military.state.id).equalTo(id)
    );

    if (!request.authorization.isAuthorizedForScope('state:military.read'))
      query.where((t) => t.military.state.user.id).equalTo(request.authorization.ownerID);

    final units = await query.fetch();

    if (units == null)
      return Response.notFound();

    return Response.ok(units);
  }

  @Operation.get('state', 'unit')
  Future<Response> getUnit(@Bind.path('state') int id, @Bind.path('unit') int unitId) async {
    final query = Query<MilitaryUnit>(context)
        ..where((t) => t.military.state.id).equalTo(id)
        ..where((t) => t.id).equalTo(unitId)
        ..join(object: (t) => t.technology)
    ;

    if (!request.authorization.isAuthorizedForScope('state:military.read'))
      query.where((t) => t.military.state.user.id).equalTo(request.authorization.ownerID);

    final unit = query.fetchOne();

    if (unit == null)
      return Response.notFound();

    return Response.ok(unit);
  }

  @override
  Map<String, APIResponse> documentOperationResponses(APIDocumentContext context, Operation operation) {
    if (operation.method == "GET") {
      if (operation.pathVariables.contains("unit")) {
        return {
          "200": APIResponse.schema("The unit you asked", MilitaryUnit().documentSchema(context)),
          "404": APIResponse("The unit you asked can not be found!")
        };
      } else {
        return {
          "200": APIResponse.schema("The units from the state you asked!", APISchemaObject.array(ofSchema: MilitaryUnit().documentSchema(context))),
          "404": APIResponse("There are no units in that state!")
        };
      }
    }
    return null;
  }
}