import 'dart:async';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/components/card/ChannelCard.dart';
import 'package:datav8/components/card/ChannelCardConfiguration.dart';
import 'package:datav8/components/card/ChannelLoadingCard.dart';
import 'package:datav8/components/components.dart';
import 'package:datav8/components/events/EventListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rxdart/rxdart.dart';

class DeviceScreen extends StatefulWidget {
  final DeviceNode device;
  final bool enableBackButton;
  final bool loadCard;
  DeviceScreen({Key key, this.device, this.enableBackButton = false, this.loadCard}) : super(key: key);

  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  List<ChannelCardConfiguration> listChannelCardConfiguration;
  List<Tab> listChannelTabHeading;
  List<EventListView> listChannelEventList;
  StreamController<bool> _loadCardStreamController;

  @override
  void initState() {
    _loadCardStreamController = BehaviorSubject.seeded(true);
    super.initState();
  }

  @override
  void dispose() {
    _loadCardStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _loadCardStreamController.sink.add(widget.loadCard);
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ///
                /// Header image slider
                /// 
                SizedBox(
                  height: 210.0,
                  width: double.infinity,
                  child: Carousel(
                    autoplay: false,
                    boxFit: BoxFit.cover,
                    dotColor: Colors.white.withOpacity(0.8),
                    dotSize: 5.5,
                    dotSpacing: 16.0,
                    dotBgColor: Colors.transparent,
                    showIndicator: true,
                    overlayShadow: true,
                    overlayShadowColors: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
                    overlayShadowSize: 0.25,
                    images: [
                      AssetImage("assets/image/banner/banner1.png"),
                      AssetImage("assets/image/banner/banner2.png"),
                      AssetImage("assets/image/banner/banner3.png"),
                      AssetImage("assets/image/banner/banner4.png"),
                    ],
                  ),
                ),

                SizedBox(height: 10.0),

                ///
                /// Device channel cards
                ///
                widget.loadCard ? _channelLoadingCardAnimation(context) : _channelCardGridLoaded(context),

                ///
                /// Channel events tab lists
                ///
                _channelEventTabLists(context)
              ],
            ),
          ),
          (widget.enableBackButton) ? Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ) 
          ) : Container(),
        ],
      ),
    );
  }

  Widget _emptyDeviceEvents(){
    return Column(
      children: <Widget>[
        SizedBox(height: 90.0),
        Opacity(
          opacity: 0.8,
          child: Image.asset("assets/image/icon/015-alert.png", height: 115.0)
        ),
        SizedBox(height: 30.0),
        (widget.device.unitName == null) ? Container() : Text(
          widget.device.unitName,
          style: TextStyle(fontFamily: "Popins", color: Colors.white24, fontSize: 17.0, fontWeight: FontWeight.bold),
        ),
        Text(
          "This Device has no events!",
          style: TextStyle(fontFamily: "Popins", color: Colors.white24, fontSize: 17.0),
        )
      ],
    );
  }

  Widget _channelEventTabLists(BuildContext context){
    return (listChannelCardConfiguration.isEmpty) ? Container() : Container(
      height: 1500.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: DefaultTabController(
              length: listChannelEventList.length,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(25.0), // here the desired height
                  child: AppBar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    elevation: 0.0,
                    centerTitle: true,
                    flexibleSpace: SafeArea(
                      child: TabBar(
                        isScrollable: true,
                        indicatorColor: ApplicationColorStyle.primaryColor,
                        labelColor: Theme.of(context).primaryColor,
                        unselectedLabelColor: Theme.of(context).textSelectionColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: listChannelTabHeading,
                      ),
                    ),
                    automaticallyImplyLeading: false,
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TabBarView(
                    children: listChannelEventList,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  ///
  /// Calling ImageLoaded animation for set a grid layout
  ///
  Widget _channelCardGridLoaded(BuildContext context) {
    _buildListChannelCardConfiguration();

    return (listChannelCardConfiguration.isEmpty) ? _emptyDeviceEvents() : StaggeredGridView.count(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      shrinkWrap: true,
      primary: false,
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 8.0,
      children: List.generate(
        listChannelCardConfiguration.length,
        (index) => ChannelCard(item: listChannelCardConfiguration[index]),
      ),
      staggeredTiles: List.generate(
        listChannelCardConfiguration.length, 
        (index) => StaggeredTile.extent((index.isEven && (index == listChannelCardConfiguration.length - 1)) ? 2 : 1, 110),
      ),
    );
  }

  ///
  /// Calling imageLoading animation for set a grid layout
  ///
  Widget _channelLoadingCardAnimation(BuildContext context) {
    _buildListChannelCardConfiguration();

    return StaggeredGridView.count(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      shrinkWrap: true,
      primary: false,
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 8.0,
      children: List.generate(
        listChannelCardConfiguration.length,
        (index) => ChannelCardLoading(listChannelCardConfiguration[index]),
      ),
      staggeredTiles: List.generate(
        listChannelCardConfiguration.length, 
        (index) => StaggeredTile.extent((index.isEven && (index == listChannelCardConfiguration.length - 1)) ? 2 : 1, 110)
      ),
    );
  }

  void _buildListChannelCardConfiguration(){
    listChannelCardConfiguration = [];
    listChannelTabHeading = [];
    listChannelEventList = [];

    if (widget.device == null){
      return;
    }

    if (widget.device.events.edges.isEmpty || widget.device == null){
      return;
    }

    EventNode firstNode = widget.device.events.edges.first.node;
    List<EventNode> events = widget.device.events.edges.map((nodeEdge) => nodeEdge.node).toList();

    if(widget.device.ch1On){
      listChannelTabHeading.add(_buildTabHeader("CH1"));
      Color cardColor = (widget.device.alertStateCh1) ? Colors.redAccent : Colors.greenAccent;
      ChannelCardConfiguration channelCardConfiguration = ChannelCardConfiguration(
        channel: ChannelNumber.CHANNEL1,
        name: widget.device.ch1Name,
        chartColor: cardColor,
        latestChannelValue: firstNode.ch1.toStringAsFixed(4),
        monitoringActive: widget.device.monitoringActiveCh1,
        chartColorGradient: [cardColor.withOpacity(0.2), cardColor.withOpacity(0.01)],
        data: widget.device.events.edges.map((nodeEdge) => nodeEdge.node.ch1).toList(),
        events: events
      );
      listChannelCardConfiguration.add(channelCardConfiguration);
      listChannelEventList.add(EventListView(channelCardConfiguration: channelCardConfiguration, loadImageSink: _loadCardStreamController.stream));
    }
    if(widget.device.ch2On){
      listChannelTabHeading.add(_buildTabHeader("CH2"));
      Color cardColor = (widget.device.alertStateCh2) ? Colors.redAccent : Colors.greenAccent;
      ChannelCardConfiguration channelCardConfiguration = ChannelCardConfiguration(
        channel: ChannelNumber.CHANNEL2,
        name: widget.device.ch2Name,
        chartColor: cardColor,
        latestChannelValue: firstNode.ch2.toStringAsFixed(4),
        monitoringActive: widget.device.monitoringActiveCh2,
        chartColorGradient: [cardColor.withOpacity(0.2), cardColor.withOpacity(0.01)],
        data: widget.device.events.edges.map((nodeEdge) => nodeEdge.node.ch2).toList(),
        events: events
      );
      listChannelCardConfiguration.add(channelCardConfiguration);
      listChannelEventList.add(EventListView(channelCardConfiguration: channelCardConfiguration, loadImageSink: _loadCardStreamController.stream));
    }
    if(widget.device.ch3On){
      listChannelTabHeading.add(_buildTabHeader("CH3"));
      Color cardColor = (widget.device.alertStateCh3) ? Colors.redAccent : Colors.greenAccent;
      ChannelCardConfiguration channelCardConfiguration = ChannelCardConfiguration(
        channel: ChannelNumber.CHANNEL3,
        name: widget.device.ch3Name,
        chartColor: cardColor,
        latestChannelValue: firstNode.ch3.toStringAsFixed(4),
        monitoringActive: widget.device.monitoringActiveCh3,
        chartColorGradient: [cardColor.withOpacity(0.2), cardColor.withOpacity(0.01)],
        data: widget.device.events.edges.map((nodeEdge) => nodeEdge.node.ch3).toList(),
        events: events
      );
      listChannelCardConfiguration.add(channelCardConfiguration);
      listChannelEventList.add(EventListView(channelCardConfiguration: channelCardConfiguration, loadImageSink: _loadCardStreamController.stream));
    }
    if(widget.device.ch4On){
      listChannelTabHeading.add(_buildTabHeader("CH4"));
      Color cardColor = (widget.device.alertStateCh4) ? Colors.redAccent : Colors.greenAccent;
      ChannelCardConfiguration channelCardConfiguration = ChannelCardConfiguration(
        channel: ChannelNumber.CHANNEL4,
        name: widget.device.ch4Name,
        chartColor: cardColor,
        latestChannelValue: firstNode.ch4.toStringAsFixed(4),
        monitoringActive: widget.device.monitoringActiveCh4,
        chartColorGradient: [cardColor.withOpacity(0.2), cardColor.withOpacity(0.01)],
        data: widget.device.events.edges.map((nodeEdge) => nodeEdge.node.ch4).toList(),
        events: events
      );
      listChannelCardConfiguration.add(channelCardConfiguration);
      listChannelEventList.add(EventListView(channelCardConfiguration: channelCardConfiguration, loadImageSink: _loadCardStreamController.stream));
    }
    if(widget.device.ch5On){
      listChannelTabHeading.add(_buildTabHeader("CH5"));
      Color cardColor = (widget.device.alertStateCh5) ? Colors.redAccent : Colors.greenAccent;
      ChannelCardConfiguration channelCardConfiguration = ChannelCardConfiguration(
        channel: ChannelNumber.CHANNEL5,
        name: widget.device.ch5Name,
        chartColor: cardColor,
        latestChannelValue: firstNode.ch5.toStringAsFixed(4),
        monitoringActive: widget.device.monitoringActiveCh5,
        chartColorGradient: [cardColor.withOpacity(0.2), cardColor.withOpacity(0.01)],
        data: widget.device.events.edges.map((nodeEdge) => nodeEdge.node.ch5).toList(),
        events: events
      );
      listChannelCardConfiguration.add(channelCardConfiguration);
      listChannelEventList.add(EventListView(channelCardConfiguration: channelCardConfiguration, loadImageSink: _loadCardStreamController.stream));
    }
  }

  Widget _buildTabHeader(String heading){
    return Tab(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Icon(Icons.timeline, size: 20.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(heading, style: TextStyle(fontFamily: "Sans", fontSize: 14))
          )
        ],
      ),
    );
  }
}


