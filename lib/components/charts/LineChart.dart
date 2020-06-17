import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/components/card/ChannelCardConfiguration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:tuple/tuple.dart';

class LineChart extends StatelessWidget {
  final ChannelNumber currentChannel;
  final List<EventNode> events;
  final List<ChannelCardConfiguration> configurations;
  final int verticalDivision;
  const LineChart({Key key, this.events, this.configurations, this.currentChannel, this.verticalDivision = 6}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 300.0,
          child: Stack(
            children: <Widget>[
              ///
              /// building the vertical y-axis values
              ///
              _buildYAxisTimeline(context),

              ///
              /// building the vertical x-axis values
              ///
              _plotLineGraph(context),
            ],
          ),
        ),

        ///
        /// Calling horizontal value grafik
        ///
//        _horizontalValueGrafik(),
      ],
    );
  }


  Widget _buildYAxisTimeline(BuildContext context) {
    Color hintColor = Theme.of(context).hintColor;
    Tuple2<int, int> minMaxValues = _getVerticalMinAndMaxValues();

    double divisions = (minMaxValues.item2 - minMaxValues.item1)/(verticalDivision - 1);
    print("-------------------------- MIN item1 --- > ${minMaxValues.item1}");
    print("-------------------------- MAX item2 --- > ${minMaxValues.item2}");
    print("-------------------------- division  --- > $divisions");

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              for (int i = 0; i < verticalDivision; i++) _verticalLineAndLabel(minMaxValues.item2 - (divisions*i), hintColor)
            ],
          ),
        ),
      ),
    );
  }


  Widget _plotLineGraph(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Sparkline(
        data: _getCurrentChannelData(),
        lineWidth: 0.3,
        fillMode: FillMode.below,
        lineColor: configurations.first.chartColor, // TODO : fix this hardcoding for superposed graphs
        fillGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: configurations.first.chartColorGradient,
        ),
      ),
    );
  }

  List<double> _getCurrentChannelData(){
    switch(currentChannel){
      case ChannelNumber.CHANNEL1:
        return events.map((event) => event.ch1).toList();
        break;
      case ChannelNumber.CHANNEL2:
        return events.map((event) => event.ch2).toList();
        break;
      case ChannelNumber.CHANNEL3:
        return events.map((event) => event.ch3).toList();
        break;
      case ChannelNumber.CHANNEL4:
        return events.map((event) => event.ch4).toList();
        break;
      case ChannelNumber.CHANNEL5:
        return events.map((event) => event.ch5).toList();
        break;
    }
    return [];
  }

  Widget _verticalLineAndLabel(double value, Color hintColor){
    return Stack(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 60.0),
            child: _line(hintColor)
        ),
        Align(
            alignment: Alignment.centerRight,
            child: Text(value.toStringAsFixed(3), style: TextStyle(color: hintColor, fontFamily: "Popins", fontSize: 11.5))
        )
      ]
    );
  }

  Tuple2<int, int> _getVerticalMinAndMaxValues() {
    EventNode minEventNode = _getMinimumEventNode();
    EventNode maxEventNode = _getMaximumEventNode();

    List<bool> enabledChannels = _getChannelsEnabled();

    int maxLineValue = maxEventNode.getMaximum(enabledChannels[0], enabledChannels[1], enabledChannels[2], enabledChannels[3], enabledChannels[4]).ceil();
    int minLineValue = minEventNode.getMinimum(enabledChannels[0], enabledChannels[1], enabledChannels[2], enabledChannels[3], enabledChannels[4]).floor();
    int toSubtract = (verticalDivision - 1) - ((maxLineValue - minLineValue) % (verticalDivision - 1));
    toSubtract = (toSubtract == verticalDivision - 1) ? 0 : toSubtract;

    minLineValue -= toSubtract;

    print("-------------------------- MIN --- > $minLineValue");
    print("-------------------------- MAX --- > $maxLineValue");

    return Tuple2(minLineValue, maxLineValue);
  }

  List<bool> _getChannelsEnabled(){
    bool channel1 = false, channel2 = false, channel3 = false, channel4 = false, channel5 = false;

    for(ChannelCardConfiguration configuration in configurations){
      switch(configuration.channel){
        case ChannelNumber.CHANNEL1:
          channel1 = true;
          break;
        case ChannelNumber.CHANNEL2:
          channel2 = true;
          break;
        case ChannelNumber.CHANNEL3:
          channel3 = true;
          break;
        case ChannelNumber.CHANNEL4:
          channel4 = true;
          break;
        case ChannelNumber.CHANNEL5:
          channel5 = true;
          break;
      }
    }
    return [channel1, channel2, channel3, channel4, channel5];
  }

  EventNode _getMinimumEventNode(){
    List<bool> enabledChannels = _getChannelsEnabled();
    return events.reduce((value, element) {
      EventNode minEventNode = element;

      if (enabledChannels[0]){
        minEventNode = value.ch1 < element.ch1 ? ((value.ch1 < minEventNode.ch1) ? value : minEventNode) : ((element.ch1 < minEventNode.ch1) ? element : minEventNode);
      }
      if (enabledChannels[1]){
        minEventNode = value.ch2 < element.ch2 ? ((value.ch2 < minEventNode.ch2) ? value : minEventNode) : ((element.ch2 < minEventNode.ch2) ? element : minEventNode);
      }
      if (enabledChannels[2]){
        minEventNode = value.ch3 < element.ch3 ? ((value.ch3 < minEventNode.ch3) ? value : minEventNode) : ((element.ch3 < minEventNode.ch3) ? element : minEventNode);
      }
      if (enabledChannels[3]){
        minEventNode = value.ch4 < element.ch4 ? ((value.ch4 < minEventNode.ch4) ? value : minEventNode) : ((element.ch4 < minEventNode.ch4) ? element : minEventNode);
      }
      if (enabledChannels[4]){
        minEventNode = value.ch5 < element.ch5 ? ((value.ch5 < minEventNode.ch5) ? value : minEventNode) : ((element.ch5 < minEventNode.ch5) ? element : minEventNode);
      }
      return minEventNode;
    });
  }

  EventNode _getMaximumEventNode(){
    List<bool> enabledChannels = _getChannelsEnabled();
    return events.reduce((value, element) {
      EventNode maxEventNode = element;
      if (enabledChannels[0]){
        maxEventNode = value.ch1 > element.ch1 ? ((value.ch1 > maxEventNode.ch1) ? value : maxEventNode) : ((element.ch1 > maxEventNode.ch1) ? element : maxEventNode);
      }
      if (enabledChannels[1]){
        maxEventNode = value.ch2 > element.ch2 ? ((value.ch2 > maxEventNode.ch2) ? value : maxEventNode) : ((element.ch2 > maxEventNode.ch2) ? element : maxEventNode);
      }
      if (enabledChannels[2]){
        maxEventNode = value.ch3 > element.ch3 ? ((value.ch3 > maxEventNode.ch3) ? value : maxEventNode) : ((element.ch3 > maxEventNode.ch3) ? element : maxEventNode);
      }
      if (enabledChannels[3]){
        maxEventNode = value.ch4 > element.ch4 ? ((value.ch4 > maxEventNode.ch4) ? value : maxEventNode) : ((element.ch4 > maxEventNode.ch4) ? element : maxEventNode);
      }
      if (enabledChannels[4]){
        maxEventNode = value.ch5 > element.ch5 ? ((value.ch5 > maxEventNode.ch5) ? value : maxEventNode) : ((element.ch5 > maxEventNode.ch5) ? element : maxEventNode);
      }
      return maxEventNode;
    });
  }

  Widget _line(Color lineColor) {
    return Container(
      height: 0.2,
      width: double.infinity,
      color: lineColor,
    );
  }
}