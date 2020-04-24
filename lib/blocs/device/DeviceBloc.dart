import 'package:bloc/bloc.dart';
import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/blocs/models/models.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final ApplicationBloc applicationBloc;
  final ApplicationRepository applicationRepository;

  DeviceBloc({this.applicationBloc, this.applicationRepository});

  @override
  DeviceState get initialState => DeviceTabPressedState();

  @override
  Stream<DeviceState> mapEventToState(DeviceEvent event) async* {
    if (event is DeviceDataLoadingEvent) {
      try {
        yield DeviceDataLoadingState();
        GetDeviceDataOperationResult deviceDataModel = await applicationRepository.getAllUserDevicesData();
        yield DeviceDataLoadingSuccessState(deviceDataModel); 
      } 
      catch (error) {
        yield DeviceErrorState(error: error.toString());
      }
    }
  }
}