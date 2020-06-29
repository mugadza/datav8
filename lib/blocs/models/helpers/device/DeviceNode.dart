import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class DeviceNode extends MapObject {
  String get imei => map["imei"] as String;
  set imei(String value) => map["imei"] = value;

  String get unitName => map["unitName"] as String;
  set unitName(String value) => map["unitName"] = value;

  String get unitAdminName => map["unitAdminName"] as String;
  set unitAdminName(String value) => map["unitAdminName"] = value;

  String get unitAdminPhoneNumber => map["unitAdminPhoneNumber"] as String;
  set unitAdminPhoneNumber(String value) => map["unitAdminPhoneNumber"] = value;

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

  String get unitsCh1 => map["unitsCh1"] as String;
  set unitsCh1(String value) => map["unitsCh1"] = value;

  String get unitsCh2 => map["unitsCh2"] as String;
  set unitsCh2(String value) => map["unitsCh2"] = value;

  String get unitsCh3 => map["unitsCh3"] as String;
  set unitsCh3(String value) => map["unitsCh3"] = value;

  String get unitsCh4 => map["unitsCh4"] as String;
  set unitsCh4(String value) => map["unitsCh4"] = value;

  String get unitsCh5 => map["unitsCh5"] as String;
  set unitsCh5(String value) => map["unitsCh5"] = value;

  String get ch1SensorType => map["ch1SensorType"] as String;
  set ch1SensorType(String value) => map["ch1SensorType"] = value;

  String get ch2SensorType => map["ch2SensorType"] as String;
  set ch2SensorType(String value) => map["ch2SensorType"] = value;

  String get ch3SensorType => map["ch3SensorType"] as String;
  set ch3SensorType(String value) => map["ch3SensorType"] = value;

  String get ch4SensorType => map["ch4SensorType"] as String;
  set ch4SensorType(String value) => map["ch4SensorType"] = value;

  String get ch5SensorType => map["ch5SensorType"] as String;
  set ch5SensorType(String value) => map["ch5SensorType"] = value;

  double get upperThresholdCh1 => doubleValue(map["upperThresholdCh1"]);
  set upperThresholdCh1(double value) => map["upperThresholdCh1"] = value;

  double get upperThresholdCh2 => doubleValue(map["upperThresholdCh2"]);
  set upperThresholdCh2(double value) => map["upperThresholdCh2"] = value;

  double get upperThresholdCh3 => doubleValue(map["upperThresholdCh3"]);
  set upperThresholdCh3(double value) => map["upperThresholdCh3"] = value;

  double get upperThresholdCh4 => doubleValue(map["upperThresholdCh4"]);
  set upperThresholdCh4(double value) => map["upperThresholdCh4"] = value;

  double get upperThresholdCh5 => doubleValue(map["upperThresholdCh5"]);
  set upperThresholdCh5(double value) => map["upperThresholdCh5"] = value;

  double get lowerThresholdCh1 => doubleValue(map["lowerThresholdCh1"]);
  set lowerThresholdCh1(double value) => map["lowerThresholdCh1"] = value;

  double get lowerThresholdCh2 => doubleValue(map["lowerThresholdCh2"]);
  set lowerThresholdCh2(double value) => map["lowerThresholdCh2"] = value;

  double get lowerThresholdCh3 => doubleValue(map["lowerThresholdCh3"]);
  set lowerThresholdCh3(double value) => map["lowerThresholdCh3"] = value;

  double get lowerThresholdCh4 => doubleValue(map["lowerThresholdCh4"]);
  set lowerThresholdCh4(double value) => map["lowerThresholdCh4"] = value;

  double get lowerThresholdCh5 => doubleValue(map["lowerThresholdCh5"]);
  set lowerThresholdCh5(double value) => map["lowerThresholdCh5"] = value;

  double get scaleFactorCh1 => doubleValue(map["scaleFactorCh1"]);
  set scaleFactorCh1(double value) => map["scaleFactorCh1"] = value;

  double get scaleFactorCh2 => doubleValue(map["scaleFactorCh2"]);
  set scaleFactorCh2(double value) => map["scaleFactorCh2"] = value;

  double get scaleFactorCh3 => doubleValue(map["scaleFactorCh3"]);
  set scaleFactorCh3(double value) => map["scaleFactorCh3"] = value;

  double get scaleFactorCh4 => doubleValue(map["scaleFactorCh4"]);
  set scaleFactorCh4(double value) => map["scaleFactorCh4"] = value;

  double get scaleFactorCh5 => doubleValue(map["scaleFactorCh5"]);
  set scaleFactorCh5(double value) => map["scaleFactorCh5"] = value;

  double get zeroOffsetCh1 => doubleValue(map["zeroOffsetCh1"]);
  set zeroOffsetCh1(double value) => map["zeroOffsetCh1"] = value;

  double get zeroOffsetCh2 => doubleValue(map["zeroOffsetCh2"]);
  set zeroOffsetCh2(double value) => map["zeroOffsetCh2"] = value;

  double get zeroOffsetCh3 => doubleValue(map["zeroOffsetCh3"]);
  set zeroOffsetCh3(double value) => map["zeroOffsetCh3"] = value;

  double get zeroOffsetCh4 => doubleValue(map["zeroOffsetCh4"]);
  set zeroOffsetCh4(double value) => map["zeroOffsetCh4"] = value;

  double get zeroOffsetCh5 => doubleValue(map["zeroOffsetCh5"]);
  set zeroOffsetCh5(double value) => map["zeroOffsetCh5"] = value;

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

  bool get ch1MasksAlerts => map["ch1MasksAlerts"] as bool;
  set ch1MasksAlerts(bool value) => map["ch1MasksAlerts"] = value;

  bool get ch2MasksAlerts => map["ch2MasksAlerts"] as bool;
  set ch2MasksAlerts(bool value) => map["ch2MasksAlerts"] = value;

  bool get ch3MasksAlerts => map["ch3MasksAlerts"] as bool;
  set ch3MasksAlerts(bool value) => map["ch3MasksAlerts"] = value;

  bool get ch4MasksAlerts => map["ch4MasksAlerts"] as bool;
  set ch4MasksAlerts(bool value) => map["ch4MasksAlerts"] = value;

  bool get ch5MasksAlerts => map["ch5MasksAlerts"] as bool;
  set ch5MasksAlerts(bool value) => map["ch5MasksAlerts"] = value;

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
