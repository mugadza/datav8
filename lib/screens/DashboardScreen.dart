import 'package:datav8/blocs/blocs.dart';
import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/screens/helpers/helpers.dart';
import 'package:datav8/screens/tabs/DevicesTab.dart';
import 'package:datav8/screens/tabs/HomeTab.dart';
import 'package:datav8/screens/tabs/ProfileTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DashboardScreen extends StatefulWidget {
  final UserNode user;
  const DashboardScreen({Key key, @required this.user}) : super(key: key);
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
    BlocProvider.of<BottomNavigationBloc>(context).add(BottomNavigationTabUpdatedEvent(ApplicationTab.HOME));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, ApplicationTab>(
      builder: (BuildContext context, ApplicationTab activeTab) {
        return Scaffold(
          body: _getActiveTab(context, activeTab),
          bottomNavigationBar: BottomNavigationSelector(
            activeApplicationTab: activeTab,
            onApplicationTabSelected: (applicationTab) => BlocProvider.of<BottomNavigationBloc>(context).add(BottomNavigationTabUpdatedEvent(applicationTab)),
          )
        );
      },
    );
  }

  Widget _getActiveTab(BuildContext context, ApplicationTab activeTab) {
    switch (activeTab) {
      case ApplicationTab.HOME:
        return HomeTab();

      case ApplicationTab.DEVICES:
        // TODO : if the device bloc current state is error, reload
        return DevicesTab();

      case ApplicationTab.PROFILE:
        return ProfileTab(user: widget.user);

      default:
      // TODO : implement a better error screen
        return Center(
          child: Text("ERROR"),
        );
    }
  }
}