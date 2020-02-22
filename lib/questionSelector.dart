import 'package:interference/model.dart';
import 'global.dart';
import 'dart:math';

void rmp(Person per) {
  dataList.remove(per);
}

int count() {
  return dataList.length;
}

void findrow() {
  int max = 10000, half = count() ~/ 2;
  int i, j, c;
  // '~/' used instead of count()/2.toInt. Random dart sh!t

  for (i = 0; i < dataList.length; i++) {
    c = 0;
    for (j = 0; j < dataList.length; j++) {
      if (dataList[j].hostel == dataList[i].hostel) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "hostel" &&
        lastvalue == dataList[i].hostel &&
        nhostel != 0) {
      max = (half - c).abs();
      row = "hostel";
      value = dataList[i].hostel;
    }
  }

  for (i = 0; i < dataList.length; i++) {
    c = 0;
    for (j = 0; j < dataList.length; j++) {
      if (dataList[j].house == dataList[i].house) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "house" &&
        lastvalue == dataList[i].house &&
        nhouse != 0) {
      max = (half - c).abs();
      row = "house";
      value = dataList[i].house;
    }
  }

  for (i = 0; i < dataList.length; i++) {
    c = 0;
    for (j = 0; j < dataList.length; j++) {
      if (dataList[j].clas == dataList[i].clas) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "clas" &&
        lastvalue == dataList[i].clas &&
        nclas != 0) {
      max = (half - c).abs();
      row = "clas";
      value = dataList[i].clas;
    }
  }

  for (i = 0; i < dataList.length; i++) {
    c = 0;
    for (j = 0; j < dataList.length; j++) {
      if (dataList[j].gen == dataList[i].gen) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "gen" &&
        lastvalue == dataList[i].gen &&
        ngen != 0) {
      max = (half - c).abs();
      row = "gen";
      value = dataList[i].gen;
    }
  }

  for (i = 0; i < dataList.length; i++) {
    c = 0;
    for (j = 0; j < dataList.length; j++) {
      if (dataList[j].region == dataList[i].region) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "region" &&
        lastvalue == dataList[i].region &&
        nclas != 0) {
      max = (half - c).abs();
      row = "region";
      value = dataList[i].region;
    }
  }

  for (i = 0; i < dataList.length; i++) {
    c = 0;
    for (j = 0; j < dataList.length; j++) {
      if (dataList[j].ds == dataList[i].ds) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "ds" &&
        lastvalue == dataList[i].ds &&
        nclas != 0) {
      max = (half - c).abs();
      row = "ds";
      value = dataList[i].ds;
    }
  }

  for (i = 0; i < dataList.length; i++) {
    c = 0;
    for (j = 0; j < dataList.length; j++) {
      if (dataList[j].rel == dataList[i].rel) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "rel" &&
        lastvalue == dataList[i].rel &&
        nclas != 0) {
      max = (half - c).abs();
      row = "rel";
      value = dataList[i].rel;
    }
  }

  for (i = 0; i < dataList.length; i++) {
    c = 0;
    for (j = 0; j < dataList.length; j++) {
      if (dataList[j].rep == dataList[i].rep) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "rep" &&
        lastvalue == dataList[i].rep &&
        nclas != 0) {
      max = (half - c).abs();
      row = "rep";
      value = dataList[i].rep;
    }
  }

  for (i = 0; i < dataList.length; i++) {
    c = 0;
    for (j = 0; j < dataList.length; j++) {
      if (dataList[j].place == dataList[i].place) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "place" &&
        lastvalue == dataList[i].place &&
        nclas != 0) {
      max = (half - c).abs();
      row = "place";
      value = dataList[i].place;
    }
  }

  if (lastrow == row && lastvalue == value) {
    print("Insufficient Data \n");
    row = "done";
  }

  lastrow = row;
  lastvalue = value;
}

initialiser() {
  nrep = 1;
  nhostel = 1;
  nds = 1;
  nplace = 1;
  nregion = 1;
  nhouse = 1;
  nclas = 0;
  ngen = 1;
  nrel = 1;
}

String firstQuestion() {
  final _random = new Random();
  if (_random.nextInt(2) == 0) {
    firstQuestionCSA = true;
    return "Does $da study in CSA";
  } else {
    firstQuestionCSA = false;
    return "Does $da study in CSB";
  }
}

firstQuestionEvaluator(String answer) {
  if (firstQuestionCSA) {
    for (int i = 0; i < dataList.length; i++) {
      if (answer == "y") {
        if (dataList[i].clas == "CSB") rmp(dataList[i]);
      } else {
        if (dataList[i].clas == "CSA") rmp(dataList[i]);
      }
    }
  } else {
    for (int i = 0; i < dataList.length; i++) {
      if (answer == "y") {
        if (dataList[i].clas == "CSA") rmp(dataList[i]);
      } else {
        if (dataList[i].clas == "CSB") rmp(dataList[i]);
      }
    }
  }
}

String otherQuestion() {
  findrow();

  //output shortlisted in console
  for (int i = 0; i < dataList.length; i++) {
    print("${dataList[i].name} \n");
  }

  //question framing
  if (row == "done")
    return "break";
  else if (row == "clas")
    return "Does $da stay at $value ?";
  else if (row == "gen") {
    if (value == "M")
      regg = "Male";
    else
      regg = "Female";
    return "Is $da a $regg ?";
  } else if (row == "hostel") {
    if (value == "Some other PG") value = "any PG other than RR";
    return "Does $da stay at $value ?";
  } else if (row == "rel")
    return "Is $da a $value ?";
  else if (row == "place")
    return "Is $da from $value ?";
  else if (row == "region") {
    if (value == "M")
      regg = "Middle";
    else if (value == "N")
      regg = "North";
    else
      regg = "South";
    return "Is $da from $regg Kerala?";
  } else if (row == "house") {
    if (value == "T")
      regg = "Thandava";
    else if (value == "S")
      regg = "Samhara";
    else if (value == "R")
      regg = "Rakshasa";
    else if (value == "D")
      regg = "Dhruva";
    else
      regg = "Aryans";
    return "Is $da a member of $regg House ?";
  } else if (row == "rep")
    return "Is $da a Repeater ?";
  else if (row == "ds") return "Is $da a Day Scholar ?";
}

otherQuestionEvaluation(){
  
}