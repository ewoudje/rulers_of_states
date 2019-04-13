import 'package:ros_server/model/user.dart';
import 'package:ros_server/ros_server.dart';
import 'package:aqueduct_test/aqueduct_test.dart';

export 'package:ros_server/ros_server.dart';
export 'package:aqueduct_test/aqueduct_test.dart';
export 'package:test/test.dart';

class Harness extends TestHarness<ServerChannel> with TestHarnessAuthMixin<ServerChannel>, TestHarnessORMMixin {

  Agent publicAgent;

  @override
  Future onSetUp() async {
    await resetData();

    publicAgent = await addClient("com.aqueduct.public");
  }

  Future<Agent> registerUser(User user, {Agent withClient}) async {
    withClient ??= publicAgent;

    final req = withClient.request("/register")
      ..body = user;
    await req.post();

    return loginUser(withClient, user.username, user.password);
  }

  @override
  AuthServer get authServer => channel.authServer;

  @override
  ManagedContext get context => channel.context;
}
