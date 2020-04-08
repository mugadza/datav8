import 'package:flutter/material.dart';

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
            Stack(
              children: <Widget>[
                ///
                /// Create wave appbar
                ///
                ClipPath(
                  child: Container(
                    height: 220.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFF15EDED), Color(0xFF029CF5)])
                    ),
                  ),
                  clipper: BottomWaveClipper(),
                ),

                ///
                /// Get triangle widget
                ///
                _triangle(20.0, 10.0),
                _triangle(110.0, 80.0),
                _triangle(50.0, 190.0),
                _triangle(40.0, 300.0),
                _triangle(160.0, 330.0),

                ///
                /// Create profile
                ///
                Padding(padding: EdgeInsets.only(top: 72.0, left: 22.0), child: profile()),

              ],
            ),

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
                // Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_, __, ___) => new T4_callCenter()));
              },
            ),
            _line(context),
            Padding(padding: EdgeInsets.only(bottom: 20.0)),
          ],
        ),
      ),
    );
  }

  Widget _line(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 85.0, right: 30.0),
      child: Divider(
        color: Theme.of(context).hintColor,
        height: 2.0,
      ),
    );
  }

  ///
  /// Create triangle 
  ///
  Widget _triangle(double top, left) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: left),
      child: ClipPath(
        child: Container(
          height: 40.0,
          width: 40.0,
          color: Colors.white12.withOpacity(0.2),
        ),
        clipper: TriangleClipper(),
      ),
    );
  }

  ///
  /// Create profile widget
  ///
  Widget profile() {
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
              image: DecorationImage(
                  image: AssetImage("assets/avatars/avatar-7.png"),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 15.0,
        ),
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
                  color: Colors.white),
            ),
            Text(
              "lebohang.mbele@alumni.uct.ac.za",
              style: TextStyle(
                  fontFamily: "Popins",
                  fontWeight: FontWeight.w300,
                  color: Colors.white54),
            )
          ],
        )
      ],
    );
  }
}

///
/// Create wave appbar
///
class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

///
/// Create triangle clipper
///
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
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
                  child: Image.asset(image, height: 25.0, color: Color(0xFF15EDED)),
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
