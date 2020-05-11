import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class AccountError extends MapObject {
  String get field => map["field"] as String;

  String get message => map["message"] as String;

  String get code => map["code"] as String;

  static AccountError fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return AccountError()..map = map;
  }

  AccountError clone() => AccountError.fromMap(toJson() as Map<String, dynamic>, true);
}