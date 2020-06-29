import 'package:datav8/blocs/models/models.dart';
import 'package:flutter/material.dart';

class ChannelCardConfiguration {
  final ChannelNumber channel;
  final String name, latestChannelValue, sensorType, unit;
  final double scaleFactor, zeroOffset, upperThreshold, lowerThreshold;
  final bool monitoringActive;
  final bool alertState;
  final bool maskAlert;
  final Color chartColor;
  final Color statusColor;
  final List<Color> chartColorGradient;
  final List<dynamic> data;
  final List<EventNode> events;
  ChannelCardConfiguration({this.statusColor, this.upperThreshold, this.lowerThreshold, this.unit, this.sensorType, this.scaleFactor, this.zeroOffset, this.alertState, this.maskAlert, this.name, this.channel, this.data, this.chartColor, this.latestChannelValue, this.monitoringActive, this.chartColorGradient, this.events});
}