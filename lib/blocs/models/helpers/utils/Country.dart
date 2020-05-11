import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class Country extends MapObject {
  String get code => map["code"] as String;
  set code(String value) => map["code"] = value;

  String get country => map["country"] as String;
  set country(String value) => map["country"] = value;

  static Country fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Country()..map = map;
  }

  Country clone() => Country.fromMap(toJson() as Map<String, dynamic>, true);
}