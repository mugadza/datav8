import 'dart:async';

import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/components/card/ChannelCardConfiguration.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EventListView extends StatefulWidget {
  final ChannelCardConfiguration channelCardConfiguration;
  final bool loadImage;
  EventListView({Key key, this.channelCardConfiguration, this.loadImage}) : super(key: key);

  _EventListViewState createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Theme.of(context).canvasColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 7.0, bottom: 7.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(
                    width: 100.0,
                    child: Text(
                      "Date time",
                      style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor, fontFamily: "Popins"),
                    )
                  ),
                ),
                Container(
                  width: 80.0,
                  child: Text(
                    "Reading",
                    style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor, fontFamily: "Popins"),
                  )
                ),
                Container(
                  width: 80.0,
                  child: Text(
                    "Error",
                    style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor, fontFamily: "Popins"),
                  )
                ),
              ],
            ),
          ),
        ),

        ///
        /// Event rows
        ///
        widget.loadImage ? _loadingImageAnimation(context) : _imageLoaded(context),
      ],
    );
  }


  Widget listPriceGainers(double reading, EventNode eventNode, BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 20.0),
      child: InkWell(
        onTap: () {
          // ------ tab ------
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 140.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    eventNode.deviceTimeDate.hour.toString()+"0:0"+eventNode.deviceTimeDate.minute.toString()+":0"+eventNode.deviceTimeDate.second.toString(),
                    style: TextStyle(fontFamily: "Popins", fontSize: 13),
                  ),
                  Text(
                    " / "+eventNode.deviceTimeDate.day.toString()+" Apr "+eventNode.deviceTimeDate.year.toString(),
                    style: TextStyle(fontFamily: "Popins", fontSize: 8, color: Theme.of(ctx).hintColor),
                  )
                ],
              ),
            ),
            Container(
              width: 80.0,
              child: Text(
                reading.toStringAsFixed(4),
                style: TextStyle(fontFamily: "Popins", fontSize: 13.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                  width: 80.0,
                  height: 35.0,
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(2.0)), color: Color(0xFF00C087)),
                  child: Center(
                    child: Text(
                    "Error",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  )
                )
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget loadingListPriceGainers(EventNode eventNode, BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 17.0),
      child: Shimmer.fromColors(
        baseColor: Color(0xFF3B4659),
        highlightColor: Color(0xFF606B78),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 70.0,
              height: 20.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Theme.of(ctx).hintColor,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Theme.of(ctx).hintColor,
                ),
                height: 20.0,
                width: 70.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Theme.of(ctx).hintColor,
                ),
                height: 20.0,
                width: 115.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                color: Theme.of(ctx).hintColor,
                width: 80.0,
                height: 35.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  ///
  /// Calling imageLoading animation for set a grid layout
  ///
  Widget _loadingImageAnimation(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: widget.channelCardConfiguration.events.length,
        itemBuilder: (ctx, i) {
          return loadingListPriceGainers(widget.channelCardConfiguration.events[i], ctx);
        },
      ),
    );
  }

  ///
  ///
  /// Calling ImageLoaded animation for set a grid layout
  ///
  ///
  Widget _imageLoaded(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: widget.channelCardConfiguration.events.length,
        itemBuilder: (ctx, i) {
          return listPriceGainers(widget.channelCardConfiguration.data[i], widget.channelCardConfiguration.events[i], ctx);
        },
      ),
    );
  }
}