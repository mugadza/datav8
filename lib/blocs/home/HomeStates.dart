import 'package:datav8/blocs/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeState extends Equatable{
  const HomeState();
}

class HomeTabPressedState extends HomeState {
  final DeviceNodeFakeData model;
  const HomeTabPressedState(this.model);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeTabPressedState { model: $model }';
}

class HomeDataLoadingState extends HomeState {
  final DeviceNodeFakeData model;
  const HomeDataLoadingState(this.model);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeDataLoadingState { model: $model }';
}

class HomeDataLoadingSuccessState extends HomeState {
  final DeviceNode model;

  const HomeDataLoadingSuccessState(this.model);

  @override
  List<Object> get props => [model];

  @override
  String toString() => 'HomeDataLoadingSuccessState { model: $model }';
}

class HomeErrorState extends HomeState {
  final String error;

  const HomeErrorState({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'HomeErrorState { error: $error }';
}