import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

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