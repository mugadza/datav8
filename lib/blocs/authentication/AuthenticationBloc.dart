import 'dart:async';

import 'package:datav8/blocs/authentication/AuthenticationEvents.dart';
import 'package:datav8/blocs/authentication/AuthenticationStates.dart';
import 'package:datav8/blocs/helpers/UserRepository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitializedState();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {

    bool hasToken = await userRepository.hasToken();
    if (event is AuthenticatedEvent) {
      yield AuthenticationLoadingState();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticatedState();
    }
    else if (hasToken) {
      yield AuthenticationAuthenticatedState();
    } 
    else{
      yield AuthenticationUnauthenticatedState();
    }
  }
}
