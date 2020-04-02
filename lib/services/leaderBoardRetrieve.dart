//this was made just for retrieving firebase data to the deployed django app (heroku)

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';

var url = "https://mecinatorapi.herokuapp.com/leaderboard/";
int count = 1;

main(List<String> args) async {
  QuerySnapshot queryresult =
      await Firestore.instance.collection('leaderboard').getDocuments();
  print("Got from Firebase. ${queryresult.documents.length} entries");
  addToNewDb(queryresult);
}

addToNewDb(QuerySnapshot queryresult) async {
  for (int i = 0; i < queryresult.documents.length; i++) {
    addNewRow(queryresult, i);
  }
}

addNewRow(QuerySnapshot queryresult, int i) async {
  String name;
  int score;
  name = queryresult.documents[i].data["name"];
  score = queryresult.documents[i].data["score"];

  Map<String, dynamic> json = {"name": name, "score": score};
  Response response = await post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(json),
  );
  print('Response status: ${response.reasonPhrase}. Added Entry: ${count++}');
}
