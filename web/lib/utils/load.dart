import 'dart:html';

import 'package:vue/vue.dart';

abstract class Loadable extends VueComponentBase {
  Future load();
}

@VueComponent(template: '<<')
class Load extends VueComponentBase {

  Load(): super();

  @data
  bool busy = true;

  @override
  void lifecycleMounted() {
    this.$parent.$ref('loadable').hidden = true;
    this.$parent.load().whenComplete(() {
      this.busy = false;
      this.$parent.$ref('loadable').hidden = false;
    });
    super.lifecycleCreated();
  }
}