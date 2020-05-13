import 'package:datav8/blocs/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationUninitializedState extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUninitializedState';
}

class AuthenticationAuthenticatedState extends AuthenticationState {
  final GetInitialApplicationDataResult initialApplicationDataResult;

  AuthenticationAuthenticatedState(this.initialApplicationDataResult);
  
  @override
  String toString() => 'AuthenticationAuthenticatedState';
}

class AuthenticationUnauthenticatedState extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticatedState';
}

class AuthenticationLoadingState extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoadingState';
}
