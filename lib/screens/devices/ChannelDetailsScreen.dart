import 'package:datav8/blocs/models/devices/ChannelNumber.dart';
import 'package:datav8/components/card/ChannelCardConfiguration.dart';
import 'package:datav8/components/charts/LineChart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class ChannelDetailsScreen extends StatefulWidget {
  final ChannelCardConfiguration item;

  ChannelDetailsScreen({Key key, this.item}) : super(key: key);

  _ChannelDetailsScreenState createState() => _ChannelDetailsScreenState();
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

                SizedBox(
                  height: 20.0,
                ),

              ]
            )
          ),
          _modalBottomSheetChannels()
        ]
      )
    );
  }

  Widget _channelSummaryHeader() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              widget.item.latestChannelValue,
              style: TextStyle(
                  color: widget.item.chartColor,
                  fontSize: 36.0,
                  fontFamily: "Sans",
                  fontWeight: FontWeight.w700),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        "High",
                        style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontFamily: "Popins",
                            fontSize: 11.5),
                      ),
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text("60.8950")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        "Low",
                        style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontFamily: "Popins",
                            fontSize: 11.5),
                      ),
                    ),
                    Text("60.0300")
                  ],
                )
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "\$60.57000",
                  style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontFamily: "Popins",
                      fontSize: 11.5),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    widget.item.latestChannelValue,
                    style: TextStyle(color: widget.item.chartColor),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 31.0),
                  child: Text(
                    "24h Vol",
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontFamily: "Popins",
                        fontSize: 11.5),
                  ),
                ),
                Text("906.8")
              ],
            )
          ],
        ),
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