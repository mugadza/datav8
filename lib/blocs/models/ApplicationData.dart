import 'dart:async';

import 'package:datav8/blocs/models/models.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationData {
  final BehaviorSubject<UserNode> _userSubject;
  final BehaviorSubject<TokenAuth> _tokenAuthSubject;
  final BehaviorSubject<DeviceNode> _homeDeviceSubject;

  ApplicationData()
    : _userSubject = BehaviorSubject.seeded(null),
      _homeDeviceSubject = BehaviorSubject.seeded(null),
      _tokenAuthSubject = BehaviorSubject.seeded(null);

  StreamSink<UserNode> get userSink => _userSubject.sink;
  bool get hasUser => _userSubject.hasValue;
  UserNode get user => _userSubject.value;

  StreamSink<TokenAuth> get tokenAuthSink => _tokenAuthSubject.sink;
  bool get hasTokenAuth => _tokenAuthSubject.hasValue;
  TokenAuth get tokenAuth => _tokenAuthSubject.value;

  StreamSink<DeviceNode> get homeDeviceSink => _homeDeviceSubject.sink;
  bool get hasHomeDevice => _homeDeviceSubject.hasValue;
  DeviceNode get homeDevice => _homeDeviceSubject.value;
}
