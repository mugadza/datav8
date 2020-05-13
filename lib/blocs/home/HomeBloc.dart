import 'package:bloc/bloc.dart';
import 'package:datav8/blocs/application/ApplicationBloc.dart';
import 'package:datav8/blocs/helpers/ApplicationRepository.dart';
import 'package:datav8/blocs/home/HomeEvents.dart';
import 'package:datav8/blocs/home/HomeStates.dart';
import 'package:datav8/blocs/models/models.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApplicationBloc applicationBloc;
  final ApplicationRepository applicationRepository;
  final DeviceNodeFakeData _deviceNodeFakeData;

  HomeBloc({this.applicationBloc, this.applicationRepository})
    : _deviceNodeFakeData = DeviceNodeFakeData();

  @override
  HomeState get initialState => HomeTabPressedState(_deviceNodeFakeData);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeDataLoadingEvent) {
      yield HomeDataLoadingState(_deviceNodeFakeData);
      if ( applicationBloc.hasInitialApplicationDataResult ){
        yield HomeDataLoadingSuccessState(applicationBloc.initialApplicationDataResult.user.homeDevice);
      }
    }
  }
}