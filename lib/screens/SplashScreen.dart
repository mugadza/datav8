
import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  final SigninBloc signinBloc;
  SplashScreen({@required this.signinBloc});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

/// Component UI
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayoutVerifyUserAuthentication);
    super.initState();
  }

  _afterLayoutVerifyUserAuthentication(_) {
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

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SigninBloc, SigninState>(
      bloc: widget.signinBloc,
      builder: (context, state){
        if(state is SigninSuccessState){
          return DashboardScreen(bottomNavigationBloc: BlocProvider.of<BottomNavigationBloc>(context));
        }

        if((state is SignoutSuccessState) || (state is SigninLoadingState) || (state is SigninFailureState)){
          return SigninScreen(signinBloc: widget.signinBloc);
        }

        return _splashWidget(context);
      },
    );
  }

  Widget _splashWidget(BuildContext context){
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