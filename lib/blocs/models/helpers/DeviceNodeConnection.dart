import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

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

  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;

  static DeviceNodeConnection fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return DeviceNodeConnection()..map = map;
  }

  DeviceNodeConnection clone() => DeviceNodeConnection.fromMap(toJson() as Map<String, dynamic>, true);
}
