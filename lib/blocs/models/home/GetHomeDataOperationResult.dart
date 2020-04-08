import 'dart:convert';

import 'package:dart_graphql/dart_graphql.dart';

class PageInfo extends MapObject {
  String get endCursor => map["endCursor"] as String;
  set endCursor(String value) => map["endCursor"] = value;

  bool get hasNextPage => map["hasNextPage"] as bool;
  set hasNextPage(bool value) => map["hasNextPage"] = value;

  bool get hasPreviousPage => map["hasPreviousPage"] as bool;
  set hasPreviousPage(bool value) => map["hasPreviousPage"] = value;

  String get startCursor => map["startCursor"] as String;
  set startCursor(String value) => map["startCursor"] = value;

  static PageInfo fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return PageInfo()..map = map;
  }

  PageInfo clone() => PageInfo.fromMap(toJson() as Map<String, dynamic>, true);
}


class GetHomeDataOperationResult extends MapObject {

  DeviceNodeConnection get device {
    if (map['allDevices'] is DeviceNodeConnection) return map['allDevices'] as DeviceNodeConnection;
    return map['allDevices'] =
        DeviceNodeConnection.fromMap(map['allDevices'] as Map<String, dynamic>);
  }

  set device(DeviceNodeConnection value) => map["allDevices"] = value;

  static GetHomeDataOperationResult fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return GetHomeDataOperationResult()..map = map;
  }

  GetHomeDataOperationResult clone() => GetHomeDataOperationResult.fromMap(toJson() as Map<String, dynamic>, true);
}

class DeviceNodeConnection extends MapObject {
  List<DeviceNodeEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<DeviceNodeEdge>){
      return map['edges'] as List<DeviceNodeEdge>;
    }

    List<DeviceNodeEdge> items = [];
    for (dynamic aVar in map['edges']){
      items.add(DeviceNodeEdge.fromMap(aVar as Map<String, dynamic>));
    }

    return map['edges'] = items;
  }

  set edges(List<DeviceNodeEdge> value) => map["edges"] = value;

  static DeviceNodeConnection fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return DeviceNodeConnection()..map = map;
  }

  DeviceNodeConnection clone() => DeviceNodeConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

class DeviceNodeEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  
  DeviceNode get node {
    if (map['node'] is DeviceNode) return map['node'] as DeviceNode;
    return map['node'] = DeviceNode.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(DeviceNode value) => map["node"] = value;

  static DeviceNodeEdge fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return DeviceNodeEdge()..map = map;
  }

  DeviceNodeEdge clone() => DeviceNodeEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

class DeviceNode extends MapObject {
  String get imei => map["imei"] as String;
  set imei(String value) => map["imei"] = value;

  String get unitName => map["unitName"] as String;
  set unitName(String value) => map["unitName"] = value;

  String get unitLocation => map["unitLocation"] as String;
  set unitLocation(String value) => map["unitLocation"] = value;

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

// ------------------------------------ Device Events ----------------------------- -------

class EventNodeConnection extends MapObject {
  List<EventNodeEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<EventNodeEdge>){
      return map['edges'] as List<EventNodeEdge>;
    }

    List<EventNodeEdge> items = [];
    for (dynamic aVar in map['edges']){
      items.add(EventNodeEdge.fromMap(aVar as Map<String, dynamic>));
    }

    return map['edges'] = items;
  }

  set edges(List<EventNodeEdge> value) => map["edges"] = value;

  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;

  static EventNodeConnection fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return EventNodeConnection()..map = map;
  }

  EventNodeConnection clone() => EventNodeConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

class EventNodeEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  
  EventNode get node {
    if (map['node'] is EventNode) return map['node'] as EventNode;
    return map['node'] = EventNode.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(EventNode value) => map["node"] = value;

  static EventNodeEdge fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return EventNodeEdge()..map = map;
  }

  EventNodeEdge clone() => EventNodeEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

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