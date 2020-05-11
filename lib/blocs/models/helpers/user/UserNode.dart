import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class UserNode extends MapObject {
  String get id => map["id"] as String;

  String get homeDeviceImei => map["homeDeviceImei"] as String;
  set homeDeviceImei(String value) => map["homeDeviceImei"] = value;

  String get email => map["email"] as String;
  set email(String value) => map["email"] = value;

  String get firstName => map["firstName"] as String;
  set firstName(String value) => map["firstName"] = value;

  String get lastName => map["lastName"] as String;
  set lastName(String value) => map["lastName"] = value;

  String get role => map["role"] as String;
  set role(String value) => map["role"] = value;

  Avatar get avatar {
    if (map['avatar'] is Avatar) return map['avatar'] as Avatar;
    return map['avatar'] = Avatar.fromMap(map['avatar'] as Map<String, dynamic>);
  }
  set avatar(Avatar value) => map["avatar"] = value;

  UserNodeConnection get userNodeConnection {
    if (map['userSet'] is UserNodeConnection) return map['userSet'] as UserNodeConnection;
    return map['userSet'] =
        UserNodeConnection.fromMap(map['userSet'] as Map<String, dynamic>);
  }

  set userNodeConnection(UserNodeConnection value) => map["userSet"] = value;

  DeviceNodeConnection get deviceNodeConnection {
    if (map['devices'] is DeviceNodeConnection) return map['devices'] as DeviceNodeConnection;
    return map['devices'] =
        DeviceNodeConnection.fromMap(map['devices'] as Map<String, dynamic>);
  }

  set deviceNodeConnection(DeviceNodeConnection value) => map["devices"] = value;

  static UserNode fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return UserNode()..map = map;
  }

  UserNode clone() => UserNode.fromMap(toJson() as Map<String, dynamic>, true);
}