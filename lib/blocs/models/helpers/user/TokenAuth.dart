import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class TokenAuth extends MapObject {
  String get token => map["token"] as String;
  set token(String value) => map["token"] = value;

  UserNode get user {
    if (map['user'] is UserNode) return map['user'] as UserNode;
    return map['user'] = UserNode.fromMap(map['user'] as Map<String, dynamic>);
  }
  set user(UserNode value) => map["user"] = value;

  List<AccountError> get accountErrors {
    if (map['accountErrors'] == null || map['accountErrors'] is List<AccountError>){
      return map['accountErrors'] as List<AccountError>;
    }

    List<AccountError> items = [];
    for (dynamic aVar in map['accountErrors']){
      items.add(AccountError.fromMap(aVar as Map<String, dynamic>));
    }

    return map['accountErrors'] = items;
  }

  static TokenAuth fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return TokenAuth()..map = map;
  }

  TokenAuth clone() => TokenAuth.fromMap(toJson() as Map<String, dynamic>, true);
}
