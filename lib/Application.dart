import 'package:datav8/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'blocs/blocs.dart';
import 'blocs/models/models.dart';

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
    final _applicationRepository = ApplicationRepository(graphQLConfiguration: _graphQLConfiguration);

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
              applicationRepository: _applicationRepository
            ),
          ),
          BlocProvider<DeviceBloc>(
            create: (context) => DeviceBloc(applicationBloc: BlocProvider.of<ApplicationBloc>(context), 
              applicationRepository: _applicationRepository
            ),
          ),
          BlocProvider<BottomNavigationBloc>(
            create: (context) => BottomNavigationBloc(homeBloc: BlocProvider.of<HomeBloc>(context)),
          ),
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(userRepository: _userRepository, applicationRepository: _applicationRepository, applicationBloc: BlocProvider.of<ApplicationBloc>(context)),
          ),
          BlocProvider<SigninBloc>(
            create: (context) => SigninBloc(userRepository: _userRepository, authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
          )
        ], 
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state){
            if(state is AuthenticationInitialState){
              BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationInitializedEvent());
            }

            if(state is AuthenticationInitialState || state is AuthenticationLoadingState){
              return SplashScreen();
            }

            if(state is AuthenticationSuccessState){
              return DashboardScreen(user: state.user);
            }

            if(state is AuthenticationFailureState){
              return SigninScreen();
            }

            return Scaffold(body: Center(child: Text("12345: Some thing went wrong.")));
          },
        ),
      ),
      themeMode: ThemeMode.dark,
      darkTheme: _applicationTheme.data,
      debugShowCheckedModeBanner: false,
    );
  }
} 
