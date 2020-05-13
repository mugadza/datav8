
import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/screens/screens.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final AuthenticationBloc authenticationBloc;
  SplashScreen({@required this.authenticationBloc});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

/// Component UI
class _SplashScreenState extends State<SplashScreen> {

  /// Setting duration in splash screen
  verifyUserAuthentication() async {
    widget.authenticationBloc.userRepository.hasToken().then((value){
      if (!value){
        navigatorPage();
      }
      else{
        widget.authenticationBloc.userRepository.getToken().then((value){
          widget.authenticationBloc.add(AuthenticatedEvent(token: value));
        });
      }
    });
  }

  /// To navigate layout change
  void navigatorPage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => SigninScreen()
    ));
  }

  /// Declare startTime to InitState
  @override
  void initState() {
    super.initState();
    verifyUserAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/image/splash_screen.png'), fit: BoxFit.cover)),
        child: Container(
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
      ),
    );
  }
}