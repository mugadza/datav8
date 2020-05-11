import 'package:datav8/screens/helpers/helpers.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key key}) : super(key: key);

  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  static var _txtCustomSub =  TextStyle(color: Colors.white54,fontFamily: "Sans", fontWeight: FontWeight.w300, letterSpacing: 1.5, fontSize: 16.0);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ///
                /// Create wave appbar
                ///
                WaveAppBar(child: _header(), height: 175.0),

                _line(),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/image/logo_kl.png", height: 50.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("DATA-V8", style: _txtCustomSub.copyWith(fontWeight: FontWeight.w600)),
                            Text("Developed by: Mbele Lebohang", style: _txtCustomSub.copyWith(fontSize: 12))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                _line(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                  child: Text(
                    "DATA-V8 is Kovco Labs' online data logging system. The physical hardware is a unit which has 5 "
                    "channels each of 12 bit analogue input. These channels are each sampled once per minute and the "
                    "data is uploaded server. \n\nUsing this app you can monitor, virtualize and manage your devices.",
                    style: _txtCustomSub,
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ) 
          )
        ],
      ),
    );
  }

  ///
  /// Create header widget
  ///
  Widget _header() {
    return  Text("About", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700));
  }

  ///
  /// Create header widget
  ///
  Widget _line() {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Divider(
        height: 0.5,
        color: Colors.white54,
      ),
    );
  }
}

