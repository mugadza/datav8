import 'dart:math' as Math;
import 'dart:ui';
import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/components/card/ChannelCardConfiguration.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class LineChart extends StatefulWidget {
  final List<EventNode> events;
  final List<bool> enabledChannels;
  final List<ChannelCardConfiguration> configurations;
  final int verticalDivision;

  const LineChart({Key key, this.events, this.enabledChannels, this.configurations, this.verticalDivision}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LineChartState();

}

class _LineChartState extends State<LineChart> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(
        enabledChannels: widget.enabledChannels,
        events: widget.events,
        configurations: widget.configurations,
        verticalDivision: widget.verticalDivision,
        majorGrid: MajorGrid(color: Theme.of(context).hintColor),
      ),
    );
  }
}

class LinePainter extends CustomPainter{
  final MajorGrid majorGrid;
  final List<EventNode> events;
  final List<ChannelCardConfiguration> configurations;
  final int verticalDivision;
  final List<bool> enabledChannels;

  LinePainter({this.enabledChannels, this.events, this.configurations, this.verticalDivision, this.majorGrid});

  @override
  void paint(Canvas canvas, Size size) {
    Tuple2<int, int> minMaxVerticalValues = _getVerticalMinAndMaxValues();

    // draw the horizontal lines
    _paintHorizontalGridLines(canvas, size, minMaxVerticalValues, verticalDivision);

    // draw the horizontal lines
    _paintDataLinePlot(canvas, size, minMaxVerticalValues);
  }

  @override
  bool shouldRepaint(LinePainter old) {
    return events != old.events ||
    enabledChannels != old.enabledChannels ||
    configurations != old.configurations ||
    verticalDivision != old.verticalDivision;
  }

  // -------------------------- Private method --------------------------------
  void _paintDataLinePlot(Canvas canvas, Size size, Tuple2<int, int> verticalMinMax){
    int length = events.length;
    if(length > 1){
      double lineWidth = 0.9;
      double width = size.width - lineWidth;
      double height = size.height - lineWidth;
      double xUnit = width/(length - 1);
      double yUnit = height/(verticalMinMax.item2 - verticalMinMax.item1);

      print("----------------W: $width");
      print("----------------H: $height");

      final bool sharpCorners = true;

      final Paint linePlotPainter = Paint()
        ..strokeWidth = lineWidth
        ..color = configurations[0].chartColor
        ..strokeCap = StrokeCap.round
        ..strokeJoin = sharpCorners ? StrokeJoin.miter : StrokeJoin.round
        ..style = PaintingStyle.stroke;

      Offset startCh1, startCh2, startCh3, startCh4, startCh5;
      if(enabledChannels[0]) startCh1 = Offset(lineWidth / 2, height - (events[0].ch1 - verticalMinMax.item1) * yUnit + lineWidth / 2);
      if(enabledChannels[1]) startCh2 = Offset(lineWidth / 2, height - (events[0].ch2 - verticalMinMax.item1) * yUnit + lineWidth / 2);
      if(enabledChannels[2]) startCh3 = Offset(lineWidth / 2, height - (events[0].ch3 - verticalMinMax.item1) * yUnit + lineWidth / 2);
      if(enabledChannels[3]) startCh4 = Offset(lineWidth / 2, height - (events[0].ch4 - verticalMinMax.item1) * yUnit + lineWidth / 2);
      if(enabledChannels[4]) startCh5 = Offset(lineWidth / 2, height - (events[0].ch5 - verticalMinMax.item1) * yUnit + lineWidth / 2);


      Offset endCh1, endCh2, endCh3, endCh4, endCh5;
      for(int i = 1; i < length; i++) {
        double x = i * xUnit + lineWidth / 2;

        EventNode current = events[i];
        if(enabledChannels[0]){
          double y = height - (current.ch1 - verticalMinMax.item1) * yUnit + lineWidth / 2;
          endCh1 = Offset(x, y);
          canvas.drawLine(startCh1, endCh1, linePlotPainter);

          startCh1 = endCh1;
        }
        if(enabledChannels[1]){
          double y = height - (current.ch2 - verticalMinMax.item1) * yUnit + lineWidth / 2;
          endCh2 = Offset(x, y);
          canvas.drawLine(startCh2, endCh2, linePlotPainter);

          startCh2 = endCh2;
        }
        if(enabledChannels[2]){
          double y = height - (current.ch3 - verticalMinMax.item1) * yUnit + lineWidth / 2;
          endCh3 = Offset(x, y);
          canvas.drawLine(startCh3, endCh3, linePlotPainter);

          startCh3 = endCh3;
        }
        if(enabledChannels[3]){
          double y = height - (current.ch4 - verticalMinMax.item1) * yUnit + lineWidth / 2;
          endCh4 = Offset(x, y);
          canvas.drawLine(startCh4, endCh4, linePlotPainter);

          startCh4 = endCh4;
        }
        if(enabledChannels[4]){
          double y = height - (current.ch5 - verticalMinMax.item1) * yUnit + lineWidth / 2;
          endCh5 = Offset(x, y);
          canvas.drawLine(startCh5, endCh5, linePlotPainter);

          startCh5 = endCh5;
        }
      }
    }
  }

