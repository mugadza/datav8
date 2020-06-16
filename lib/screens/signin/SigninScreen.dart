import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SigninScreen extends StatefulWidget {
  const SigninScreen({Key key}) : super(key: key);
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  GlobalKey<ScaffoldState> _scaffoldKey;
  GlobalKey<FormState> _formKey;
  MediaQueryData _mediaQuery;

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
    _mediaQuery = MediaQuery.of(context);
    return BlocListener<SigninBloc, SigninState>(
      listener: (BuildContext context, SigninState state) {
        if(state is SigninFailureState){
          _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(state.error.replaceFirst("Exception: ", "")), backgroundColor: ApplicationColorStyle.primaryColor));
        }
      },
      child: BlocBuilder<SigninBloc, SigninState>(
        builder: (context, state){
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
                            _applicationNameAndLogo(),
                            _textEditing("Email", Icons.email, false,TextInputType.emailAddress, _emailController, "Please enter a valid email"),
                            _textEditing("Password", Icons.vpn_key, true, TextInputType.visiblePassword, _passwordController, "Password field empty"),

                            ///
                            /// forgot password
                            ///
                            _forgotPassword(),

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
                                    if (state is! SigninLoadingState) {
                                       BlocProvider.of<SigninBloc>(context).add(SigninButtonPressedEvent(email: _emailController.text, password: _passwordController.text));
                                    }
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
                                  child: (state is SigninLoadingState) ? _spinKitThreeBounce : _centeredSignInText,
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
        },
      ),
    );
  }

  Widget _applicationNameAndLogo(){
    return Padding(
      padding: EdgeInsets.only(top: _mediaQuery.padding.top + 220.0),
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
    );
  }

  Widget _forgotPassword(){
    return Padding(
      padding: const EdgeInsets.only(right: 23.0, top: 9.0),
      child: InkWell(
          onTap: () {
            // Do something
          },
          child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password ?",
                style: TextStyle(color: Colors.white38, fontSize: 12.0),
              )
          )
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
