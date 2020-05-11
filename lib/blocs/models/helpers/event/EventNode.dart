import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class EventNode extends MapObject {
  double get ch1 => map["ch1"] as double;
  set ch1(double value) => map["ch1"] = value;

  double get ch2 => map["ch2"] as double;
  set ch2(double value) => map["ch2"] = value;

  double get ch3 => map["ch3"] as double;
  set ch3(double value) => map["ch3"] = value;

  double get ch4 => map["ch4"] as double;
  set ch4(double value) => map["ch4"] = value;

  double get ch5 => map["ch5"] as double;
  set ch5(double value) => map["ch5"] = value;

  DateTime get deviceTimeDate => (map["deviceTimeDate"] is DateTime) ? map["deviceTimeDate"]:DateTime.parse(map["deviceTimeDate"] as String);
  set deviceTimeDate(DateTime value) => map["deviceTimeDate"] = value;

  static EventNode fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return EventNode()..map = map;
  }

  EventNode clone() => EventNode.fromMap(toJson() as Map<String, dynamic>, true);
}