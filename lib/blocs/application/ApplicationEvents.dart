import 'package:equatable/equatable.dart';

abstract class ApplicationEvent extends Equatable{
  const ApplicationEvent();
}

class ApplicationStartedEvent extends ApplicationEvent {

  const ApplicationStartedEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ApplicationStartedEvent';
}