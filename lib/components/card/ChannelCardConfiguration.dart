import 'package:flutter/material.dart';

class ChannelCardConfiguration {
  String name,latestChannelValue;
  bool monitoringActive;
  Color chartColor;
  List<Color> chartColorGradient;
  var data;
  ChannelCardConfiguration({this.name,this.data,this.chartColor,this.latestChannelValue,this.monitoringActive,this.chartColorGradient});
}