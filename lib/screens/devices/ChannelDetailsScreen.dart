import 'package:datav8/components/card/ChannelCardConfiguration.dart';
import 'package:datav8/components/charts/Chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class ChannelDetailsScreen extends StatefulWidget {
  final ChannelCardConfiguration item;

  ChannelDetailsScreen({Key key, this.item}) : super(key: key);

  _ChannelDetailsScreenState createState() => _ChannelDetailsScreenState();
}

class _ChannelDetailsScreenState extends State<ChannelDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    var grayText = TextStyle(
        color: Theme.of(context).hintColor,
        fontFamily: "Popins",
        fontSize: 12.5);

    var styleValueChart = TextStyle(
        color: Theme.of(context).hintColor,
        fontFamily: "Popins",
        fontSize: 11.5);

    return Scaffold(
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

                SizedBox(height: 30),

                Chart(data: widget.item),

                SizedBox(height: 20.0),

              ]
            )
          )
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

  Widget _sparkLineGrafic() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: new Sparkline(
        data: widget.item.data,
        lineWidth: 0.3,
        fillMode: FillMode.below,
        lineColor: widget.item.chartColor,
        fillGradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: widget.item.chartColorGradient,
        ),
      ),
    );
  }

  Widget _horizontalValueGrafik() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "50.0000",
            style: TextStyle(
                color: Theme.of(context).hintColor,
                fontFamily: "Popins",
                fontSize: 11.5),
          ),
          Text(
            "40.0000",
            style: TextStyle(
                color: Theme.of(context).hintColor,
                fontFamily: "Popins",
                fontSize: 11.5),
          ),
          Text(
            "30.0000",
            style: TextStyle(
                color: Theme.of(context).hintColor,
                fontFamily: "Popins",
                fontSize: 11.5),
          ),
          Text(
            "20.0000",
            style: TextStyle(
                color: Theme.of(context).hintColor,
                fontFamily: "Popins",
                fontSize: 11.5),
          ),
          Text(
            "10.0000",
            style: TextStyle(
                color: Theme.of(context).hintColor,
                fontFamily: "Popins",
                fontSize: 11.5),
          ),
          Text(
            "0.0000",
            style: TextStyle(
                color: Theme.of(context).hintColor,
                fontFamily: "Popins",
                fontSize: 11.5),
          ),
        ],
      ),
    );
  }




  Widget _verticalValueGrafik() {
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
              Stack(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 70.0),
                    child: _line()),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "5000.0000",
                      style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontFamily: "Popins",
                          fontSize: 11.5),
                    ))
              ]),
              Stack(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 70.0),
                    child: _line()),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "4000.0000",
                      style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontFamily: "Popins",
                          fontSize: 11.5),
                    ))
              ]),
              Stack(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 70.0),
                    child: _line()),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "3000.0000",
                      style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontFamily: "Popins",
                          fontSize: 11.5),
                    ))
              ]),
              Stack(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 70.0),
                    child: _line()),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "2000.0000",
                      style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontFamily: "Popins",
                          fontSize: 11.5),
                    ))
              ]),
              Stack(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 70.0),
                    child: _line()),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "1000.0000",
                      style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontFamily: "Popins",
                          fontSize: 11.5),
                    ))
              ]),
              Stack(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 30.0),
                    child: _line()),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "0.0000",
                      style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontFamily: "Popins",
                          fontSize: 11.5),
                    ))
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _line() {
    return Container(
      height: 0.2,
      width: double.infinity,
      color: Theme.of(context).hintColor,
    );
  }
}