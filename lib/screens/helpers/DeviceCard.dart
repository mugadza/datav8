import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/screens/screens.dart';
import 'package:flutter/material.dart';

class DeviceCard extends StatelessWidget {
  final DeviceNode device;
  DeviceCard({this.device});

  @override
  Widget build(BuildContext context) {
    TextStyle _style = TextStyle(fontFamily: "Sans", fontWeight: FontWeight.w200, letterSpacing: 1.5, fontSize: 16.0);

    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              child: Container(
                height: 140.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
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
                child: InkWell(
                  onTap: () => Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_, __, ___) => DeviceScreen(device: device, enableBackButton: true, loadCard: false))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                        child: Text(device.unitName, style: _style),
                      ),
                      _line(),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 15.0),
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () => Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_, __, ___) => DeviceSettings(device: device))),
                              child: Container(
                                height: 45,
                                width: 45,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    tileMode: TileMode.repeated,
                                    colors: [Color(0xFF15EDED), Color(0xFF029CF5)]
                                  )
                                ),
                                child: Center(
                                  child: Icon(Icons.settings, size: 25.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(device.imei, style: _style.copyWith(fontFamily: "Popins")),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/1.55,
                                    child: Text("${device.unitLocation.suburb}, ${device.unitLocation.city}", maxLines: 1, overflow: TextOverflow.clip, style: _style.copyWith(fontWeight: FontWeight.w300, fontSize: 12.0, color: Colors.white24))
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 35.0, top: 27),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[

                    Container(
                      padding: EdgeInsets.only(left: 4),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            height: 25.0,
                            width: 25.0,
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
                            height: 18.0,
                            width: 18.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              border: Border.all(color: (device.alertStateCh1 && device.ch1On) ? Colors.orangeAccent : Theme.of(context).scaffoldBackgroundColor, width: 1.0),
                              color: (device.ch1On) ? Colors.transparent : Theme.of(context).scaffoldBackgroundColor
                            ),
                          )
                        ]
                      ),
                    ),


                    Container(
                      padding: EdgeInsets.only(left: 4),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            height: 25.0,
                            width: 25.0,
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
                            height: 18.0,
                            width: 18.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              border: Border.all(color: (device.alertStateCh2 && device.ch2On) ? Colors.orangeAccent : Theme.of(context).scaffoldBackgroundColor, width: 1.0),
                              color: (device.ch2On) ? Colors.transparent : Theme.of(context).scaffoldBackgroundColor
                            ),
                          )
                        ]
                      ),
                    ),


                    Container(
                      padding: EdgeInsets.only(left: 4),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            height: 25.0,
                            width: 25.0,
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
                            height: 18.0,
                            width: 18.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              border: Border.all(color: (device.alertStateCh3 && device.ch3On) ? Colors.orangeAccent : Theme.of(context).scaffoldBackgroundColor, width: 1.0),
                              color: (device.ch3On) ? Colors.transparent : Theme.of(context).scaffoldBackgroundColor
                            ),
                          )
                        ]
                      ),
                    ),                  



                    Container(
                      padding: EdgeInsets.only(left: 4),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            height: 25.0,
                            width: 25.0,
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
                            height: 18.0,
                            width: 18.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              border: Border.all(color: (device.alertStateCh4 && device.ch4On) ? Colors.orangeAccent : Theme.of(context).scaffoldBackgroundColor, width: 1.0),
                              color: (device.ch4On) ? Colors.transparent : Theme.of(context).scaffoldBackgroundColor
                            ),
                          )
                        ]
                      ),
                    ),


                    Container(
                      padding: EdgeInsets.only(left: 4),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            height: 25.0,
                            width: 25.0,
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
                            height: 18.0,
                            width: 18.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              border: Border.all(color: (device.alertStateCh5 && device.ch5On) ? Colors.orangeAccent : Theme.of(context).scaffoldBackgroundColor, width: 1.0),
                              color: (device.ch5On) ? Colors.transparent : Theme.of(context).scaffoldBackgroundColor
                            ),
                          )
                        ]
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }

  Widget _line() {
    return Container(
      height: 1.0,
      width: double.infinity,
      color: Colors.white10,
    );
  }
}