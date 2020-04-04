import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/utils/utils.dart';
import 'package:flutter/material.dart';

class ApplicationTabIcon {
  static Icon of(ApplicationTab tab) {
    switch (tab) {
      case ApplicationTab.HOME:
        return Icon(Icons.home, color: Colors.grey, key: ApplicationKeys.applicationHomeTab);

      case ApplicationTab.DEVICES:
        return Icon(Icons.device_hub, color: Colors.grey, key: ApplicationKeys.applicationDeviceTab);

      case ApplicationTab.PROFILE:
        return Icon(Icons.settings, color: Colors.grey, key: ApplicationKeys.applicationProfileTab);
      default:
        // Error screen
        return Icon(Icons.error);
        break;
    }
  }
}