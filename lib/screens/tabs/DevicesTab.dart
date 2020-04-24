import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/screens/helpers/CustomLoader.dart';
import 'package:datav8/screens/tabs/helpers/DevicesTabScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceBloc, DeviceState>(
      builder: (BuildContext context, DeviceState state) {
        if(state is DeviceTabPressedState){
          BlocProvider.of<DeviceBloc>(context).add(DeviceDataLoadingEvent());
          return CustomLoader();
        }
        if(state is DeviceDataLoadingState){
          return CustomLoader();
        }
        else if(state is DeviceDataLoadingSuccessState){
          return DevicesTabScreen(model: state.model);
        }
        else {
          return Center(
            child: Text("Error"),
          ); // Error
        }
      },
    );
  }
}