import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/screens/tabs/helpers/HomeTabScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) {
        if(state is HomeTabPressedState){
          BlocProvider.of<HomeBloc>(context).add(HomeDataLoadingEvent());
          return Center(
            child: Text("HomeTabPressedState")
          );
        }
        if(state is HomeDataLoadingState){
          return Center(
            child: Text("HomeDataLoadingState")
          );
        }
        else if(state is HomeDataLoadingSuccessState){
          return HomeTabScreen(model: state.model);
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