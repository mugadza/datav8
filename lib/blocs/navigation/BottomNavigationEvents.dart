import 'package:datav8/blocs/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class BottomNagivationEvent extends Equatable{
  const BottomNagivationEvent();
}

class BottomNavigationTabUpdatedEvent extends BottomNagivationEvent {
  final ApplicationTab applicationTab;

  const BottomNavigationTabUpdatedEvent(this.applicationTab);

  @override
  List<Object> get props => [applicationTab];

  @override
  String toString() => 'BottomNavigationTabUpdatedEvent { ApplicationTab: $applicationTab }';
}