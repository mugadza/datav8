import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/screens/helpers/helpers.dart';
import 'package:datav8/screens/tabs/HomeTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, ApplicationTab>(
      condition: (previous, current){
        return previous != current; 
      },
      builder: (BuildContext context, ApplicationTab activeTab) {
        return Scaffold(
          body: getActiveTab(context, activeTab),
          bottomNavigationBar: BottomNavigationSelector(
            activeApplicationTab: activeTab,
            onApplicationTabSelected: (applicationTab) => BlocProvider.of<BottomNavigationBloc>(context).add(BottomNavigationTabUpdatedEvent(applicationTab)),
          )
        );
      },
    );
  }

  Widget getActiveTab(BuildContext context, ApplicationTab activeTab) {
    switch (activeTab) {
      case ApplicationTab.HOME:
        return HomeTab();

      case ApplicationTab.DEVICES:
        return Center(
          child: Text("DEVICES"),
        );

      case ApplicationTab.PROFILE:
        return Center(
          child: Text("PROFILE"),
        );

      default:
        // Error screen
        return Center(
          child: Text("ERROR"),
        );
    }
  }

}