import 'package:datav8/blocs/application/ApplicationEvents.dart';
import 'package:datav8/blocs/application/ApplicationStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  @override
  ApplicationState get initialState => ApplicationLoadingState();

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is ApplicationStartedEvent) {
      yield ApplicationLoadingSuccessState();
    }
  }
}