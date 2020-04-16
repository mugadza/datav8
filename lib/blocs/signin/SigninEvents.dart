import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class SigninEvent extends Equatable {
  const SigninEvent();
  
  @override
  List<Object> get props => [];
}

class SigninButtonPressedEvent extends SigninEvent {
  final String email;
  final String password;

  const SigninButtonPressedEvent({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'SigninButtonPressedEvent { email: $email, password: $password }';
}

class InitiateSigninEvent extends SigninEvent {
  @override
  String toString() => 'InitiateSigninEvent';
}

class SignoutButtonPressedEvent extends SigninEvent {
  @override
  String toString() => 'SignoutButtonPressedEvent';
}
