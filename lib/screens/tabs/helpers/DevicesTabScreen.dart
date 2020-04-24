import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/screens/tabs/helpers/DeviceCard.dart';
import 'package:datav8/screens/tabs/helpers/WaveAppBar.dart';
import 'package:flutter/material.dart';

class DevicesTabScreen extends StatefulWidget {
  final GetDeviceDataOperationResult model;

  DevicesTabScreen({Key key, this.model}) : super(key: key);

  @override
  _DevicesTabScreenState createState() => _DevicesTabScreenState();
}

class _DevicesTabScreenState extends State<DevicesTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            ///
            /// Create wave header 
            ///
            WaveAppBar(height: 175, child: Text("Devices", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700))),
  
            ///
            /// Create column for card
            ///
            Padding(
              padding: const EdgeInsets.only(top: 160.0),
              child: Column(
                children: <Widget>[
                  
                  for (DeviceNodeEdge edge in widget.model.device.edges) DeviceCard(device: edge.node)
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
