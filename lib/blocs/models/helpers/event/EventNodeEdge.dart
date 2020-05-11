import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

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