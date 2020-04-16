import 'package:carousel_pro/carousel_pro.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/components/card/ChannelCard.dart';
import 'package:datav8/components/card/ChannelCardConfiguration.dart';
import 'package:datav8/components/card/ChannelLoadingCard.dart';
import 'package:datav8/components/components.dart';
import 'package:datav8/components/events/EventListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeTabScreen extends StatefulWidget {
  final GetHomeDataOperationResult model;
  HomeTabScreen({Key key, this.model}) : super(key: key);

  _HomeTabScreenState createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  bool loadCard = false;
  List<ChannelCardConfiguration> listChannelCardConfiguration;
  List<Tab> listChannelTabHeading;
  List<EventListView> listChannelEventList;

  @override
  void initState() {
    _buildListChannelCardConfiguration();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ///
            /// Header image slider
            /// 
            SizedBox(
              height: 210.0,
              width: double.infinity,
              child: Carousel(
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
            loadCard ? _channelLoadingCardAnimation(context) : _channelCardGridLoaded(context),

            ///
            /// Channel events tab lists
            ///
            Container(
              height: 700.0,
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
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// Calling ImageLoaded animation for set a grid layout
  ///
  Widget _channelCardGridLoaded(BuildContext context) {
    return StaggeredGridView.count(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      shrinkWrap: true,
      primary: false,
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 8.0,
      children: List.generate(
        listChannelCardConfiguration.length,
        (index) => ChannelCard(listChannelCardConfiguration[index]),
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

    DeviceNodeEdge homeDeviceEdge = widget.model.device.edges.first;

    EventNode firstNode = homeDeviceEdge.node.events.edges.first.node;

    if(homeDeviceEdge.node.ch1On){
      listChannelTabHeading.add(_buildTabHeader("CH1"));
      Color cardColor = (firstNode.ch1 < homeDeviceEdge.node.lowerThresholdCh1) ? Colors.orangeAccent : ((firstNode.ch1 > homeDeviceEdge.node.upperThresholdCh1) ? Colors.redAccent : Colors.greenAccent);
      ChannelCardConfiguration channelCardConfiguration = ChannelCardConfiguration(
        name: homeDeviceEdge.node.ch1Name,
        chartColor: cardColor,
        latestChannelValue: firstNode.ch1.toStringAsFixed(4),
        monitoringActive: homeDeviceEdge.node.monitoringActiveCh1,
        chartColorGradient: [cardColor.withOpacity(0.2), cardColor.withOpacity(0.01)],
        data: homeDeviceEdge.node.events.edges.map((nodeEdge) => nodeEdge.node.ch1).toList(),
        events: homeDeviceEdge.node.events.edges.map((nodeEdge) => nodeEdge.node).toList()
      );
      listChannelCardConfiguration.add(channelCardConfiguration);
      listChannelEventList.add(EventListView(channelCardConfiguration: channelCardConfiguration));
    }
    if(homeDeviceEdge.node.ch2On){
      listChannelTabHeading.add(_buildTabHeader("CH2"));
      Color cardColor = (firstNode.ch2 < homeDeviceEdge.node.lowerThresholdCh2) ? Colors.orangeAccent : ((firstNode.ch2 > homeDeviceEdge.node.upperThresholdCh2) ? Colors.redAccent : Colors.greenAccent);
      ChannelCardConfiguration channelCardConfiguration = ChannelCardConfiguration(
        name: homeDeviceEdge.node.ch2Name,
        chartColor: cardColor,
        latestChannelValue: firstNode.ch2.toStringAsFixed(4),
        monitoringActive: homeDeviceEdge.node.monitoringActiveCh2,
        chartColorGradient: [cardColor.withOpacity(0.2), cardColor.withOpacity(0.01)],
        data: homeDeviceEdge.node.events.edges.map((nodeEdge) => nodeEdge.node.ch2).toList(),
        events: homeDeviceEdge.node.events.edges.map((nodeEdge) => nodeEdge.node).toList()
      );
      listChannelCardConfiguration.add(channelCardConfiguration);
      listChannelEventList.add(EventListView(channelCardConfiguration: channelCardConfiguration));
    }
    if(homeDeviceEdge.node.ch3On){
      listChannelTabHeading.add(_buildTabHeader("CH3"));
      Color cardColor = (firstNode.ch3 < homeDeviceEdge.node.lowerThresholdCh3) ? Colors.orangeAccent : ((firstNode.ch3 > homeDeviceEdge.node.upperThresholdCh3) ? Colors.redAccent : Colors.greenAccent);
      ChannelCardConfiguration channelCardConfiguration = ChannelCardConfiguration(
        name: homeDeviceEdge.node.ch3Name,
        chartColor: cardColor,
        latestChannelValue: firstNode.ch3.toStringAsFixed(4),
        monitoringActive: homeDeviceEdge.node.monitoringActiveCh3,
        chartColorGradient: [cardColor.withOpacity(0.2), cardColor.withOpacity(0.01)],
        data: homeDeviceEdge.node.events.edges.map((nodeEdge) => nodeEdge.node.ch3).toList(),
        events: homeDeviceEdge.node.events.edges.map((nodeEdge) => nodeEdge.node).toList()
      );
      listChannelCardConfiguration.add(channelCardConfiguration);
      listChannelEventList.add(EventListView(channelCardConfiguration: channelCardConfiguration));
    }
    if(homeDeviceEdge.node.ch4On){
      listChannelTabHeading.add(_buildTabHeader("CH4"));
      Color cardColor = (firstNode.ch4 < homeDeviceEdge.node.lowerThresholdCh4) ? Colors.orangeAccent : ((firstNode.ch4 > homeDeviceEdge.node.upperThresholdCh4) ? Colors.redAccent : Colors.greenAccent);
      ChannelCardConfiguration channelCardConfiguration = ChannelCardConfiguration(
        name: homeDeviceEdge.node.ch4Name,
        chartColor: cardColor,
        latestChannelValue: firstNode.ch4.toStringAsFixed(4),
        monitoringActive: homeDeviceEdge.node.monitoringActiveCh4,
        chartColorGradient: [cardColor.withOpacity(0.2), cardColor.withOpacity(0.01)],
        data: homeDeviceEdge.node.events.edges.map((nodeEdge) => nodeEdge.node.ch4).toList(),
        events: homeDeviceEdge.node.events.edges.map((nodeEdge) => nodeEdge.node).toList()
      );
      listChannelCardConfiguration.add(channelCardConfiguration);
      listChannelEventList.add(EventListView(channelCardConfiguration: channelCardConfiguration));
    }
    if(homeDeviceEdge.node.ch5On){
      listChannelTabHeading.add(_buildTabHeader("CH5"));
      Color cardColor = (firstNode.ch5 < homeDeviceEdge.node.lowerThresholdCh5) ? Colors.orangeAccent : ((firstNode.ch5 > homeDeviceEdge.node.upperThresholdCh5) ? Colors.redAccent : Colors.greenAccent);
      ChannelCardConfiguration channelCardConfiguration = ChannelCardConfiguration(
        name: homeDeviceEdge.node.ch5Name,
        chartColor: cardColor,
        latestChannelValue: firstNode.ch5.toStringAsFixed(4),
        monitoringActive: homeDeviceEdge.node.monitoringActiveCh5,
        chartColorGradient: [cardColor.withOpacity(0.2), cardColor.withOpacity(0.01)],
        data: homeDeviceEdge.node.events.edges.map((nodeEdge) => nodeEdge.node.ch5).toList(),
        events: homeDeviceEdge.node.events.edges.map((nodeEdge) => nodeEdge.node).toList()
      );
      listChannelCardConfiguration.add(channelCardConfiguration);
      listChannelEventList.add(EventListView(channelCardConfiguration: channelCardConfiguration));
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


