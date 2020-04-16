import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class AuthenticationResult extends MapObject {

  TokenAuth get auth {
    if (map['tokenAuth'] is TokenAuth) return map['tokenAuth'] as TokenAuth;
    return map['tokenAuth'] =
        TokenAuth.fromMap(map['tokenAuth'] as Map<String, dynamic>);
  }

  set auth(TokenAuth value) => map["tokenAuth"] = value;

  static AuthenticationResult fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return AuthenticationResult()..map = map;
  }

  AuthenticationResult clone() => AuthenticationResult.fromMap(toJson() as Map<String, dynamic>, true);
}

class TokenAuth extends MapObject {
  String get token => map["token"] as String;
  set token(String value) => map["token"] = value;

  static TokenAuth fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return TokenAuth()..map = map;
  }

  TokenAuth clone() => TokenAuth.fromMap(toJson() as Map<String, dynamic>, true);
}