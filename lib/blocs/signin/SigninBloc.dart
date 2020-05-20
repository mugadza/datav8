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
  final BehaviorSubject<AuthenticationResult> _authenticatedResultSubject;
  final BehaviorSubject<UserNode> _userNodeSubject;

  SigninBloc({@required this.userRepository, @required this.authenticationBloc})  
    : assert(userRepository != null),
      assert(authenticationBloc != null),
      _userNodeSubject = BehaviorSubject.seeded(null),
      _authenticatedResultSubject = BehaviorSubject.seeded(null);

  SigninState get initialState => SigninInitialState();

  AuthenticationResult get authenticationResult => _authenticatedResultSubject.value;

  UserNode get userNode => _userNodeSubject.value;

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    bool hasToken = await userRepository.hasToken();
    bool isSignOutEvent = event is SignoutButtonPressedEvent;
    
    if(!isSignOutEvent && hasToken){
      yield SigninSuccessState();
    }
    else if (event is SigninButtonPressedEvent) {
      yield SigninLoadingState();

      try {
        AuthenticationResult authenticatedResult = await userRepository.authenticate(email: event.email, password: event.password);
        _authenticatedResultSubject.sink.add(authenticatedResult);

        await userRepository.persistToken(authenticatedResult.auth.token);
        GetInitialApplicationDataResult result = await authenticationBloc.applicationRepository.getInitialApplicationData();
        authenticationBloc.applicationBloc.initialApplicationDataResultSink.add(result);

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

  void dispose(){
    _authenticatedResultSubject.close();
    _userNodeSubject.close();
  }
}
