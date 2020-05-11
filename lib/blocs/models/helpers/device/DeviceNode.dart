import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class DeviceNode extends MapObject {
  String get imei => map["imei"] as String;
  set imei(String value) => map["imei"] = value;

  String get unitName => map["unitName"] as String;
  set unitName(String value) => map["unitName"] = value;

  Address get unitLocation {
    if (map['unitLocation'] is Address) return map['unitLocation'] as Address;
    return map['unitLocation'] = Address.fromMap(map['unitLocation'] as Map<String, dynamic>);
  }
  set unitLocation(Address value) => map['unitLocation'] = value;

  bool get ch1On => map["ch1On"] as bool;
  set ch1On(bool value) => map["ch1On"] = value;

  bool get ch2On => map["ch2On"] as bool;
  set ch2On(bool value) => map["ch2On"] = value;

  bool get ch3On => map["ch3On"] as bool;
  set ch3On(bool value) => map["ch3On"] = value;

  bool get ch4On => map["ch4On"] as bool;
  set ch4On(bool value) => map["ch4On"] = value;

  bool get ch5On => map["ch5On"] as bool;
  set ch5On(bool value) => map["ch5On"] = value;

  bool get alertStateCh1 => map["alertStateCh1"] as bool;
  set alertStateCh1(bool value) => map["alertStateCh1"] = value;

  bool get alertStateCh2 => map["alertStateCh2"] as bool;
  set alertStateCh2(bool value) => map["alertStateCh2"] = value;

  bool get alertStateCh3 => map["alertStateCh3"] as bool;
  set alertStateCh3(bool value) => map["alertStateCh3"] = value;

  bool get alertStateCh4 => map["alertStateCh4"] as bool;
  set alertStateCh4(bool value) => map["alertStateCh4"] = value;

  bool get alertStateCh5 => map["alertStateCh5"] as bool;
  set alertStateCh5(bool value) => map["alertStateCh5"] = value;

  String get ch1Name => map["ch1Name"] as String;
  set ch1Name(String value) => map["ch1Name"] = value;

  String get ch2Name => map["ch2Name"] as String;
  set ch2Name(String value) => map["ch2Name"] = value;

  String get ch3Name => map["ch3Name"] as String;
  set ch3Name(String value) => map["ch3Name"] = value;

  String get ch4Name => map["ch4Name"] as String;
  set ch4Name(String value) => map["ch4Name"] = value;

  String get ch5Name => map["ch5Name"] as String;
  set ch5Name(String value) => map["ch5Name"] = value;

  double get upperThresholdCh1 => map["upperThresholdCh1"] as double;
  set upperThresholdCh1(double value) => map["upperThresholdCh1"] = value;

  double get upperThresholdCh2 => map["upperThresholdCh2"] as double;
  set upperThresholdCh2(double value) => map["upperThresholdCh2"] = value;

  double get upperThresholdCh3 => map["upperThresholdCh3"] as double;
  set upperThresholdCh3(double value) => map["upperThresholdCh3"] = value;

  double get upperThresholdCh4 => map["upperThresholdCh4"] as double;
  set upperThresholdCh4(double value) => map["upperThresholdCh4"] = value;

  double get upperThresholdCh5 => map["upperThresholdCh5"] as double;
  set upperThresholdCh5(double value) => map["upperThresholdCh5"] = value;

  double get lowerThresholdCh1 => map["lowerThresholdCh1"] as double;
  set lowerThresholdCh1(double value) => map["lowerThresholdCh1"] = value;

  double get lowerThresholdCh2 => map["lowerThresholdCh2"] as double;
  set lowerThresholdCh2(double value) => map["lowerThresholdCh2"] = value;

  double get lowerThresholdCh3 => map["lowerThresholdCh3"] as double;
  set lowerThresholdCh3(double value) => map["lowerThresholdCh3"] = value;

  double get lowerThresholdCh4 => map["lowerThresholdCh4"] as double;
  set lowerThresholdCh4(double value) => map["lowerThresholdCh4"] = value;

  double get lowerThresholdCh5 => map["lowerThresholdCh5"] as double;
  set lowerThresholdCh5(double value) => map["lowerThresholdCh5"] = value;

  bool get monitoringActiveCh1 => map["monitoringActiveCh1"] as bool;
  set monitoringActiveCh1(bool value) => map["monitoringActiveCh1"] = value;

  bool get monitoringActiveCh2 => map["monitoringActiveCh2"] as bool;
  set monitoringActiveCh2(bool value) => map["monitoringActiveCh2"] = value;

  bool get monitoringActiveCh3 => map["monitoringActiveCh3"] as bool;
  set monitoringActiveCh3(bool value) => map["monitoringActiveCh3"] = value;

  bool get monitoringActiveCh4 => map["monitoringActiveCh4"] as bool;
  set monitoringActiveCh4(bool value) => map["monitoringActiveCh4"] = value;

  bool get monitoringActiveCh5 => map["monitoringActiveCh5"] as bool;
  set monitoringActiveCh5(bool value) => map["monitoringActiveCh5"] = value;

  EventNodeConnection get events {
    if (map['eventSet'] is EventNodeConnection){
      return map['eventSet'] as EventNodeConnection;
    }
    return map['eventSet'] = EventNodeConnection.fromMap(map['eventSet'] as Map<String, dynamic>);
  }

  set events(EventNodeConnection value) => map["eventSet"] = value;

  static DeviceNode fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return DeviceNode()..map = map;
  }

  DeviceNode clone() => DeviceNode.fromMap(toJson() as Map<String, dynamic>, true);
}




