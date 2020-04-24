import 'package:equatable/equatable.dart';

abstract class DeviceEvent extends Equatable{
  const DeviceEvent();
}

class DeviceDataLoadingEvent extends DeviceEvent {

  const DeviceDataLoadingEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeviceDataLoadingEvent';
}
