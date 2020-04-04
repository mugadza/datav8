import 'package:datav8/components/components.dart';
import 'package:flutter/material.dart';

class ApplicationThemeBloc {
  ApplicationTheme selectedTheme;

  ApplicationTheme initialTheme() {
    return selectedTheme = ApplicationTheme(
      ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ApplicationColorStyle.background,
        backgroundColor: ApplicationColorStyle.blackBackground,
        dividerColor: ApplicationColorStyle.iconColorDark,
        accentColor: ApplicationColorStyle.primaryColor,
        primaryColor: ApplicationColorStyle.primaryColor,
        hintColor: ApplicationColorStyle.fontSecondaryColorDark,
        buttonColor: ApplicationColorStyle.primaryColor,
        canvasColor: ApplicationColorStyle.grayBackground,
        cardColor: ApplicationColorStyle.grayBackground,
        textSelectionColor: ApplicationColorStyle.fontColorDark,
        textSelectionHandleColor: ApplicationColorStyle.fontColorDarkTitle
      )
    );
  }
}

class ApplicationTheme with ChangeNotifier {
  ThemeData _data;
  
  ApplicationTheme(this._data);

  set data(ThemeData value) {
    _data = value;
    notifyListeners();
  }

  ThemeData get data => _data;
}
