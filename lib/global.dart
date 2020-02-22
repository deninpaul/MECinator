import 'package:interference/model.dart';

bool connectedToNet = false;
bool shouldConnectToNet = true;
bool isFirstQuestion = true;
bool firstQuestionCSA;
List<Person> dataList;

int nrep, nhostel, nplace, nregion, nhouse, nrel, ngen, nclas, nds;
String row, rowitem, value, lastrow, lastvalue, da, regg, question;