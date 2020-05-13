import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/screens/helpers/helpers.dart';
import 'package:datav8/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({Key key}) : super(key: key);

  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ///
            /// Add the wave app bar at the top
            ///
            WaveAppBar(child: profile(context), height: 220.0),

            ///
            /// Create list for category
            ///
            Category(
              txt: "Manage devices",
              padding: 35.0,
              image: "assets/image/icon/notification.png",
              tap: () {
                // Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_, __, ___) => new T4_notification()));
              },
            ),
            _line(context),
            Category(
              txt: "Manage customers",
              padding: 30.0,
              image: "assets/image/icon/setting.png",
              tap: () {
                // Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_, __, ___) => new T4_settingAccount()));
              },
            ),
            _line(context),
            Category(
              txt: "Help",
              padding: 30.0,
              image: "assets/image/icon/callcenter.png",
              tap: () {
                // Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_, __, ___) => new T4_callCenter()));
              },
            ),
            _line(context),
            Category(
              txt: "About",
              padding: 30.0,
              image: "assets/image/icon/aboutapp.png",
              tap: () {
                Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_, __, ___) => AboutScreen()));
              },
            ),


            _line(context),
            _logout(context)
          ],
        ),
      ),
    );
  }

  ///
  /// Create line devider widget
  ///
  Widget _line(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Divider(
        color: Theme.of(context).hintColor,
        height: 2.0,
      ),
    );
  }

  ///
  /// Create logout action
  ///
  Widget _logout(BuildContext cxt){
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
      child: InkWell(
        onTap: (){
          BlocProvider.of<SigninBloc>(cxt).add(SignoutButtonPressedEvent());
        },
        child: Container(
          height: 50.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blueGrey, Colors.blueGrey]
            )
          ),
          child: Center(
            child: Text("Sign Out", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20.0, letterSpacing: 1.0)),
          ),
        ),
      ),
    );
  }

  ///
  /// Create profile widget
  ///
  Widget profile(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 53.0,
          width: 53.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
            border: Border.all(color: Colors.white, width: 2.0),
            image: DecorationImage(image: AssetImage("assets/avatars/avatar-7.png"), fit: BoxFit.cover)
          ),
        ),
        SizedBox(width: 15.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Mbele Lebohang",
              style: TextStyle(
                fontFamily: "Popins",
                fontWeight: FontWeight.w700,
                fontSize: 17.0,
                color: Colors.white
              ),
            ),
            Text(
              "lebohang.mbele@alumni.uct.ac.za",
              style: TextStyle(
                fontFamily: "Popins",
                fontWeight: FontWeight.w300,
                color: Colors.white54
              ),
            )
          ],
        )
      ],
    );
  }
}

///
/// Create category
///
class Category extends StatelessWidget {
  final String txt, image;
  final GestureTapCallback tap;
  final double padding;

  Category({this.txt, this.image, this.tap, this.padding});
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 30.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: padding),
                  child: Image.asset(image, height: 25.0, width: 30, color: Color(0xFF15EDED)),
                ),
                Text(
                  txt,
                  style: TextStyle(fontFamily: "Popins", fontSize: 14.5, color: Colors.white54, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
