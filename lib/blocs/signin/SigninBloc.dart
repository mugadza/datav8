import 'dart:async';


import 'package:datav8/blocs/authentication/AuthenticationBloc.dart';
import 'package:datav8/blocs/helpers/UserRepository.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/blocs/signin/SigninEvents.dart';
import 'package:datav8/blocs/signin/SigninStates.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  SigninBloc({@required this.userRepository, @required this.authenticationBloc})  
    : assert(userRepository != null),
      assert(authenticationBloc != null);

  SigninState get initialState => SigninInitialState();

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    bool hasToken = await userRepository.hasToken();

    if(!(event is SignoutButtonPressedEvent) && hasToken){
      yield SigninSuccessState();
    }
    else if (event is SigninButtonPressedEvent) {
      yield SigninLoadingState();

      try {
        AuthenticationResult authenticatedResult = await userRepository.authenticate(email: event.email, password: event.password);
        await userRepository.persistToken(authenticatedResult.auth.token);

        // TODO : get initial data
        // GetInitialApplicationDataResult result = await authenticationBloc.applicationRepository.getInitialApplicationData();

        authenticationBloc.applicationBloc.applicationData.homeDeviceSink.add(authenticatedResult.auth.user.homeDevice);

        authenticationBloc.applicationBloc.applicationData.userSink.add(authenticatedResult.auth.user);
        authenticationBloc.applicationBloc.applicationData.tokenAuthSink.add(authenticatedResult.auth);

        yield SigninSuccessState();
      } 
      catch (error) {
        yield SigninFailureState(error: error.toString());
      }
    }
    else if (event is SignoutButtonPressedEvent) {
      await userRepository.deleteToken();
      yield SignoutSuccessState();
    }
  }
}
