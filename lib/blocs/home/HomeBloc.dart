import 'package:bloc/bloc.dart';
import 'package:datav8/blocs/application/ApplicationBloc.dart';
import 'package:datav8/blocs/helpers/ApplicationRepository.dart';
import 'package:datav8/blocs/home/HomeEvents.dart';
import 'package:datav8/blocs/home/HomeStates.dart';
import 'package:datav8/blocs/models/models.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApplicationBloc applicationBloc;
  final ApplicationRepository applicationRepository;

  HomeBloc({this.applicationBloc, this.applicationRepository});

  @override
  HomeState get initialState => HomeTabPressedState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeDataLoadingEvent) {
      yield HomeDataLoadingState();
      GetHomeDataOperationResult homeDataModel;
      try {
        homeDataModel = await applicationRepository.getHomeData();
      } 
      catch (error) {
        yield HomeErrorState(error: error.toString());
      }
      yield HomeDataLoadingSuccessState(homeDataModel);
    }
  }
}