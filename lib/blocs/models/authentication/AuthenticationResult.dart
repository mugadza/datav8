import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';


class AuthenticationResult extends MapObject {

  TokenAuth get auth {
    if (map['tokenCreate'] is TokenAuth) return map['tokenCreate'] as TokenAuth;
    return map['tokenCreate'] = TokenAuth.fromMap(map['tokenCreate'] as Map<String, dynamic>);
  }

  static AuthenticationResult fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return AuthenticationResult()..map = map;
  }

  AuthenticationResult clone() => AuthenticationResult.fromMap(toJson() as Map<String, dynamic>, true);
}


























