import 'package:datav8/blocs/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeState extends Equatable{
  const HomeState();
}

class HomeTabPressedState extends HomeState {
  const HomeTabPressedState();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeTabPressedState';
}

class HomeDataLoadingState extends HomeState {
  const HomeDataLoadingState();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeDataLoadingState';
}

class HomeDataLoadingSuccessState extends HomeState {
  final GetHomeDataOperationResult model;

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