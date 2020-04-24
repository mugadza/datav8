import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/screens/helpers/CustomLoader.dart';
import 'package:datav8/screens/tabs/helpers/DeviceScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) {
        if(state is HomeTabPressedState){
          BlocProvider.of<HomeBloc>(context).add(HomeDataLoadingEvent());
          return CustomLoader();
        }
        if(state is HomeDataLoadingState){
          return CustomLoader();
        }
        else if(state is HomeDataLoadingSuccessState){
          if (state.model.device.edges.isEmpty) return Center(child: Text("No home device found"));
          
          return DeviceScreen(device: state.model.device.edges.first.node);
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