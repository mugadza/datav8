import 'package:datav8/screens/tabs/helpers/WaveAppBar.dart';
import 'package:flutter/material.dart';

class DevicesTab extends StatefulWidget {
  @override
  _DevicesTabState createState() => _DevicesTabState();
}

class _DevicesTabState extends State<DevicesTab> {
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
            Column(
              children: <Widget>[
                SizedBox(
                  height: 140.0,
                ),
                _card(context, "2.1 ETH", "assets/image/icon/aboutapp.png", "ETHEREUM",
                    "42kj213hjkdas23141jkb"),
                _card(context, "1.3 BTC", "assets/image/icon/aboutapp.png", "BITCOIN",
                    "42kj213hjkdas23141jkb"),
                _card(context, "4.2 RPL", "assets/image/icon/aboutapp.png", "RIPPLE",
                    "42kj213hjkdas23141jkb"),
                _card(context, "1.1 DSH", "assets/image/icon/aboutapp.png", "DASH",
                    "42kj213hjkdas23141jkb"),
                SizedBox(
                  height: 25.0,
                )
              ],
            ),
          ],
        ),
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

  
  Widget _card(BuildContext context, String value, String img, String title, String code) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
            child: Container(
              height: 140.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: Color(0xFF232D4E),
                  border: Border.all(color: Colors.white10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10.0, bottom: 10.0),
                    child: Text(
                      "Card",
                      style: TextStyle(
                          fontFamily: "Sans",
                          fontWeight: FontWeight.w200,
                          letterSpacing: 1.5,
                          fontSize: 16.0),
                    ),
                  ),
                  _line(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 15.0),
                    child: Row(
                      children: <Widget>[
                        Container(
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
                            child: Icon(Icons.timeline, size: 25.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                title,
                                style: TextStyle(
                                    fontFamily: "Popins",
                                    fontWeight: FontWeight.w200,
                                    letterSpacing: 1.5,
                                    fontSize: 17.0),
                              ),
                              Text(
                                code,
                                style: TextStyle(
                                    fontFamily: "Sans",
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1.5,
                                    fontSize: 14.0,
                                    color: Colors.white24),
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
                            border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 1.0)
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
                            border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 1.0)
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
                            border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 1.0)
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
                            border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 1.0)
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
                            border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 1.0)
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
}
