import 'package:datav8/blocs/models/devices/ChannelNumber.dart';
import 'package:datav8/components/card/ChannelCardConfiguration.dart';
import 'package:datav8/components/charts/LineChart.dart';
import 'package:flutter/material.dart';

class ChannelDetailsScreen extends StatefulWidget {
  final ChannelCardConfiguration item;

  ChannelDetailsScreen({Key key, this.item}) : super(key: key);

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
    enabledChannels[ChannelNumber.values.indexOf(widget.item.channel)] = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    BorderSide border = BorderSide(color: Theme.of(context).hintColor, width: 1);
    TextStyle titleInfoStyle = TextStyle(color: Theme.of(context).hintColor, fontFamily: "Popins", fontSize: 11.5);
    TextStyle valueInfoStyle = TextStyle(color: Theme.of(context).hintColor, fontFamily: "Popins", fontSize: 11.5, fontWeight: FontWeight.w800);
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
        title: Text(widget.item.name,
          style: TextStyle(color: Theme.of(context).textSelectionColor),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Theme.of(context).hintColor,
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
                      _channelSummaryHeader(),
                      SizedBox(height: 35),
                    ]
                  ),
                ),

                // -------------------------------------------------------------
                Container(
                  height: 300,
                  child: LineChart(
                    events: widget.item.events,
                    configurations: <ChannelCardConfiguration>[widget.item],
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
                          Text("12.6", style: valueInfoStyle),
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
                          Text("12.6", style: valueInfoStyle),
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
                          Text("12.6", style: valueInfoStyle),
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
                          Text("12.6", style: valueInfoStyle),
                          Text("UPPER THRESHOLD", style: titleInfoStyle),
                        ],
                      ),
                    ),


                  ],
                )
                // -------------------------------------------------------------

              ]
            )
          ),
          _modalBottomSheetChannels()
        ]
      )
    );
  }

  Widget _channelSummaryHeader() {
    TextStyle style = TextStyle(color: Theme.of(context).hintColor, fontFamily: "Popins", fontSize: 11);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.item.latestChannelValue, style: TextStyle(color: widget.item.chartColor, fontSize: 33.0, fontFamily: "Sans", fontWeight: FontWeight.w700)),
            Text("Temperature (°C)", style: style),
            Text("PT1000", style: style),
//            Text("Mask    Alert    Monitor", style: style),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Mask", style: style),
                SizedBox(width: 6.0),
                _channelOnOffIndicator(Status.NONE),
                SizedBox(width: 8.5),
                Text("Alert", style: style),
                SizedBox(width: 6.0),
                _channelOnOffIndicator(Status.GREEN),
                SizedBox(width: 8.5),
                Text("Monitor", style: style),
                SizedBox(width: 6.0),
                _channelOnOffIndicator(Status.RED),
              ],
            ),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _channelStatusIndicator("CH1 "),
            _channelStatusIndicator("CH2"),
            _channelStatusIndicator("CH3"),
            _channelStatusIndicator("CH4"),
            _channelStatusIndicator("CH5"),
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

    return Container(height: 15, width: 15, decoration: decoration);
  }

  Widget _channelStatusIndicator(String channel){
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(channel, style: TextStyle(color: Theme.of(context).hintColor, fontFamily: "Popins", fontSize: 11)),
        ),
        Container(color: Theme.of(context).hintColor, height: 2.5, width: 50, margin: const EdgeInsets.only(bottom: 3))
      ],
    );
  }

  Widget _channelIndicator(bool status, int channel){
    return InkWell(
      onTap: () {
        if(widget.item.channel.index != channel){
          setState(() {
            enabledChannels[channel] = !enabledChannels[channel];
          });
        }
      },
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 4),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: 45.0,
                width: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    tileMode: TileMode.repeated,
                    colors: [Color(0xFF15EDED), Color(0xFF029CF5)]
                  )
                ),
              ),
              Container(
                height: 38.0,
                width: 38.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  border: Border.all(color: Color(0xFF141C35), width: 1.5),
                  color: (status) ? Colors.transparent : Theme.of(context).scaffoldBackgroundColor
                ),
              )
            ]
          ),
        ),

        Text("CH${channel + 1}", style: TextStyle(fontFamily: "Popins", fontSize: 11.0))
      ]),
    );
  }

  Widget _modalBottomSheetChannels() {
    return Container(
      height: 80.0,
      color: Color(0xFF141C35),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            for(int channel = 0; channel < enabledChannels.length; ++channel) _channelIndicator(enabledChannels[channel], channel)
          ],
        ),
      ),
    );
  }

}