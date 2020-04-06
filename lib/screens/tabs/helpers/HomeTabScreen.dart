import 'dart:async';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/components/card/ChannelCard.dart';
import 'package:datav8/components/card/ChannelCardConfiguration.dart';
import 'package:datav8/components/card/ChannelLoadingCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeTabScreen extends StatefulWidget {
  final GetHomeDataOperationResult model;
  HomeTabScreen({Key key, this.model}) : super(key: key);

  _HomeTabScreenState createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  bool loadCard = true;
  List<ChannelCardConfiguration> listChannelCardConfiguration;

  @override
  void initState() {
    Timer(Duration(seconds: 3),(){
      setState(() {
        loadCard = false;
      });
    });

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
                  AssetImage("assets/image/banner/banner3.jpg"),
                  AssetImage("assets/image/banner/banner4.png"),
                ],
              ),
            ),

            SizedBox(height: 10.0),

            ///
            /// check the condition if image data from server firebase loaded or no
            /// if image loaded true (image still downloading from server)
            /// Card to set card loading animation
            ///

            loadCard ? _channelLoadingCardAnimation(context) : _channelCardGridLoaded(context),

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

    DeviceNodeEdge homeDeviceEdge = widget.model.device.edges.first;

    EventNode firstNode = homeDeviceEdge.node.events.edges.first.node;

    if(homeDeviceEdge.node.ch1On){
      Color cardColor = (firstNode.ch1 < homeDeviceEdge.node.lowerThresholdCh1) ? Colors.orangeAccent : ((firstNode.ch1 > homeDeviceEdge.node.upperThresholdCh1) ? Colors.redAccent : Colors.greenAccent);
      listChannelCardConfiguration.add(
        ChannelCardConfiguration(
          name: homeDeviceEdge.node.ch1Name,
          chartColor: cardColor,
          latestChannelValue: firstNode.ch1.toStringAsFixed(4),
          monitoringActive: homeDeviceEdge.node.monitoringActiveCh1,
          chartColorGradient: [cardColor.withOpacity(0.2), cardColor.withOpacity(0.01)],
          data: homeDeviceEdge.node.events.edges.map((nodeEdge) => nodeEdge.node.ch1).toList()
        )
      );
    }
    if(homeDeviceEdge.node.ch2On){
      Color cardColor = (firstNode.ch2 < homeDeviceEdge.node.lowerThresholdCh2) ? Colors.orangeAccent : ((firstNode.ch2 > homeDeviceEdge.node.upperThresholdCh2) ? Colors.redAccent : Colors.greenAccent);
      listChannelCardConfiguration.add(
        ChannelCardConfiguration(
          name: homeDeviceEdge.node.ch2Name,
          chartColor: cardColor,
          latestChannelValue: firstNode.ch2.toStringAsFixed(4),
          monitoringActive: homeDeviceEdge.node.monitoringActiveCh2,
          chartColorGradient: [cardColor.withOpacity(0.2), cardColor.withOpacity(0.01)],
          data: homeDeviceEdge.node.events.edges.map((nodeEdge) => nodeEdge.node.ch2).toList()
        )
      );
    }
    if(homeDeviceEdge.node.ch3On){
      Color cardColor = (firstNode.ch3 < homeDeviceEdge.node.lowerThresholdCh3) ? Colors.orangeAccent : ((firstNode.ch3 > homeDeviceEdge.node.upperThresholdCh3) ? Colors.redAccent : Colors.greenAccent);
      listChannelCardConfiguration.add(
        ChannelCardConfiguration(
          name: homeDeviceEdge.node.ch3Name,
          chartColor: cardColor,
          latestChannelValue: firstNode.ch3.toStringAsFixed(4),
          monitoringActive: homeDeviceEdge.node.monitoringActiveCh3,
          chartColorGradient: [cardColor.withOpacity(0.2), cardColor.withOpacity(0.01)],
          data: homeDeviceEdge.node.events.edges.map((nodeEdge) => nodeEdge.node.ch3).toList()
        )
      );
    }
    if(homeDeviceEdge.node.ch4On){
      Color cardColor = (firstNode.ch4 < homeDeviceEdge.node.lowerThresholdCh4) ? Colors.orangeAccent : ((firstNode.ch4 > homeDeviceEdge.node.upperThresholdCh4) ? Colors.redAccent : Colors.greenAccent);
      listChannelCardConfiguration.add(
        ChannelCardConfiguration(
          name: homeDeviceEdge.node.ch4Name,
          chartColor: cardColor,
          latestChannelValue: firstNode.ch4.toStringAsFixed(4),
          monitoringActive: homeDeviceEdge.node.monitoringActiveCh4,
          chartColorGradient: [cardColor.withOpacity(0.2), cardColor.withOpacity(0.01)],
          data: homeDeviceEdge.node.events.edges.map((nodeEdge) => nodeEdge.node.ch4).toList()
        )
      );
    }
    if(homeDeviceEdge.node.ch5On){
      Color cardColor = (firstNode.ch5 < homeDeviceEdge.node.lowerThresholdCh5) ? Colors.orangeAccent : ((firstNode.ch5 > homeDeviceEdge.node.upperThresholdCh5) ? Colors.redAccent : Colors.greenAccent);
      listChannelCardConfiguration.add(
        ChannelCardConfiguration(
          name: homeDeviceEdge.node.ch5Name,
          chartColor: cardColor,
          latestChannelValue: firstNode.ch5.toStringAsFixed(4),
          monitoringActive: homeDeviceEdge.node.monitoringActiveCh5,
          chartColorGradient: [cardColor.withOpacity(0.2), cardColor.withOpacity(0.01)],
          data: homeDeviceEdge.node.events.edges.map((nodeEdge) => nodeEdge.node.ch5).toList()
        )
      );
    }
  }
}
