import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'dart:async';
import 'package:interference/global.dart';
import 'package:sqflite/sqflite.dart';
import 'package:interference/model.dart';
import 'package:interference/DataBase/database_helper.dart';

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
    QuerySnapshot queryresult =
        await Firestore.instance.collection('list').getDocuments();
    print(queryresult.documents.length);

    //deleting existing data and replacing with new
    Database db = await helper.database;
    var deleteresult = await db.delete('dataTable');
    print('Delete Result: $deleteresult');

    //entering
    for (int i = 0; i < queryresult.documents.length; i++) {
      Person per = new Person();
      per.name = queryresult.documents[i].data['name'];
      per.hostel = queryresult.documents[i].data['hostel'];
      per.gen = queryresult.documents[i].data['gen'];
      per.clas = queryresult.documents[i].data['clas'];
      per.place = queryresult.documents[i].data['place'];
      per.rep = queryresult.documents[i].data['rep'];
      per.house = queryresult.documents[i].data['house'];
      per.ds = queryresult.documents[i].data['ds'];
      per.rel = queryresult.documents[i].data['rel'];
      per.school = queryresult.documents[i].data['school'];
      per.specs = queryresult.documents[i].data['specs'];
      per.singer = queryresult.documents[i].data['singer'];
      per.dancer = queryresult.documents[i].data['dancer'];
      per.programmer = queryresult.documents[i].data['programmer'];

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
    print("Successfully added to dataTable from online database");
  } else {
    print("Add failed to dataTable from online database");
  }

  //Importing data from localDB to dataList]
  dataListImporter();
}
