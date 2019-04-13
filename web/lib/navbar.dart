import 'dart:html';

import 'package:vue/vue.dart';
import 'package:vdmc/vdmc.dart';

class GameNavbarEntry {
  final String icon;

  final String title;
  final String path;

  const GameNavbarEntry(this.icon, this.path, this.title);
}

@VueComponent(template: '<<', components: [MDrawerPermanent, MDrawerContent, MList, MListItem, MIcon])
class GameNavbar extends VueComponentBase {
  @data
  List<GameNavbarEntry> entries = const [
    GameNavbarEntry("account_balance", "/game/status", "Status"),
    GameNavbarEntry("mail", "/game/log", "Log"),
    GameNavbarEntry("euro_symbol", "/game/economy", "Economy"),
    GameNavbarEntry("assignment", "/game/laws", "Laws"),
    GameNavbarEntry("poll", "/game/polls", "Polls"),
  ];

  @method
  bool isCurrentPage(GameNavbarEntry page) => window.location.href.endsWith(page.path);
}