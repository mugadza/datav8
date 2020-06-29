import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/screens/helpers/helpers.dart';
import 'package:datav8/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTab extends StatefulWidget {
  final UserNode user;
  ProfileTab({Key key, @required this.user}) : super(key: key);

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
              comingSoon: true,
              txt: "Manage customers",
              padding: 35.0,
              image: "assets/icon/icon-management.png",
              tap: () {
                print("Coming soon :  see UserListScreen(signinBloc: widget.signinBloc)");
              },
            ),
            _line(context),
            Category(
              comingSoon: true,
              txt: "Settings",
              padding: 30.0,
              image: "assets/icon/icon-settings.png",
              tap: () => print("Coming soon"),
            ),

            _line(context),
            Category(
              comingSoon: false,
              txt: "About",
              padding: 30.0,
              image: "assets/icon/icon-smartphone-info.png",
              tap: () {
                Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_, __, ___) => AboutScreen()));
              }
            ),

            _line(context),
            Category(
              comingSoon: true,
              txt: "Help",
              padding: 30.0,
              image: "assets/icon/icon-info.png",
              tap: () => print("Coming soon"),
            ),

            _line(context),
            Category(
              comingSoon: false,
              txt: "Logout",
              padding: 30.0,
              image: "assets/icon/icon-power.png",
              tap: () => BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationDeleteEvent()),
            )
          ],
        ),
      ),
    );
  }

  ///
  /// Create line divider widget
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
            image: DecorationImage(image: (widget.user.avatar.url == null) ? AssetImage("assets/image/placeholder255x255.png") : NetworkImage(widget.user.avatar.url), fit: BoxFit.cover)
          ),
        ),
        SizedBox(width: 15.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "${widget.user.firstName} ${widget.user.lastName}",
              style: TextStyle(
                fontFamily: "Popins",
                fontWeight: FontWeight.w700,
                fontSize: 17.0,
                color: Colors.white
              ),
            ), 
            Text(
              widget.user.email,
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
  final bool comingSoon;

  Category({this.txt, this.image, this.tap, this.padding, this.comingSoon});
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: padding),
                  child: Image.asset(image, width: 30, color: Color(0xFF15EDED)),
                ),
                Text(
                  txt,
                  style: TextStyle(fontFamily: "Popins", fontSize: 14.5, color: Colors.white54, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            comingSoon ? Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Container(
                  width: 60.0,
                  height: 25.0,
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(2.0)), color: Color(0xFF15EDED)),
                  child: Center(child: Text("Soon", style: TextStyle(fontSize: 13, color: Colors.white)))
              ),
            ) : Container()
          ],
        ),
      ),
    );
  }
}
