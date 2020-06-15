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

class AuthenticationSuccessState extends AuthenticationState {
  final UserNode user;

  AuthenticationSuccessState(this.user);
  
  @override
  String toString() => 'AuthenticationSuccessState';
}

class AuthenticationFailureState extends AuthenticationState {
  final AuthenticationError error;

  AuthenticationFailureState(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'AuthenticationFailureState: { error: $error }';
}

class AuthenticationLoadingState extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoadingState';
}
