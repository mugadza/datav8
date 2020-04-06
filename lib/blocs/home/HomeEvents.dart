import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable{
  const HomeEvent();
}

class HomeDataLoadingEvent extends HomeEvent {

  const HomeDataLoadingEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeDataLoadingEvent';
}
