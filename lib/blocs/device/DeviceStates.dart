import 'package:datav8/blocs/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class DeviceState extends Equatable{
  const DeviceState();
}

class DeviceTabPressedState extends DeviceState {
  const DeviceTabPressedState();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeviceTabPressedState';
}

class DeviceDataLoadingState extends DeviceState {
  const DeviceDataLoadingState();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeviceDataLoadingState';
}

class DeviceDataLoadingSuccessState extends DeviceState {
  final GetDeviceDataOperationResult model;

  const DeviceDataLoadingSuccessState(this.model);

  @override
  List<Object> get props => [model];

  @override
  String toString() => 'DeviceDataLoadingSuccessState { model: $model }';
}

class DeviceErrorState extends DeviceState {
  final String error;

  const DeviceErrorState({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'DeviceErrorState { error: $error }';
}