import 'package:equatable/equatable.dart';

abstract class ApplicationState extends Equatable{
  const ApplicationState();
}

class ApplicationLoadingState extends ApplicationState {
  const ApplicationLoadingState();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ApplicationLoadingState';
}

class ApplicationLoadingSuccessState extends ApplicationState {
  const ApplicationLoadingSuccessState();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ApplicationLoadingSuccessState';
}