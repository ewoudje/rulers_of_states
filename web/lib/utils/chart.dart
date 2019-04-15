import 'dart:html';

import 'package:chartjs/chartjs.dart';
import 'package:vue/vue.dart';

@VueComponent(template: '<canvas ref="chart" :width="width" :height="height"></canvas>')
class CChart extends VueComponentBase {
  @ref
  CanvasElement chart;

  @prop
  @data
  int width = 100;

  @prop
  @data
  int height = 100;

  void updateChart(ChartConfiguration config) {
    Chart(chart.context2D, config);
  }
}