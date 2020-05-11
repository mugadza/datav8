import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class UserNodeConnection extends MapObject {
  List<UserNodeEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<UserNodeEdge>){
      return map['edges'] as List<UserNodeEdge>;
    }

    List<UserNodeEdge> items = [];
    for (dynamic aVar in map['edges']){
      items.add(UserNodeEdge.fromMap(aVar as Map<String, dynamic>));
    }

    return map['edges'] = items;
  }

  set edges(List<UserNodeEdge> value) => map["edges"] = value;

  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;

  static UserNodeConnection fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return UserNodeConnection()..map = map;
  }

  UserNodeConnection clone() => UserNodeConnection.fromMap(toJson() as Map<String, dynamic>, true);
}
