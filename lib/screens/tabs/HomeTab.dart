import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) {
        if(state is HomeTabPressedState || state is HomeDataLoadingState){
          DeviceNodeFakeData model = (state is HomeTabPressedState) ? state.model : (state as HomeDataLoadingState).model;
          return DeviceScreen(device: model.device, loadCard: true);
        }
        else if(state is HomeDataLoadingSuccessState){
          if (state.model == null) return Center(child: Text("No home device found"));
          return DeviceScreen(device: state.model, loadCard: false);
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