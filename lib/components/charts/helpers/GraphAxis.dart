import 'package:flutter/material.dart';

abstract class GraphAxis {
  final GridLines gridLines;
  final TickLines tickLines;

  GraphAxis({GridLines gridLines, TickLines tickLines})
    : gridLines = gridLines ?? GridLines(),
      tickLines = tickLines ?? TickLines();

}

class GridLines {
  final double width;
  final Color color;
  GridLines({this.width = 1.0, this.color});
}

class TickLines {
  final double width;
  final Color color;

  TickLines({this.width = 1.0, this.color});
}