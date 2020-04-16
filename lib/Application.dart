import 'package:datav8/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'blocs/blocs.dart';

class Application extends StatefulWidget{
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final _applicationTheme = Provider.of<ApplicationTheme>(context);
    final _graphQLConfiguration = GraphQLConfiguration();
    final _userRepository = UserRepository(graphQLConfiguration: _graphQLConfiguration);

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
              applicationRepository: ApplicationRepository(graphQLConfiguration: _graphQLConfiguration)
            ),
          ),
          BlocProvider<BottomNavigationBloc>(
            create: (context) => BottomNavigationBloc(homeBloc: BlocProvider.of<HomeBloc>(context)),
          ),
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(userRepository: _userRepository),
          ),
          BlocProvider<SigninBloc>(
            create: (context) => SigninBloc(userRepository: _userRepository, authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
          )
        ], 
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state){
            if (state is AuthenticationAuthenticatedState){
              return DashboardScreen();
            }
            if ((state is AuthenticationUnauthenticatedState) || (state is AuthenticationUninitializedState)){
              return SigninScreen();
            }

            return Container(child: Center(child: Text("Loading")));
          },  
        ),
      ),
      themeMode: ThemeMode.dark,
      darkTheme: _applicationTheme.data,
      debugShowCheckedModeBanner: false,
    );
  }
} 
