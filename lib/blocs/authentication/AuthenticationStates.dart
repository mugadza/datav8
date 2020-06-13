import 'package:datav8/blocs/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationInitialState extends AuthenticationState {
  @override
  String toString() => 'AuthenticationInitialState';
}

class AuthenticationAuthenticatedState extends AuthenticationState {
  final UserNode user;

  AuthenticationAuthenticatedState(this.user);
  
  @override
  String toString() => 'AuthenticationAuthenticatedState: {$user}';
}

class AuthenticationUnauthenticatedState extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticatedState';
}

class AuthenticationLoadingState extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoadingState';
}
