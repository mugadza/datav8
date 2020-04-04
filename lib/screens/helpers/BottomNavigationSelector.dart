import 'package:datav8/blocs/models/models.dart';
import 'package:datav8/screens/helpers/BottomNavigationDotBar.dart';
import 'package:datav8/screens/helpers/helpers.dart';
import 'package:datav8/utils/utils.dart';
import 'package:flutter/material.dart';

class BottomNavigationSelector extends StatelessWidget {
  final ApplicationTab activeApplicationTab;
  final Function(ApplicationTab) onApplicationTabSelected;

  const BottomNavigationSelector({Key key, this.activeApplicationTab, this.onApplicationTabSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationDotBar(
      key: ApplicationKeys.applicationTabs,
      color: Theme.of(context).hintColor,
      activeColor: Colors.greenAccent,
      items: ApplicationTab.values.map((applicationTab) {
        return BottomNavigationDotBarItem(
          icon: ApplicationTabIcon.of(applicationTab).icon,
          onTap: () => onApplicationTabSelected(applicationTab)
        );
      }).toList(),
    );
  }
}
