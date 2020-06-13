import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

///
/// This event is triggered when the application start.
/// This will tell the application to check if there exists a token on the
/// device memory. This will result in [AuthenticationSuccessState] being
/// triggered if the token exits or [AuthenticationFailureState] with an error
/// [AuthenticationError.TOKEN_DOES_NOT_EXIST].
///

class AuthenticationInitializedEvent extends AuthenticationEvent {
  @override
  String toString() => 'AuthenticationInitializedEvent';
}

/// This event is triggered when the state of [AuthenticationBloc] is
/// [AuthenticationFailureState] with an error [AuthenticationError.TOKEN_DOES_NOT_EXIST].
/// This will call the API to get the auth token. Based on the response from the API
/// it will then trigger [AuthenticationSuccessState] or [AuthenticationFailureState]
/// with one of the following errors:
///   - [AuthenticationError.ACCOUNT_ERROR_INVALID_CREDENTIAL]
///   - [AuthenticationError.ACCOUNT_ERROR_DEVICE_NETWORK]
///


/// The final event to be triggered by the [AuthenticationBloc]. This is triggered
/// when the application has obtained a valid token.

class AuthenticationSuccessEvent extends AuthenticationEvent {
  final String token;
  final UserNode user;

  const AuthenticationSuccessEvent({@required this.token, @required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'AuthenticationSuccessEvent { token: $token, user: $user }';
}

/// This event is triggered when the user signs out of the application.
/// This will make sure that the token is removed from device memory

class AuthenticationDeleteEvent extends AuthenticationEvent {
  @override
  String toString() => 'AuthenticationDeleteEvent';
}



///
/// This event if triggered when the above events result in any authentication error
/// as described for each event.
///

//class AuthenticationFailedEvent extends AuthenticationEvent {
//  final AuthenticationError error;
//
//  AuthenticationFailedEvent({@required this.error});
//
//  @override
//  List<Object> get props => [error];
//
//  @override
//  String toString() => 'AuthenticationFailedEvent: { error: $error }';
//}
