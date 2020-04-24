import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

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