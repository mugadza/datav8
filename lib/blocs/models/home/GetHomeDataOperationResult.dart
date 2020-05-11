import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class GetHomeDataOperationResult extends MapObject {

  DeviceNode get device {
    if (map['homeDevice'] is DeviceNode) return map['homeDevice'] as DeviceNode;
    return map['homeDevice'] = DeviceNode.fromMap(map['homeDevice'] as Map<String, dynamic>);
  }

  set device(DeviceNode value) => map["homeDevice"] = value;

  static GetHomeDataOperationResult fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return GetHomeDataOperationResult()..map = map;
  }

  GetHomeDataOperationResult clone() => GetHomeDataOperationResult.fromMap(toJson() as Map<String, dynamic>, true);
}
