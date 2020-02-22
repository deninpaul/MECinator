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

  for (i = 0; i < ptr.length; i++) {
    c = 0;
    for (j = 0; j < pp.length; j++) {
      if (pp[j].hostel == ptr[i].hostel) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "hostel" &&
        lastvalue == ptr[i].hostel &&
        nhostel != 0) {
      max = (half - c).abs();
      row = "hostel";
      value = ptr[i].hostel;
    }
  }

  for (i = 0; i < ptr.length; i++) {
    c = 0;
    for (j = 0; j < pp.length; j++) {
      if (pp[j].house == ptr[i].house) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "house" &&
        lastvalue == ptr[i].house &&
        nhouse != 0) {
      max = (half - c).abs();
      row = "house";
      value = ptr[i].house;
    }
  }

  for (i = 0; i < ptr.length; i++) {
    c = 0;
    for (j = 0; j < pp.length; j++) {
      if (pp[j].clas == ptr[i].clas) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "clas" &&
        lastvalue == ptr[i].clas &&
        nclas != 0) {
      max = (half - c).abs();
      row = "clas";
      value = ptr[i].clas;
    }
  }

  for (i = 0; i < ptr.length; i++) {
    c = 0;
    for (j = 0; j < pp.length; j++) {
      if (pp[j].gen == ptr[i].gen) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "gen" &&
        lastvalue == ptr[i].gen &&
        ngen != 0) {
      max = (half - c).abs();
      row = "gen";
      value = ptr[i].gen;
    }
  }  

  for (i = 0; i < ptr.length; i++) {
    c = 0;
    for (j = 0; j < pp.length; j++) {
      if (pp[j].region == ptr[i].region) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "region" &&
        lastvalue == ptr[i].region &&
        nclas != 0) {
      max = (half - c).abs();
      row = "region";
      value = ptr[i].region;
    }
  }

  for (i = 0; i < ptr.length; i++) {
    c = 0;
    for (j = 0; j < pp.length; j++) {
      if (pp[j].ds == ptr[i].ds) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "ds" &&
        lastvalue == ptr[i].ds &&
        nclas != 0) {
      max = (half - c).abs();
      row = "ds";
      value = ptr[i].ds;
    }
  }

  for (i = 0; i < ptr.length; i++) {
    c = 0;
    for (j = 0; j < pp.length; j++) {
      if (pp[j].rel == ptr[i].rel) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "rel" &&
        lastvalue == ptr[i].rel &&
        nclas != 0) {
      max = (half - c).abs();
      row = "rel";
      value = ptr[i].rel;
    }
  }

  for (i = 0; i < ptr.length; i++) {
    c = 0;
    for (j = 0; j < pp.length; j++) {
      if (pp[j].rep == ptr[i].rep) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "rep" &&
        lastvalue == ptr[i].rep &&
        nclas != 0) {
      max = (half - c).abs();
      row = "rep";
      value = ptr[i].rep;
    }
  }

  for (i = 0; i < ptr.length; i++) {
    c = 0;
    for (j = 0; j < pp.length; j++) {
      if (pp[j].place == ptr[i].place) c++;
    }
    if (((half - c).abs() <= max) &&
        lastrow == "place" &&
        lastvalue == ptr[i].place &&
        nclas != 0) {
      max = (half - c).abs();
      row = "place";
      value = ptr[i].place;
    }
  }

  if(lastrow==row && lastvalue==value){
    print("Insufficient Data \n");
    row = "done";
  }

  lastrow = row;
  lastvalue = value;
}

String firstQuestion(){

}