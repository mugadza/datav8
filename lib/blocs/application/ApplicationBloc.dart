import 'dart:async';

import 'package:datav8/blocs/application/ApplicationEvents.dart';
import 'package:datav8/blocs/application/ApplicationStates.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final BehaviorSubject<GetInitialApplicationDataResult> _initialApplicationDataResultSubject;

  ApplicationBloc()
    : _initialApplicationDataResultSubject = BehaviorSubject.seeded(null);

  @override
  ApplicationState get initialState => ApplicationLoadingState();

  StreamSink<GetInitialApplicationDataResult> get initialApplicationDataResultSink => _initialApplicationDataResultSubject.sink;

  bool get hasInitialApplicationDataResult => _initialApplicationDataResultSubject.hasValue;

  GetInitialApplicationDataResult get initialApplicationDataResult => _initialApplicationDataResultSubject.value;

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is ApplicationStartedEvent) {
      yield ApplicationLoadingSuccessState();
    }
  }
}