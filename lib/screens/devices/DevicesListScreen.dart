import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/screens/helpers/helpers.dart';
import 'package:flutter/material.dart';

class DevicesListScreen extends StatefulWidget {
  final GetDeviceDataOperationResult model;

  DevicesListScreen({Key key, this.model}) : super(key: key);

  @override
  _DevicesListScreenState createState() => _DevicesListScreenState();
}

class _DevicesListScreenState extends State<DevicesListScreen> {
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
