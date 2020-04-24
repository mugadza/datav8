import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

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