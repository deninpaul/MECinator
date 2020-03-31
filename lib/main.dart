import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flame/flame.dart';
import 'DataBase/addData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'DataBase/localDBmanager.dart';
import 'services/bgm.dart';
import 'home.dart';
import 'Utils/global.dart';
import 'services/connectivity_Handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getDataFromOnline().then((_) async {
    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    connectionStatus.initialize();
    BGM.attachWidgetBindingListener();
    await BGM.add('bgm.mp3');
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isCheckingforNetwork = true;

  @override
  void initState() {
    super.initState();
    checkNet().then((_) {
      setState(() {
        isCheckingforNetwork = false;
      });
    });
    BGM.play(0);
  }

  checkNet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          isOffline = false;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        isOffline = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      title: 'Interference',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: primaryColor,
          scaffoldBackgroundColor: primaryColor),
      home: !isCheckingforNetwork
          ?  Home()
          : Scaffold(
              backgroundColor: primaryColor,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),

      //Uncomment below for Updating Database

      // home: Scaffold(
      //   body: Container(
      //       color: Colors.white,
      //       child: Center(
      //         child: RaisedButton(
      //           onPressed: () => onlineDataBaseHandler(),
      //           color: Colors.blue,
      //           child: Text("Update online database"),
      //         ),
      //       )),
      // ),
    );
  }

  @override
  void dispose() async {
    await BGM.stop();
    super.dispose();
  }
}

