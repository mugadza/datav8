
import 'package:datav8/blocs/blocs.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final SigninBloc signinBloc;
  SplashScreen({@required this.signinBloc});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

/// Component UI
class _SplashScreenState extends State<SplashScreen> {

  /// Setting duration in splash screen
  verifyUserAuthentication() async {
    widget.signinBloc.authenticationBloc.userRepository.deleteToken().then((_) {});
    widget.signinBloc.authenticationBloc.userRepository.hasToken().then((value){
      if (value){
        widget.signinBloc.authenticationBloc.userRepository.getToken().then((value){
          widget.signinBloc.authenticationBloc.add(AuthenticatedEvent(token: value));
        });
      }
      else{
        widget.signinBloc.authenticationBloc.add(UnauthenticatedEvent());
      }
    });
  }

   /// Declare startTime to InitState
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => verifyUserAuthentication());
  }

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