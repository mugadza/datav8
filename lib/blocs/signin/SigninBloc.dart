import 'dart:async';

import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  SigninBloc({@required this.userRepository, @required this.authenticationBloc})  
    : assert(userRepository != null),
      assert(authenticationBloc != null);

  SigninState get initialState => SigninInitialState();

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    if (event is SigninButtonPressedEvent) {
      yield SigninLoadingState();

      try {
        AuthenticationResult authenticatedResult = await userRepository.authenticate(email: event.email, password: event.password);
        await userRepository.persistToken(authenticatedResult.auth.token);

        authenticationBloc.applicationBloc.applicationData.homeDeviceSink.add(authenticatedResult.auth.user.homeDevice);
        authenticationBloc.applicationBloc.applicationData.userSink.add(authenticatedResult.auth.user);
        authenticationBloc.applicationBloc.applicationData.tokenAuthSink.add(authenticatedResult.auth);

        authenticationBloc.add(AuthenticationSuccessEvent(token: authenticatedResult.auth.token, user: authenticatedResult.auth.user));
        yield SigninInitialState();
      } 
      catch (error) {
        yield SigninFailureState(error: error.toString());
      }
    }
  }
}
