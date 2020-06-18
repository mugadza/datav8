import 'package:datav8/components/charts/helpers/GraphAxis.dart';

class GraphDateTimeAxis extends GraphAxis {
  final GridLines gridLines;
  final TickLines tickLines;
  final bool autoZooming;

  GraphDateTimeAxis({GridLines gridLines, TickLines tickLines, bool autoZooming})
      : gridLines = gridLines ?? GridLines(),
        tickLines = tickLines ?? TickLines(),
        autoZooming = autoZooming ?? true,
        super(tickLines: tickLines, gridLines: gridLines);

}