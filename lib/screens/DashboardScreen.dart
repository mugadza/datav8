import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/screens/helpers/helpers.dart';
import 'package:datav8/screens/tabs/DevicesTab.dart';
import 'package:datav8/screens/tabs/HomeTab.dart';
import 'package:datav8/screens/tabs/ProfileTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DashboardScreen extends StatefulWidget {
  final BottomNavigationBloc bottomNavigationBloc;

  DashboardScreen({@required this.bottomNavigationBloc});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

/// Component UI
class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  _afterLayout(_) {
    widget.bottomNavigationBloc.add(BottomNavigationTabUpdatedEvent(ApplicationTab.HOME));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, ApplicationTab>(
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
        return DevicesTab();

      case ApplicationTab.PROFILE:
        return ProfileTab(signinBloc: BlocProvider.of<SigninBloc>(context));

      default:
        return Center(
          child: Text("ERROR"),
        );
    }
  }
}