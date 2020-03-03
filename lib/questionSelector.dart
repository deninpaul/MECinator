import 'package:interference/model.dart';
import 'global.dart';
import 'dart:math';

void rmp(Person per) {
  dataList.remove(per);
}

int count() {
  return dataList.length;
}

findrow() {
  int max = 10000, half = count() ~/ 2;
  int i, j, c;
  // '~/' used instead of count()/2.toInt. Random dart sh!t

  for (i = 0; i < dataList.length; i++) {
    c = 0;
    for (j = 0; j < dataList.length; j++) {
      if (dataList[j].hostel == dataList[i].hostel) c++;
    }
    if (((half - c).abs() <= max) &&
        nhostel != 0 && dataList[i].hostel != "NIL") {
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
        nregion != 0) {
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
        nds != 0) {
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
        nrel != 0) {
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
        nrep != 0) {
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
        nplace != 0) {
      max = (half - c).abs();
      row = "place";
      value = dataList[i].place;
    }
  }

  // if (lastrow == row && lastvalue == value) {
  //   print("Insufficient Data \n");
  //   row = "done";
  // }

  // lastrow = row;
  // lastvalue = value;
  print(half);
  print("Max: $max");
}

initialiser() {
  nrep = 1;
  nhostel = 1;
  nds = 1;
  nplace = 1;
  nhouse = 1;
  nclas = 1;
  ngen = 1;
  nrel = 1;
  row = "abc";
  lastrow = "xyz";
  lastvalue = "qwe";
  value = "zxc";
  da = "the person you are thinking of";
}

String firstQuestion() {
  final _random = new Random();
  if (_random.nextInt(2) == 0) {
    firstQuestionCSA = true;
    return "Does $da study in CSA ?";
  } else {
    firstQuestionCSA = false;
    return "Does $da study in CSB ?";
  }
}

firstQuestionEvaluator(String answer) {
  int i;
  int flag=1;
  if (firstQuestionCSA == true) {
    if (answer == "y") {
      for (i = 0; i < dataList.length; i++) {
        if (dataList[i].clas == "CSB") {
          print("${flag++}");
          rmp(dataList[i]);
        }
      }
    } else {
      for (i = 0; i < dataList.length; i++) {
        if (dataList[i].clas == "CSA") {
          print("${flag++}");
          rmp(dataList[i]);
        }
      }
    }
  } else if (firstQuestionCSA == false) {
    if (answer == "y") {
      for (i = 0; i < dataList.length; i++) {
        if (dataList[i].clas == "CSA") {
          print("${flag++}");
          rmp(dataList[i]);
        }
      }
    } else {
      for (i = 0; i < dataList.length; i++) {
        if (dataList[i].clas == "CSB") {
          print("${flag++}");
          rmp(dataList[i]);
        }
      }
    }
  }
  for(i=0;i<dataList.length;i++){
    print("${dataList[i].name} - ${dataList[i].clas} \n" );
  }
}

String otherQuestion() {
  findrow();

  //question framing
  if (row == "clas")
    return "Does $da stay at $value ?";
  
  else if (row == "gen") {
    if (value == "M") {
      regg = "Male";
      da = "he";
    } else {
      regg = "Female";
      da = "she";
    }
    return "Is $da a $regg ?";
  } 
  
  else if (row == "hostel") {
    if (value == "Some other PG") value = "any PG other than RR";
    return "Does $da stay at $value ?";
  } 
  
  else if (row == "rel")
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
  } 
  
  else if (row == "house") {
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
  } 
  
  else if (row == "rep")
    return "Is $da a Repeater ?";
  
  else if (row == "ds") return "Is $da a Day Scholar ?";
}



otherQuestionEvaluation(String answer) {
  if (row == "clas") {
    if (answer == 'y') {
      nclas = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].clas != value) rmp(dataList[i]);
      }
    } else if (answer == 'n') {
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].clas == value) rmp(dataList[i]);
      }
    } else {
      nclas = 0;
    }
  } 
  
  else if (row == "gen") {
    
    if (answer == 'y') {
      ngen = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].gen != value) rmp(dataList[i]);
      }
    } else if (answer == 'n') {
      ngen = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].gen == value) rmp(dataList[i]);
      }
    } else {
      ngen = 0;
    }
  } 
  
  else if (row == "hostel") {
    if (answer == 'y') {
      nhostel = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].hostel != value) rmp(dataList[i]);
      }
    } else if (answer == 'n') {
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].hostel == value) rmp(dataList[i]);
      }
    } else {
      nhostel = 0;
    }
  } 
  
  else if (row == "rel") {
    if (answer == 'y') {
      nrel = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].rel != value) rmp(dataList[i]);
      }
    } else if (answer == 'n') {
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].rel == value) rmp(dataList[i]);
      }
    } else {
      nrel = 0;
    }
  } 
  
  else if (row == "place") {
    if (answer == 'y') {
      nplace = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].place != value) rmp(dataList[i]);
      }
    } else if (answer == 'n') {
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].place == value) rmp(dataList[i]);
      }
    } else {
      nplace = 0;
    }
  } 
  
  else if (row == "region") {
    if (answer == 'y') {
      nregion = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].region != value) rmp(dataList[i]);
      }
    } else if (answer == 'n') {
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].region == value) rmp(dataList[i]);
      }
    } else {
      nregion = 0;
    }
  } 
  
  else if (row == "house") {
    if (answer == 'y') {
      nhouse = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].house != value) rmp(dataList[i]);
      }
    } else if (answer == 'n') {
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].house == value) rmp(dataList[i]);
      }
    } else {
      nhouse = 0;
    }
  } 
  
  else if (row == "rep") {
    if (answer == 'y') {
      nrep = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].rep != value) rmp(dataList[i]);
      }
    } else if (answer == 'n') {
      nrep = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].rep == value) rmp(dataList[i]);
      }
    } else {
      nrep = 0;
    }
  } 
  
  else if (row == "ds") {
    if (answer == 'y') {
      nds = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].ds != value) rmp(dataList[i]);
      }
    } else if (answer == 'n') {
      nds = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].ds == value) rmp(dataList[i]);
      }
    } else {
      nds = 0;
    }
  }
  
  
  for(int i=0;i<dataList.length;i++){
    print("${dataList[i].name} - ${dataList[i].clas} \n" );
  }
}
