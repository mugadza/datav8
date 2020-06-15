import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, image: DecorationImage(image: AssetImage('assets/image/splash_screen.png'), fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromRGBO(0, 0, 0, 0.1), Color.fromRGBO(0, 0, 0, 0.1)],
                begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter
              )
            ),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/image/logo_kl.png", height: 45.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 17.0, top: 7.0),
                          child: Text(
                            "DATA-V8",
                            style: TextStyle(
                              fontFamily: "Sans",
                              color: Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 3.9
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}