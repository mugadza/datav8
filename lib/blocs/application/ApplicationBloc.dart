import 'dart:async';

import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final ApplicationData applicationData;
  final AuthenticationBloc authenticationBloc;

  ApplicationBloc({@required this.authenticationBloc})
      : applicationData = ApplicationData();

  @override
  ApplicationState get initialState => ApplicationLoadingState();

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is ApplicationStartedEvent) {
      authenticationBloc.add(AuthenticationInitializedEvent());
      yield ApplicationLoadingSuccessState();
    }
  }
}