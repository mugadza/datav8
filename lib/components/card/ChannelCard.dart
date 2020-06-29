import 'package:datav8/components/card/ChannelCardConfiguration.dart';
import 'package:datav8/screens/devices/ChannelDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class ChannelCard extends StatelessWidget {
  final ChannelCardConfiguration currentChannelConfiguration;
  final List<ChannelCardConfiguration> otherChannelsConfigurations;

  ChannelCard({@required this.currentChannelConfiguration, this.otherChannelsConfigurations});
  
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
      child: InkWell(
        onTap: () {
          // -------- Tapping card
          Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_, __, ___) => ChannelDetailsScreen(currentChannelConfiguration: currentChannelConfiguration, otherChannelsConfigurations: otherChannelsConfigurations)));
        },
        child: Container(
          height: 70.0,
          width: _width / 2.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Theme.of(context).canvasColor,
            boxShadow: [
              BoxShadow(
                color: Color(0xFF656565).withOpacity(0.15),
                blurRadius: 1.0,
                spreadRadius: 1.0,
                offset: Offset(0.1, 1.0)
              )
            ]
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      currentChannelConfiguration.name,
                      style: TextStyle(
                        color: Theme.of(context).textSelectionColor,
                        fontFamily: "Popins",
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            currentChannelConfiguration.latestChannelValue,
                            style: TextStyle(color: currentChannelConfiguration.statusColor, fontFamily: "Popins", fontSize: 11.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 40.0,
                  child: Sparkline(
                    data: currentChannelConfiguration.data,
                    lineWidth: 0.3,
                    fillMode: FillMode.below,
                    lineColor: currentChannelConfiguration.statusColor,
                    fillGradient: new LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: currentChannelConfiguration.chartColorGradient,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
