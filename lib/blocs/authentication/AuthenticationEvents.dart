import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationInitializedEvent extends AuthenticationEvent {
  @override
  String toString() => 'AuthenticationInitializedEvent';
}

class AuthenticatedEvent extends AuthenticationEvent {
  final String token;

  const AuthenticatedEvent({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'AuthenticatedEvent { token: $token }';
}
