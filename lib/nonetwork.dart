import 'dart:async';

import 'package:flutter/material.dart';

import 'Utils/global.dart';
import 'services/connectivity_Handler.dart';

class NoNetwork extends StatefulWidget {
  @override
  NoNetworkState createState() => new NoNetworkState();
}

class NoNetworkState extends State<NoNetwork> {
  StreamSubscription _connectionChangeStream;

  bool isOffline = false;

  @override
  initState() {
    super.initState();

    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    _connectionChangeStream =
        connectionStatus.connectionChange.listen(connectionChanged);
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: AppBar(
              backgroundColor: primaryColor,
              elevation: 0,
            ),
          ),
          body: Stack(children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bgm1.png'),
                        fit: BoxFit.fitWidth))),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 240,
                    width: 240,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: paccentColor,
                    ),
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/facepalm.png"),
                                fit: BoxFit.contain))),
                  ),
                  Padding(padding: EdgeInsets.all(20),),
                  Container(
                    height: 44 * hm,
                    width: 280 * wm,
                    color: secondaryColor,
                    child: Text("No NetWork Connection",
                        textAlign: TextAlign.center,
                        textScaleFactor: wm,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 28,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w700)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  Container(
                    width: 300,
                    child: Text(
                        "Please have a proper Internet Connection to Continue", textAlign: TextAlign.center,textScaleFactor: wm,style: TextStyle(color: Colors.pink[200], fontFamily: "poppins", fontSize: 16, fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                  ),
                ],
              ),
            )
          ])),
      onWillPop: () async {
        return false;
      },
    );
  }
}
