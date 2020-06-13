import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

class SigninInitialState extends SigninState {
  @override
  String toString() => 'SigninInitialState';
}

class SigninLoadingState extends SigninState {
  @override
  String toString() => 'SigninLoadingState';
}

class SigninFailureState extends SigninState {
  final String error;

  const SigninFailureState({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'SigninFailureState { error: $error }';
}