  void _paintHorizontalGridLines(Canvas canvas, Size size, Tuple2<int, int> verticalMinMax, int verticalDivision){
    final Paint horizontalGridLinesPainter = Paint()..color = majorGrid.color;

    int maxLabelValue = verticalMinMax.item2;
    int minLabelValue = verticalMinMax.item1;

    double paintIncrement = size.height/verticalDivision;
    double labelIncrement = (maxLabelValue - minLabelValue)/(verticalDivision - 1);

    TextStyle style = TextStyle(color: majorGrid.color, fontFamily: "Popins", fontSize: 11.5);

    double y = size.height;
    double value = minLabelValue/1;
    for (int i = 0; i <= verticalDivision; i++) {
      Offset start = Offset(0, y);
      Offset end = Offset(size.width  - 50, y);
      canvas.drawLine(start, end, horizontalGridLinesPainter);

      TextPainter labelPainter = TextPainter(
        maxLines: 1,
        text: TextSpan(text: value.toStringAsFixed(3), style: style),
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr
      )..layout(minWidth: 60);

      double labelPaddingBottom = labelPainter.preferredLineHeight/2;

      labelPainter.paint(canvas, Offset(end.dx + 5, end.dy - labelPaddingBottom));
      value += labelIncrement;
      y -= paintIncrement;
    }
  }

  Tuple2<int, int> _getVerticalMinAndMaxValues() {
    EventNode minEventNode = _getMinimumEventNode();
    EventNode maxEventNode = _getMaximumEventNode();

    int maxLineValue = maxEventNode.getMaximum(enabledChannels[0], enabledChannels[1], enabledChannels[2], enabledChannels[3], enabledChannels[4]).ceil();
    int minLineValue = minEventNode.getMinimum(enabledChannels[0], enabledChannels[1], enabledChannels[2], enabledChannels[3], enabledChannels[4]).floor();
    int toSubtract = (verticalDivision - 1) - ((maxLineValue - minLineValue) % (verticalDivision - 1));
    toSubtract = (toSubtract == verticalDivision - 1) ? 0 : toSubtract;

    return Tuple2(minLineValue, maxLineValue);
  }

  EventNode _getMinimumEventNode(){
    return events.reduce((current, next) {
      double currentNodeMinimum = current.getMinimum(enabledChannels[0], enabledChannels[1], enabledChannels[2], enabledChannels[3], enabledChannels[4]);
      double nextNodeMinimum = next.getMinimum(enabledChannels[0], enabledChannels[1], enabledChannels[2], enabledChannels[3], enabledChannels[4]);

      return (currentNodeMinimum < nextNodeMinimum) ? current : next;
    });
  }

  EventNode _getMaximumEventNode(){
    return events.reduce((current, next) {
      double currentNodeMaximum = current.getMaximum(enabledChannels[0], enabledChannels[1], enabledChannels[2], enabledChannels[3], enabledChannels[4]);
      double nextNodeMaximum = next.getMaximum(enabledChannels[0], enabledChannels[1], enabledChannels[2], enabledChannels[3], enabledChannels[4]);

      return (currentNodeMaximum > nextNodeMaximum) ? current : next;
    });
  }
}

class MajorGrid {
  final Color color;

  MajorGrid({this.color});
}

