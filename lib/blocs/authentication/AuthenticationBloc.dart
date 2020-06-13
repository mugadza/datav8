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

    if ( event is AuthenticationInitializedEvent ) {
      bool hasToken = await userRepository.hasToken();
      if( hasToken ) {
        yield AuthenticationLoadingState();
        GetInitialApplicationDataResult result = await applicationRepository.getInitialApplicationData();
        applicationBloc.applicationData.userSink.add(result.user);
        yield AuthenticationSuccessState(result.user);
      }
      else{
        yield AuthenticationFailureState(AuthenticationError.TOKEN_DOES_NOT_EXIST);
      }
    }

    if (event is AuthenticationSuccessEvent )  {
      yield AuthenticationSuccessState(event.user);
    }

    if (event is AuthenticationDeleteEvent) {
      await userRepository.deleteToken();
      yield AuthenticationFailureState(AuthenticationError.TOKEN_DELETED_USER_SIGNOUT);
    }
  }
}

