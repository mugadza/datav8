import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class UserNodeEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  
  UserNode get node {
    if (map['node'] is UserNode) return map['node'] as UserNode;
    return map['node'] = UserNode.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(UserNode value) => map["node"] = value;

  static UserNodeEdge fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return UserNodeEdge()..map = map;
  }

  UserNodeEdge clone() => UserNodeEdge.fromMap(toJson() as Map<String, dynamic>, true);
}