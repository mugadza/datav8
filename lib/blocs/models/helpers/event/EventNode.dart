import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class EventNode extends MapObject {
  double get ch1 => doubleValue(map["ch1"]);
  set ch1(double value) => map["ch1"] = value;

  double get ch2 => doubleValue(map["ch2"]);
  set ch2(double value) => map["ch2"] = value;

  double get ch3 => doubleValue(map["ch3"]);
  set ch3(double value) => map["ch3"] = value;

  double get ch4 => doubleValue(map["ch4"]);
  set ch4(double value) => map["ch4"] = value;

  double get ch5 => doubleValue(map["ch5"]);
  set ch5(double value) => map["ch5"] = value;

  DateTime get deviceTimeDate => (map["deviceTimeDate"] is DateTime) ? map["deviceTimeDate"]:DateTime.parse(map["deviceTimeDate"] as String);
  set deviceTimeDate(DateTime value) => map["deviceTimeDate"] = value;

  double getChannelValue(ChannelNumber channel){
    switch(channel){
      case ChannelNumber.CHANNEL1:
        return ch1;
        break;
      case ChannelNumber.CHANNEL2:
        return ch2;
        break;
      case ChannelNumber.CHANNEL3:
        return ch3;
        break;
      case ChannelNumber.CHANNEL4:
        return ch4;
        break;
      case ChannelNumber.CHANNEL5:
        return ch5;
        break;
    }
    return 0.0; // to make the compiler happy
  }

  double getMinimum(bool ch1Enabled, bool ch2Enabled, bool ch3Enabled, bool ch4Enabled, bool ch5Enabled){
    List<double> items = [];

    if(ch1Enabled) items.add(ch1);
    if(ch2Enabled) items.add(ch2);
    if(ch3Enabled) items.add(ch3);
    if(ch4Enabled) items.add(ch4);
    if(ch5Enabled) items.add(ch5);

    return items.reduce((value, element) => value < element ? value : element);
  }

  double getMaximum(bool ch1Enabled, bool ch2Enabled, bool ch3Enabled, bool ch4Enabled, bool ch5Enabled){
    List<double> items = [];

    if(ch1Enabled) items.add(ch1);
    if(ch2Enabled) items.add(ch2);
    if(ch3Enabled) items.add(ch3);
    if(ch4Enabled) items.add(ch4);
    if(ch5Enabled) items.add(ch5);

    return items.reduce((value, element) => value > element ? value : element);
  }
  
  static EventNode fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return EventNode()..map = map;
  }

  EventNode clone() => EventNode.fromMap(toJson() as Map<String, dynamic>, true);
}