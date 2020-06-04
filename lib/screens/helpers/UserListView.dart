import 'package:datav8/blocs/signin/SigninBloc.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserListView extends StatefulWidget {
  final SigninBloc signinBloc;

  UserListView({Key key, @required this.signinBloc}) : super(key: key);

  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: 0.0, right: 0.0, top: 7.0, bottom: 7.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                    width: 100.0,
                    child: Text(
                      "Pair",
                      style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontFamily: "Popins"),
                    )),
              ),
              Container(
                  width: 100.0,
                  child: Text(
                    "Last Price",
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontFamily: "Popins"),
                  )),
              Container(
                  width: 80.0,
                  child: Text(
                    "24h Chg%",
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontFamily: "Popins"),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 60.0,
        ),
        Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      "assets/image/icon/015-alert.png",
                      height: 105.0,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "You have no customers",
                  style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontFamily: "Sans",
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0),
                )
              ]),
        )
      ],
    ));
  }

///
///
/// Calling imageLoading animation for set a grid layout
///
///
// Widget _loadingData(BuildContext context) {
//   return Container(
//     child: ListView.builder(
//       shrinkWrap: true,
//       primary: false,
//       itemCount: widget.signinBloc.authenticationResult.auth.user.userNodeConnection.edges.length,
//       itemBuilder: (ctx, i) {
//         return loadingCard(ctx, widget.signinBloc.authenticationResult.auth.user.userNodeConnection.edges[i]);
//       },
//     ),
//   );
// }

// ///
// ///
// /// Calling ImageLoaded animation for set a grid layout
// ///
// ///
// Widget _dataLoaded(BuildContext context) {
//   return Container(
//     child: ListView.builder(
//       shrinkWrap: true,
//       primary: false,
//       itemCount: widget.signinBloc.authenticationResult.auth.user.userNodeConnection.edges.length,
//       itemBuilder: (ctx, i) {
//         return card(ctx, widget.signinBloc.authenticationResult.auth.user.userNodeConnection.edges[i]);
//       },
//     ),
//   );
// }

Widget loadingCard(BuildContext ctx) {
  return Padding(
    padding: const EdgeInsets.only(top: 7.0),
    child: Shimmer.fromColors(
      baseColor: Color(0xFF3B4659),
      highlightColor: Color(0xFF606B78),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 12.0),
                      child: CircleAvatar(
                        backgroundColor: Theme.of(ctx).hintColor,
                        radius: 13.0,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 15.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                  color: Theme.of(ctx).hintColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Container(
                            height: 12.0,
                            width: 25.0,
                            decoration: BoxDecoration(
                                color: Theme.of(ctx).hintColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 15.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                            color: Theme.of(ctx).hintColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Container(
                          height: 12.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                              color: Theme.of(ctx).hintColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  height: 25.0,
                  width: 55.0,
                  decoration: BoxDecoration(
                      color: Theme.of(ctx).hintColor,
                      borderRadius: BorderRadius.all(Radius.circular(2.0))),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 6.0),
            child: Container(
              width: double.infinity,
              height: 0.5,
              decoration: BoxDecoration(color: Colors.black12),
            ),
          )
        ],
      ),
    ),
  );
}

Widget card(BuildContext ctx) {
  return Padding(
    padding: const EdgeInsets.only(top: 7.0),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 12.0),
                    child: Image.asset(
                      "assets/image/logo_kl.png",
                      height: 22.0,
                      fit: BoxFit.contain,
                      width: 22.0,
                    ),
                  ),
                  Container(
                    width: 95.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "X1",
                              style: TextStyle(
                                  fontFamily: "Popins", fontSize: 16.5),
                            ),
                            Text(
                              "/BTC",
                              style: TextStyle(
                                  fontFamily: "Popins",
                                  fontSize: 11.5,
                                  color: Theme.of(ctx).hintColor),
                            ),
                          ],
                        ),
                        Text(
                          "X4",
                          style: TextStyle(
                              fontFamily: "Popins",
                              fontSize: 11.5,
                              color: Theme.of(ctx).hintColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("X2"),
                  Text(
                    "X3",
                    style: TextStyle(
                        fontFamily: "Popins",
                        fontSize: 11.5,
                        color: Theme.of(ctx).hintColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                  height: 25.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2.0)),
                      color: Colors.red),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Text(
                      "X6",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ))),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 6.0),
          child: Container(
            width: double.infinity,
            height: 0.5,
            decoration: BoxDecoration(color: Colors.black12),
          ),
        )
      ],
    ),
  );
}
}
