import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'package:interference/global.dart';
import 'package:sqflite/sqflite.dart';
import 'package:interference/model.dart';
import 'package:interference/DataBase/database_helper.dart';

Future<Null> dataListImporter() async {
  DatabaseHelper helper = DatabaseHelper();
  if (dataList == null) {
    dataList = List<Person>();
    final Future<Database> dbFuture = helper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Person>> dataListFuture = helper.getDataList();
      dataListFuture.then((list) {
        dataList = list;
        print(dataList[0].name);
      });
    });
  }
}

Future<Null> getDataFromOnline() async {
  int result;
  DatabaseHelper helper = DatabaseHelper();

  //checking net connectivity
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
      connectedToNet = true;
    }
  } on SocketException catch (_) {
    print('not connected');
    connectedToNet = false;
  }

  //trying to import data from OnlineDB to LocalDB
  if (connectedToNet) {
    final url =
        "https://projectinterference.000webhostapp.com/SelectAllData.php";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        {
          final map = json.decode(response.body);
          final dataList = map["result"];
          int count = dataList.length;

          //deleting existing data and replacing with new
          Database db = await helper.database;
          var deleteresult = await db.delete('dataTable');
          print('Delete Result: $deleteresult');

          //entering
          for (int i = 0; i < count; i++) {
            Person per = new Person();
            per.name = dataList[i]['name'];
            per.hostel = dataList[i]['hostel'];
            per.gen = dataList[i]['gen'];
            per.clas = dataList[i]['clas'];
            per.place = dataList[i]['place'];
            per.rep = dataList[i]['rep'];
            per.house = dataList[i]['house'];
            per.ds = dataList[i]['ds'];
            per.rel = dataList[i]['rel'];
            per.school = dataList[i]['school'];
            per.specs = dataList[i]['specs'];
            per.singer = dataList[i]['singer'];
            per.dancer = dataList[i]['dancer'];
            per.programmer = dataList[i]['programmer'];

            if (per.place == "Kasargode" ||
                per.place == "Kannur" ||
                per.place == "Kozhikode" ||
                per.place == "Wayanad" ||
                per.place == "Malapuram" ||
                per.place == "Palakad") per.region = "N";
            if (per.place == "Thrissur" ||
                per.place == "Ernakulam" ||
                per.place == "Idukki" ||
                per.place == "Kottayam" ||
                per.place == "Alapuzha" ||
                per.place == "Pathanamthitaa") per.region = "M";
            if (per.place == "Kollam" || per.place == "Thiruvananthapuram")
              per.region = "S";

            result = await helper.insertNote(per);
          }
        }

        if (result != 0) {
          print("Successfully added to dataTable");
        } else {
          print("Add failed to dataTable");
        }
      } on Exception catch (e) {
        print("Bad Internet Connection");
      }
    }
  }
  //Importing data from localDB to dataList]
  if (dataList == null) {
    dataList = List<Person>();
    final Future<Database> dbFuture = helper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Person>> dataListFuture = helper.getDataList();
      dataListFuture.then((list) {
        dataList = list;
        print(dataList.length);
      });
    });
  }
}
