import 'package:datav8/blocs/signin/SigninBloc.dart';
import 'package:datav8/screens/helpers/helpers.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  final SigninBloc signinBloc;
  UserListScreen({Key key, @required this.signinBloc}) : super(key: key);

  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         brightness: Brightness.dark,
           centerTitle: true,
           title: Text("Customers",style: TextStyle(color: Theme.of(context).textSelectionColor,fontFamily: "Gotik",fontWeight: FontWeight.w600,fontSize: 18.5),),
           actions: <Widget>[
             Padding(
               padding: const EdgeInsets.only(right:8.0),
               child: Icon(Icons.search,color: Theme.of(context).textSelectionColor,),         
             ),
           ],
           elevation: 3.0,
           backgroundColor: Theme.of(context).canvasColor,
         ),
       body: UserListView(signinBloc: widget.signinBloc),
       floatingActionButton: FloatingActionButton(
         elevation: 3.0,
         child: Padding(
           padding: const EdgeInsets.only(right: 4.0, bottom: 3.5),
           child: Icon(Icons.person_add),
         ),
         onPressed: (){},
       ),
    );    
  }
}

