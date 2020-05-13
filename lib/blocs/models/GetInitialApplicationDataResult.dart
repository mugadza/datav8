import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class GetInitialApplicationDataResult extends MapObject {

  UserNode get user {
    if (map['me'] is UserNode) return map['me'] as UserNode;
    return map['me'] = UserNode.fromMap(map['me'] as Map<String, dynamic>);
  }

  set user(UserNode value) => map["me"] = value;

  static GetInitialApplicationDataResult fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return GetInitialApplicationDataResult()..map = map;
  }

  GetInitialApplicationDataResult clone() => GetInitialApplicationDataResult.fromMap(toJson() as Map<String, dynamic>, true);
}
