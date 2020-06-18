import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/components/card/ChannelCardConfiguration.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  final ChannelCardConfiguration data;

  const Chart({Key key, this.data}) : super(key: key);
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  bool _enableChannel1, _enableChannel2, _enableChannel3, _enableChannel4, _enableChannel5;

  @override
  void initState() {
    _enableChannel1 = false;
    _enableChannel2 = false;
    _enableChannel3 = false;
    _enableChannel4 = false;
    _enableChannel5 = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color hintColor = Theme.of(context).hintColor;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 300.0,
          child: SfCartesianChart(
            zoomPanBehavior: ZoomPanBehavior(
                zoomMode: ZoomMode.x,
                enablePinching: true,
                enablePanning: true
            ),
            crosshairBehavior: CrosshairBehavior(
                shouldAlwaysShow: true,
                enable: true,
                activationMode: ActivationMode.longPress
            ),
            primaryXAxis: DateTimeAxis(
                enableAutoIntervalOnZooming: true,
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(color: hintColor),
                axisLine: AxisLine(width: 0)
            ),
            primaryYAxis: NumericAxis(
                numberFormat: NumberFormat('###00.00'),
                majorGridLines: MajorGridLines(color: hintColor),
                majorTickLines: MajorTickLines(width: 0),
                axisLine: AxisLine(width: 0)
            ),
            plotAreaBorderWidth: 0,
            series: <ChartSeries>[                                                // ChartData
              if((widget.data.channel == ChannelNumber.CHANNEL1) || _enableChannel1) LineSeries<EventNode, DateTime>(dataSource: widget.data.events, yValueMapper: (EventNode event, _) => event.ch1, xValueMapper: (EventNode event, _) => event.deviceTimeDate),
              if((widget.data.channel == ChannelNumber.CHANNEL2) || _enableChannel2) LineSeries<EventNode, DateTime>(dataSource: widget.data.events, yValueMapper: (EventNode event, _) => event.ch2, xValueMapper: (EventNode event, _) => event.deviceTimeDate),
              if((widget.data.channel == ChannelNumber.CHANNEL3) || _enableChannel3) LineSeries<EventNode, DateTime>(dataSource: widget.data.events, yValueMapper: (EventNode event, _) => event.ch3, xValueMapper: (EventNode event, _) => event.deviceTimeDate),
              if((widget.data.channel == ChannelNumber.CHANNEL4) || _enableChannel4) LineSeries<EventNode, DateTime>(dataSource: widget.data.events, yValueMapper: (EventNode event, _) => event.ch4, xValueMapper: (EventNode event, _) => event.deviceTimeDate),
              if((widget.data.channel == ChannelNumber.CHANNEL5) || _enableChannel5) LineSeries<EventNode, DateTime>(dataSource: widget.data.events, yValueMapper: (EventNode event, _) => event.ch5, xValueMapper: (EventNode event, _) => event.deviceTimeDate)
            ],
          ),
        )
      ]
    );
  }
}



