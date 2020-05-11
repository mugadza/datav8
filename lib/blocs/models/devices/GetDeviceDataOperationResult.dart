import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class GetDeviceDataOperationResult extends MapObject {

  DeviceNodeConnection get device {
    if (map['devices'] is DeviceNodeConnection) return map['devices'] as DeviceNodeConnection;
    return map['devices'] =
        DeviceNodeConnection.fromMap(map['devices'] as Map<String, dynamic>);
  }

  set device(DeviceNodeConnection value) => map["devices"] = value;

  static GetDeviceDataOperationResult fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return GetDeviceDataOperationResult()..map = map;
  }

  GetDeviceDataOperationResult clone() => GetDeviceDataOperationResult.fromMap(toJson() as Map<String, dynamic>, true);
}

