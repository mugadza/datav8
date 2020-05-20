import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DeviceCardLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              child: Container(
                height: 140.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: Theme.of(context).canvasColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF656565).withOpacity(0.15),
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                      offset: Offset(0.1, 1.0)
                    )
                  ]
                ),
                child: Shimmer.fromColors(
                  baseColor: Color(0xFF3B4659),
                  highlightColor: Color(0xFF606B78),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                        child: Container(color: Theme.of(context).hintColor, height: 17.0, width: 100.0),
                      ),
                      _line(),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 15.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 45.0, 
                              width: 45.0,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(color: Theme.of(context).hintColor, borderRadius: BorderRadius.all(Radius.circular(10)))
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(color: Theme.of(context).hintColor, height: 17.0, width: 170.0),
                                  Padding(padding: EdgeInsets.only(bottom: 3)),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/1.55,
                                    child: Container(color: Theme.of(context).hintColor, height: 17.0, width: 70.0)
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            
            Shimmer.fromColors(
              baseColor: Color(0xFF3B4659),
              highlightColor: Color(0xFF606B78),
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 35.0, top: 27),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.only(left: 4),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(color: Theme.of(context).hintColor, borderRadius: BorderRadius.all(Radius.circular(30.0)))
                            ),
                          ]
                        ),
                      ),


                      Container(
                        padding: EdgeInsets.only(left: 4),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(color: Theme.of(context).hintColor, borderRadius: BorderRadius.all(Radius.circular(30.0))),
                            ),
                          ]
                        ),
                      ),


                      Container(
                        padding: EdgeInsets.only(left: 4),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(color: Theme.of(context).hintColor, borderRadius: BorderRadius.all(Radius.circular(30.0)))
                            ),
                          ]
                        ),
                      ),                  



                      Container(
                        padding: EdgeInsets.only(left: 4),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(color: Theme.of(context).hintColor, borderRadius: BorderRadius.all(Radius.circular(30.0)))
                            ),
                          ]
                        ),
                      ),


                      Container(
                        padding: EdgeInsets.only(left: 4),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(color: Theme.of(context).hintColor, borderRadius: BorderRadius.all(Radius.circular(30.0)))
                            ),
                          ]
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }

  Widget _line() {
    return Container(
      height: 1.0,
      width: double.infinity,
      color: Colors.white10,
    );
  }
}