import 'dart:async';

import 'package:ros_web/utils/load.dart';
import 'package:vue/vue.dart';
import 'package:vue/plugins/vue_router.dart';

import 'package:ros_web/gamepart.dart';
import 'package:ros_web/gameparts/status.dart';
import 'package:ros_web/topbar.dart';
import 'package:vdmc/vdmc.dart';


@VueApp(el: '#app', components: [Topbar, MTypography, MTopAppBarFixedAdjust])
class App extends VueAppBase {}


App app;


Future main() async {
  final router = VueRouter(routes: [
    VueRoute(path: '/game', component: GamePartComponent(), children: [
      VueRoute(path: 'status', component: StatusPart()),
    ]),
  ], /*mode: VueRouterMode.history*/);

  app = App();

  app.create(options: [router]);
}