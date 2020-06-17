import 'package:datav8/blocs/models/models.dart';
import 'package:flutter/material.dart';

class ChannelCardConfiguration {
  ChannelNumber channel;
  String name,latestChannelValue;
  bool monitoringActive;
  Color chartColor;
  List<Color> chartColorGradient;
  List<dynamic> data;
  List<EventNode> events;
  ChannelCardConfiguration({this.name, this.channel, this.data, this.chartColor, this.latestChannelValue, this.monitoringActive, this.chartColorGradient, this.events});
}