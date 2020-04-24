import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class GetHomeDataOperationResult extends MapObject {

  DeviceNodeConnection get device {
    if (map['userDevices'] is DeviceNodeConnection) return map['userDevices'] as DeviceNodeConnection;
    return map['userDevices'] =
        DeviceNodeConnection.fromMap(map['userDevices'] as Map<String, dynamic>);
  }

  set device(DeviceNodeConnection value) => map["userDevices"] = value;

  static GetHomeDataOperationResult fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return GetHomeDataOperationResult()..map = map;
  }

  GetHomeDataOperationResult clone() => GetHomeDataOperationResult.fromMap(toJson() as Map<String, dynamic>, true);
}
