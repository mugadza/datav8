
import 'package:datav8/components/charts/helpers/GraphAxis.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DataV8LineGraph extends StatefulWidget{
  final GraphAxis xAxis;
  final GraphAxis yAxis;
  _DataV8LineGraphState _graphState;


  DataV8LineGraph({Key key, this.xAxis, this.yAxis}) : super(key: key);

  @override
  _DataV8LineGraphState createState() => _DataV8LineGraphState();

}

class _DataV8LineGraphState extends State<DataV8LineGraph> with SingleTickerProviderStateMixin{
  bool triggerLoaded;
  Orientation deviceOrientation;

  @override
  Widget build(BuildContext context) {
    widget._graphState = this;
    widget._graphState.triggerLoaded = false;

    return _GraphContainer(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: _getGraphElements()
          ),
        )
    );
  }

  Widget _getGraphElements(){
    if (widget._graphState.deviceOrientation != null && widget._graphState.deviceOrientation != MediaQuery.of(context).orientation) {
      widget._graphState.deviceOrientation = MediaQuery.of(context).orientation;
    }
    else {
      widget._graphState.deviceOrientation = MediaQuery.of(context).orientation;
    }

  }

}

class GraphSegment {
  // TODO : implement
}


class _GraphContainer extends SingleChildRenderObjectWidget {
  const _GraphContainer({Widget child}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _GraphContainerBox();
  }
}

class _GraphContainerBox extends RenderShiftedBox {
  _GraphContainerBox() : super(null);
  double minHeight = 300;
  double minWidth = 300;

  @override
  void performLayout() {
    double height = constraints.maxHeight;
    double width = constraints.maxWidth;
    if (height == double.infinity)  height = minHeight;
    if (width == double.infinity)  width = minWidth;

    child.layout(BoxConstraints(minHeight: 0.0, maxHeight: height, minWidth: 0.0, maxWidth: width), parentUsesSize: true);
    size = Size(width, height);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
  }
}