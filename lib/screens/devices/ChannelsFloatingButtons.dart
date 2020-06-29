import 'package:datav8/components/styles.dart';
import 'package:flutter/material.dart';

class ChannelsFloatingButtons extends StatefulWidget {
  @override
  _ChannelsFloatingButtonsState createState() => _ChannelsFloatingButtonsState();
}

class _ChannelsFloatingButtonsState extends State<ChannelsFloatingButtons> with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _animateColor;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() => setState(() {}));

    _animateColor = ColorTween(begin: ApplicationColorStyle.primaryColor, end: ApplicationColorStyle.primaryColor).animate(CurvedAnimation(parent: _animationController, curve: Interval(0.0, 1.0, curve: _curve)));
    _translateButton = Tween<double>(begin: 56, end: -14).animate(CurvedAnimation(parent: _animationController, curve: Interval(0.0, 0.75, curve: _curve)));

    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    !isOpened ? _animationController.forward() : _animationController.reverse();
    isOpened = !isOpened;
  }

  Widget channelFloatingButton(String tag, IconData icon){
    return Container(
      height: 48,
//      margin: const EdgeInsets.only(bottom: 7),
      child: FloatingActionButton(
        heroTag: tag,
        onPressed: null,
        tooltip: tag,
        child: Icon(icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: FloatingActionButton(
            heroTag: "Download",
            onPressed: null,
            tooltip: 'Download',
            child: Icon(Icons.cloud_download),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Transform(
              transform: Matrix4.translationValues(0.0, _translateButton.value * 4.4, 0.0),
              child: channelFloatingButton("CH5", Icons.add),
            ),

            Transform(
              transform: Matrix4.translationValues(0.0, _translateButton.value * 3.5, 1.0),
              child: channelFloatingButton("CH4", Icons.remove),
            ),

            Transform(
              transform: Matrix4.translationValues(0.0, _translateButton.value * 2.65, 0.0),
              child: channelFloatingButton("CH3", Icons.add),
            ),

            Transform(
              transform: Matrix4.translationValues(0.0, _translateButton.value * 1.80, 0.0),
              child: channelFloatingButton("CH2", Icons.add),
            ),

            Transform(
              transform: Matrix4.translationValues(0.0, _translateButton.value * 0.90 , 0.0),
              child: channelFloatingButton("CH1", Icons.remove),
            ),

            FloatingActionButton(
              backgroundColor: _animateColor.value,
              onPressed: animate,
              tooltip: 'Channels',
              child: Icon(Icons.playlist_add),
            ),
          ],
        ),
      ],
    );
  }
}