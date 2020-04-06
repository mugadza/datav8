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

  static EventNode fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return EventNode()..map = map;
  }

  EventNode clone() => EventNode.fromMap(toJson() as Map<String, dynamic>, true);
}