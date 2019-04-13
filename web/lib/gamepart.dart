import 'package:vue/vue.dart';
import 'package:vue/plugins/vue_router.dart';
import 'package:vdmc/vdmc.dart';

import 'navbar.dart';

@VueComponent(template: '<<', components: [GameNavbar, MLayoutGrid, MLayoutGridCell, MLayoutGridInner, MTopAppBarFixedAdjust])
class GamePartComponent extends VueComponentBase with VueRouterMixin {}