
import 'package:flutter/material.dart';

class WaveAppBar extends StatefulWidget {
  final Widget child;
  final Widget action;
  final double height;
  WaveAppBar({Key key, this.child, this.action, this.height}) : super(key: key);

  _WaveAppBarState createState() => _WaveAppBarState();
}

class _WaveAppBarState extends State<WaveAppBar> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[       
        ///
        /// Create wave appbar
        ///
        ClipPath(
          child: Container(
            height: widget.height,
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
        /// Top right action
        /// 
        (widget.action != null) ? widget.action : Text(""),

        ///
        /// Create profile
        ///
        Padding(padding: EdgeInsets.only(top: 72.0, left: 22.0), child: widget.child),

      ],
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
