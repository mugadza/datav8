import 'package:datav8/blocs/models/devices/ChannelNumber.dart';
import 'package:datav8/components/card/ChannelCardConfiguration.dart';
import 'package:datav8/components/charts/LineChart.dart';
import 'package:datav8/screens/devices/ChannelsFloatingButtons.dart';
import 'package:flutter/material.dart';

class ChannelDetailsScreen extends StatefulWidget {
  final ChannelCardConfiguration currentChannelConfiguration;
  final List<ChannelCardConfiguration> otherChannelsConfigurations;

  ChannelDetailsScreen({Key key, this.currentChannelConfiguration, this.otherChannelsConfigurations}) : super(key: key);

  _ChannelDetailsScreenState createState() => _ChannelDetailsScreenState();
}

enum Status{
  NONE, RED, GREEN
}

class _ChannelDetailsScreenState extends State<ChannelDetailsScreen> {
  List<bool> enabledChannels;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    enabledChannels = [false, false, false, false, false];
    enabledChannels[ChannelNumber.values.indexOf(widget.currentChannelConfiguration.channel)] = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    Color hintColor = Theme.of(context).hintColor;
    BorderSide border = BorderSide(color: hintColor, width: 1);
    TextStyle titleInfoStyle = TextStyle(color: hintColor, fontFamily: "Popins", fontSize: 11.5);
    TextStyle valueInfoStyle = TextStyle(color: hintColor, fontFamily: "Popins", fontSize: 11.5, fontWeight: FontWeight.w800);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ///
      /// Appbar
      ///
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(widget.currentChannelConfiguration.name,
          style: TextStyle(color: Theme.of(context).textSelectionColor),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: hintColor,
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _channelSummaryHeader(hintColor),
                      SizedBox(height: 35),
                    ]
                  ),
                ),

                // -------------------------------------------------------------
                Container(
                  height: 300,
                  child: LineChart(
                    events: widget.currentChannelConfiguration.events,
                    configurations: <ChannelCardConfiguration>[widget.currentChannelConfiguration],
                    enabledChannels: enabledChannels,
                    verticalDivision: 7
                  ),
                ),
                // -------------------------------------------------------------

                SizedBox(height: 40.0),

                // -------------------------------------------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: query.size.width/2,
                      height: 90.0,
                      decoration: BoxDecoration(border: Border(top: border, bottom: border, right: border)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.currentChannelConfiguration.scaleFactor.toStringAsFixed(3), style: valueInfoStyle),
                          Text("SCALE FACTOR", style: titleInfoStyle),
                        ],
                      ),
                    ),
                    Container(
                      width: query.size.width/2,
                      height: 90.0,
                      decoration: BoxDecoration(border: Border(top: border, bottom: border)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.currentChannelConfiguration.zeroOffset.toStringAsFixed(3), style: valueInfoStyle),
                          Text("ZERO OFFSET", style: titleInfoStyle),
                        ],
                      ),
                    ),

                  ],
                ),
                // -------------------------------------------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: query.size.width/2,
                      height: 90.0,
                      decoration: BoxDecoration(border: Border(bottom: border, right: border)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.currentChannelConfiguration.lowerThreshold.toStringAsFixed(3), style: valueInfoStyle),
                          Text("LOWER THRESHOLD", style: titleInfoStyle),
                        ],
                      ),
                    ),

                    Container(
                      width: query.size.width/2,
                      height: 90.0,
                      decoration: BoxDecoration(border: Border(bottom: border)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.currentChannelConfiguration.upperThreshold.toStringAsFixed(3), style: valueInfoStyle),
                          Text("UPPER THRESHOLD", style: titleInfoStyle),
                        ],
                      ),
                    ),
                  ],
                ),
                // -------------------------------------------------------------
              ]
            )
          ),

        ]
      ),
      floatingActionButton: ChannelsFloatingButtons(),
    );
  }

  Widget _channelSummaryHeader(Color hintColor) {
    TextStyle style = TextStyle(color: hintColor, fontFamily: "Popins", fontSize: 11);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.currentChannelConfiguration.latestChannelValue, style: TextStyle(color: widget.currentChannelConfiguration.statusColor, fontSize: 33.0, fontFamily: "Sans", fontWeight: FontWeight.w700)),
            Text(widget.currentChannelConfiguration.unit, style: style),
            Text(widget.currentChannelConfiguration.sensorType.toUpperCase(), style: style),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Mask", style: style),
                SizedBox(width: 6.0),
                widget.currentChannelConfiguration.maskAlert ? _channelOnOffIndicator(Status.GREEN) : _channelOnOffIndicator(Status.NONE),
                SizedBox(width: 8.5),
                Text("Alert", style: style),
                SizedBox(width: 6.0),
                widget.currentChannelConfiguration.alertState ? _channelOnOffIndicator(Status.RED) : _channelOnOffIndicator(Status.GREEN),
                SizedBox(width: 8.5),
                Text("Monitor", style: style),
                SizedBox(width: 6.0),
                widget.currentChannelConfiguration.monitoringActive ? _channelOnOffIndicator(Status.GREEN) : _channelOnOffIndicator(Status.NONE),
              ],
            ),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            for(int i = 0; i < enabledChannels.length; ++i ) enabledChannels[i] ? _channelStatusIndicator("CH${i + 1}".padRight(3), widget.otherChannelsConfigurations[i].chartColor) : _channelStatusIndicator("CH${i + 1}", hintColor),
          ],
        ),
      ],
    );
  }

  Widget _channelOnOffIndicator(Status status){
    BoxDecoration decoration;

    switch(status){
      case Status.NONE:
        decoration = BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(50));
        break;
      case Status.RED:
        decoration = BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(color: Colors.redAccent.withAlpha(110), blurRadius: 5.0, spreadRadius: 3.0, offset: Offset(0.0, 2.0)),
            ]
        );
        break;
      case Status.GREEN:
        decoration = BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(color: Colors.greenAccent.withAlpha(70), blurRadius: 5.0, spreadRadius: 3.0, offset: Offset(0.0, 2.0)),
          ]
        );
        break;
    }

    return Container(height: 12.5, width: 12.5, decoration: decoration);
  }

  Widget _channelStatusIndicator(String channel, Color color){
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(channel, style: TextStyle(color: color, fontFamily: "Popins", fontSize: 11)),
        ),
        Container(color: color, height: 2.5, width: 50, margin: const EdgeInsets.only(bottom: 3))
      ],
    );
  }
}