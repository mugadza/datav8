import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/components/components.dart';
import 'package:datav8/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SigninScreen extends StatefulWidget {
  final SigninBloc signinBloc;
  const SigninScreen({Key key, @required this.signinBloc}) : super(key: key);
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  GlobalKey<ScaffoldState> _scaffoldKey;
  GlobalKey<FormState> _formKey;
  SigninState _currentSigninState;
  

  final SpinKitThreeBounce _spinKitThreeBounce = SpinKitThreeBounce(
    size: 20,
    color: ApplicationColorStyle.background,
  );

  final _centeredSignInText = Center(
    child: Text("Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20.0, letterSpacing: 1.0)),
  );

  @override
  void initState() {
    _formKey  = GlobalKey<FormState>();
    _scaffoldKey = GlobalKey<ScaffoldState>();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _currentSigninState = SigninInitialState();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return BlocListener<SigninBloc, SigninState>(
      bloc: widget.signinBloc,
      listener: (BuildContext context, SigninState state) {
        setState(() {
          _currentSigninState = state;
        });
        if(state is SigninFailureState){
          _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(state.error.replaceFirst("Exception: ", "")), backgroundColor: ApplicationColorStyle.primaryColor));
        }
      },
      child: BlocBuilder<SigninBloc, SigninState>(
        bloc: widget.signinBloc,
        builder: (context, state){
          if(state is SigninInitialState){
            widget.signinBloc.add(InitiateSigninEvent());
            return _signInForm(context);
          }

          if(state is SigninSuccessState){
            return DashboardScreen(bottomNavigationBloc: BlocProvider.of<BottomNavigationBloc>(context));
          }
          
          if((state is SignoutSuccessState) || (state is SigninLoadingState) || (state is SigninFailureState)){
            return _signInForm(context);
          }
         
          return Center(
            child: Text("Sign in Error"),
          );
        },
      ),
    );
  }

  Widget _signInForm(BuildContext context){
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Form(
      key: _formKey,
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: ApplicationColorStyle.background),
          child: Stack(
            children: <Widget>[
              ///
              /// Set image in top
              ///
              Container(
                height: 220.0,
                width: double.infinity,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/image/loginHeader.png"), fit: BoxFit.cover)),
              ),

              ///
              /// Email input field
              ///
              Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: mediaQuery.padding.top + 220.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/image/logo_kl.png", height: 50.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                "DATA-V8",
                                style: TextStyle(
                                  fontFamily: "Sans",
                                  color: Colors.white,
                                  fontSize: 27.0,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 3.5
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                     
                      _textEditing("Email", Icons.email, false,TextInputType.emailAddress, _emailController, "Please enter a valid email"),
                      _textEditing("Password", Icons.vpn_key, true, TextInputType.visiblePassword, _passwordController, "Password field empty"),
                      
                      ///
                      /// forgot password
                      ///
                      Padding(
                        padding: const EdgeInsets.only(right: 23.0, top: 9.0),
                        child: InkWell(
                          onTap: () {
                            // Do somthing
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot Password ?",
                              style: TextStyle(color: Colors.white38, fontSize: 12.0),
                            )
                          )
                        ),
                      ),

                      ///
                      /// Button in bottom
                      ///
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
                        child: InkWell(
                          onTap: (){
                            final FormState formState = _formKey.currentState;
                            if (formState.validate()) {
                              formState.save();
                              widget.signinBloc.add(SigninButtonPressedEvent(email: _emailController.text, password: _passwordController.text));
                            }
                          },
                          child: Container(
                            height: 50.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFF15EDED), Color(0xFF029CF5)]
                              )
                            ),
                            child: (_currentSigninState is SigninLoadingState) ? _spinKitThreeBounce : _centeredSignInText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 
  ///  TextEditing widget
  /// 
  Widget _textEditing(String title, IconData icon, bool obscure, TextInputType textInputType, TextEditingController controller, String validationMessage) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
      child: Container(
        height: 57.0,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50.0)), border: Border.all(color: Colors.white38)),
        child: Theme(
          data: ThemeData(hintColor: Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 0.0),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.start,
              controller: controller,
              keyboardType: textInputType,
              obscureText: obscure,
              autocorrect: false,
              autofocus: false,
              textInputAction: TextInputAction.next,
              validator: (input) {
                if (input.isEmpty) {
                  return validationMessage;
                }
                return null;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: title,
                labelStyle: TextStyle(color: Colors.white38, fontSize: 15.0),
                icon: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(icon, color: Colors.white38, size: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
