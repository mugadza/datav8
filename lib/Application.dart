import 'package:datav8/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'blocs/blocs.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final applicationTheme = Provider.of<ApplicationTheme>(context);

    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ApplicationBloc>(
            create: (context){
              return ApplicationBloc()
              ..add(ApplicationStartedEvent());
            },
          ),
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(applicationBloc: BlocProvider.of<ApplicationBloc>(context), 
              applicationRepository: ApplicationRepository(graphQLConfiguration: GraphQLConfiguration())
            ),
          ),
          BlocProvider<BottomNavigationBloc>(
            create: (context) => BottomNavigationBloc(homeBloc: "BlocProvider.of<HomeBloc>(context)"),
          )
        ], 
        child: DashboardScreen(),
      ),
      themeMode: ThemeMode.dark,
      darkTheme: applicationTheme.data,
      debugShowCheckedModeBanner: false,
    );
  }
} 
