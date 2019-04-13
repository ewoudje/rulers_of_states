import 'package:ros_server/config.dart';
import 'package:ros_server/controller/military_controller.dart';
import 'package:ros_server/controller/register_controller.dart';
import 'package:ros_server/controller/newstate_controller.dart';
import 'package:ros_server/controller/status_controller.dart';
import 'package:ros_server/controller/users_controller.dart';
import 'package:ros_server/model/user.dart';

import 'ros_server.dart';

class ServerChannel extends ApplicationChannel {
  ManagedContext context;
  AuthServer authServer;

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final config = Config(options.configurationFilePath);
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        config.database.username,
        config.database.password,
        config.database.host,
        config.database.port,
        config.database.databaseName);

    context = ManagedContext(dataModel, persistentStore);

    final authStorage = ManagedAuthDelegate<User>(context);
    authServer = AuthServer(authStorage);
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router
        .route("/register")
        .link(() => RegisterController(context, authServer));

    router.route("/users/[:user]")
        .link(() => Authorizer.bearer(authServer))
        .link(() => UsersController(context));

    router
        .route('/state/new')
        .link(() => Authorizer.bearer(authServer))
        .link(() => NewStateController(context));

    router
        .route('/:state/status')
        .link(() => Authorizer.bearer(authServer))
        .link(() => StatusController(context));

    router
        .route('/status')
        .link(() => Authorizer.bearer(authServer))
        .link(() => StatusController(context));

    router
        .route('/:state/military/units/[:unit]')
        .link(() => Authorizer.bearer(authServer))
        .link(() => MilitaryController(context));

    router
        .route('/auth/token')
        .link(() => AuthController(authServer));

    return router;
  }
}