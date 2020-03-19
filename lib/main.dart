import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interference/endScreen.dart';
import 'package:interference/game.dart';
import 'DataBase/localDBmanager.dart';
import 'home.dart';
import 'global.dart';
import 'DataBase/addData.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getDataFromOnline().then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      title: 'Interference',
      theme: ThemeData(primaryColor: primaryColor, scaffoldBackgroundColor: primaryColor),
      home: Home(),

      //Uncomment below for Updating Database

      // home: Scaffold(
      //   body: Container(
      //       color: Colors.white,
      //       child: Center(
      //         child: RaisedButton(
      //           onPressed: () => OnlineDataBaseHandler(),
      //           color: Colors.blue,
      //           child: Text("Update online database"),
      //         ),
      //       )),
      // ),

    );
  }
}
