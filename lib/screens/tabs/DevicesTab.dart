import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceBloc, DeviceState>(
      builder: (BuildContext context, DeviceState state) {
        if(state is DeviceTabPressedState){
          BlocProvider.of<DeviceBloc>(context).add(DeviceDataLoadingEvent());
        }
        if(state is DeviceDataLoadingState || state is DeviceTabPressedState){
          return DevicesListScreen(loadCard: true);
        }
        else if(state is DeviceDataLoadingSuccessState){
          return DevicesListScreen(model: state.model, loadCard: false);
        }
        else {
          // TODO : implement a better error screen
          return Center(
            child: Text("Error"),
          ); // Error
        }
      },
    );
  }
}