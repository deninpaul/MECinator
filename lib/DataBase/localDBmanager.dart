import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart';
import '../Utils/global.dart';
import 'package:sqflite/sqflite.dart';
import '../Utils/model.dart';
import 'package:interference/DataBase/database_helper.dart';

var url = "https://mecinatorapi.herokuapp.com/persons/";

dataListImporter() async{
  dataList = null;
  DatabaseHelper helper = DatabaseHelper();
  if (dataList == null) {
    dataList = List<Person>();
    final Future<Database> dbFuture = helper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Person>> dataListFuture = helper.getDataList();
      dataListFuture.then((list) {
        dataList = list;
        print("Updated dataList variable from local databse. Length: ${dataList.length}");
      });
    });
  }
}

Future<Null> getDataFromOnline() async {
  int result=0;

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

    //requesting api to give data
    var response = await get(Uri.encodeFull(url), headers: {"Accept":"application/json"});
    var map = json.decode(response.body);
    
    //deleting existing data and replacing with new
    DatabaseHelper helper = DatabaseHelper();
    Database db = await helper.database;
    var deleteresult = await db.delete('dataTable');
    print('Delete Result: $deleteresult');

    //adding to local table
    for (int i = 0; i < map.length; i++) {
      Person per = Person.fromMapObject(map[i]);

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
          per.place == "Pathanamthitta") per.region = "M";
      if (per.place == "Kollam" || per.place == "Thiruvananthapuram")
        per.region = "S";

      result = await helper.insertNote(per);
    }
  }

  if (result != 0) {
    print("Successfully added to dataTable from online database");
  } else {
    print("Add failed to dataTable from online database");
  }

  //Importing data from localDB to dataList]
  dataListImporter();
}
