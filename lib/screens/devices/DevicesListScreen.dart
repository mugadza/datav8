import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/screens/helpers/helpers.dart';
import 'package:flutter/material.dart';

class DevicesListScreen extends StatefulWidget {
  final GetDeviceDataOperationResult model;
  final bool loadCard;

  DevicesListScreen({Key key, this.model, this.loadCard}) : super(key: key);

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
                children: widget.loadCard ?  _deviceCardLoadingList() : _deviceCardLoadedList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DeviceCard> _deviceCardLoadedList(){
    List<DeviceCard> items = [];
    for (DeviceNodeEdge edge in widget.model.device.edges){
      items.add(DeviceCard(device: edge.node));
    }
    return items;
  }

  List<DeviceCardLoading> _deviceCardLoadingList(){
    List<DeviceCardLoading> items = [];
    for (int i = 0; i < 3; i++){
      items.add(DeviceCardLoading());
    }
    return items;
  }
}
