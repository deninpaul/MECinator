import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'DataBase/addData.dart';
import 'DataBase/localDBmanager.dart';
import 'bgm.dart';
import 'home.dart';
import 'global.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getDataFromOnline().then((_) async {
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
  @override
  void initState() {
    super.initState();
    BGM.play(0);
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
      home: Home(),

      //Uncomment below for Updating Database

      //   home: Scaffold(
      //     body: Container(
      //         color: Colors.white,
      //         child: Center(
      //           child: RaisedButton(
      //             onPressed: () => OnlineDataBaseHandler(),
      //             color: Colors.blue,
      //             child: Text("Update online database"),
      //           ),
      //         )),
      //   ),
    );
  }

  @override
  void dispose() async {
    await BGM.stop();
    super.dispose();
  }
}
