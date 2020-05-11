import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class Avatar extends MapObject {
  String get alt => map["alt"] as String;
  set alt(String value) => map["alt"] = value;

  String get url => map["url"] as String;
  set url(String value) => map["url"] = value;

  static Avatar fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Avatar()..map = map;
  }

  Avatar clone() => Avatar.fromMap(toJson() as Map<String, dynamic>, true);
}