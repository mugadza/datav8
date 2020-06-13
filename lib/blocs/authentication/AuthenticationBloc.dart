import 'dart:async';

import 'package:datav8/blocs/authentication/AuthenticationEvents.dart';
import 'package:datav8/blocs/authentication/AuthenticationStates.dart';
import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/blocs/helpers/UserRepository.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  final ApplicationRepository applicationRepository;
  final ApplicationBloc applicationBloc;
  
  AuthenticationBloc({@required this.userRepository, @required this.applicationRepository, @required this.applicationBloc})
      : assert(userRepository != null), assert(applicationRepository != null), assert(applicationBloc != null);

  @override
  AuthenticationState get initialState => AuthenticationInitialState();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    bool hasToken = await userRepository.hasToken();

    if ( hasToken || (event is AuthenticatedEvent) )  {

      if (event is AuthenticatedEvent) {
        yield AuthenticationLoadingState();
        await userRepository.persistToken(event.token);
      }

      GetInitialApplicationDataResult result = await applicationRepository.getInitialApplicationData();
      applicationBloc.applicationData.userSink.add(result.user);
      yield AuthenticationAuthenticatedState(result.user);
    }
    else{
      yield AuthenticationUnauthenticatedState();
    }
  }
}

