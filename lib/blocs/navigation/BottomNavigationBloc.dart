import 'package:bloc/bloc.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/blocs/navigation/BottomNavigationEvents.dart';

class BottomNavigationBloc extends Bloc<BottomNagivationEvent, ApplicationTab> {
  final dynamic homeBloc;

  BottomNavigationBloc({this.homeBloc});

  @override
  ApplicationTab get initialState => ApplicationTab.HOME;

  @override
  Stream<ApplicationTab> mapEventToState(BottomNagivationEvent event) async* {
    if (event is BottomNavigationTabUpdatedEvent) {
      _mapTabEnumarationToEvent(event.applicationTab);
      yield event.applicationTab;
    }
  }

  void _mapTabEnumarationToEvent(ApplicationTab applicationTab) {
    switch (applicationTab) {
      case ApplicationTab.HOME:
        // homeBloc.add(HomeDataLoadingEvent());
        break;

      case ApplicationTab.DEVICES:
        //homeBloc.add(HomeDataLoadingEvent());
        break;

      case ApplicationTab.PROFILE:
        //homeBloc.add(HomeDataLoadingEvent());
        break;
      default:
        // Error screen
        //homeBloc.add(HomeDataLoadingEvent());
        break;
    }
  }
}