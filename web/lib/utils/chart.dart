import 'dart:html';


import 'package:chartjs/chartjs.dart' as chartjs;
import 'package:vue/vue.dart';

export 'package:chartjs/chartjs.dart' hide Chart;

@VueComponent(template: '<canvas ref="chart" :width="width" :height="height"></canvas>')
class Chart extends VueComponentBase {
  @ref
  CanvasElement chart;

  @prop
  @data
  int width = 100;

  @prop
  @data
  int height = 100;

  void updateChart(chartjs.ChartConfiguration config) {
    chartjs.Chart(chart.context2D, config);
  }
}