import 'package:datav8/Application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'blocs/blocs.dart';

void main() {
  BlocSupervisor.delegate = ApplicationDelegate();
  final ApplicationThemeBloc _applicationThemeBloc = ApplicationThemeBloc();
  
  runApp(
    ChangeNotifierProvider<ApplicationTheme>(
      create: (_) => _applicationThemeBloc.initialTheme(),
      child: Application(),
    )
  );
}
