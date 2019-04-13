import 'package:vue/vue.dart';
import 'package:vdmc/vdmc.dart';

class TopbarEntry {
  final String icon;
  final String title;
  final String path;

  const TopbarEntry(this.icon, this.path, this.title);
}

bool loggedIn = true;

@VueComponent(template: '<<', components: [MTopAppBar, MIcon])
class Topbar extends VueComponentBase {

  @computed
  List<TopbarEntry> get entries => loggedIn ? const [
    TopbarEntry("account_circle", "/profile", "Profile"),
    TopbarEntry("exit_to_app", "/logout", "Log Out"),
  ] : const [
    TopbarEntry("exit_to_app", "/login", "Login"),
  ];
}