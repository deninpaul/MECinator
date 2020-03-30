import 'package:interference/model.dart';
import 'package:flutter/material.dart';
import 'home.dart';

bool connectedToNet = false;
bool shouldConnectToNet = true;
bool isFirstQuestion = true;
bool firstQuestionCSA;
bool finished = false;
bool isflipped = false;
bool insufficientData = false;
double wm;
double hm;
int battery = 3;

List<Person> dataList;
List<String> idk;
List<String> cA;
String player = "Denin";

int nrep,
    nhostel,
    nplace,
    nregion,
    nhouse,
    nschool,
    nrel,
    ngen,
    nclas,
    nds,
    nspecs,
    nsinger,
    ndancer,
    nprogrammer,
    nsports,
    fcount;
String row, lastrow, lastvalue, value, da, regg, question;

Color primaryColor = new Color(0xff380e7f);
Color paccentColor = new Color(0xff6915cf);
Color secondaryColor = new Color(0xffd62196);

String lowNoSpacedText(String text) {
  List<String> splitText = text.split(" ");
  String newText = splitText[0];
  for (int i = 1; i < splitText.length; i++) {
    newText = newText + splitText[i];
  }
  newText = newText.toLowerCase();
  return newText;
}

Widget loadingScreen() {
  return Container(
      color: primaryColor,
      child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Stack(children: <Widget>[
              Container(
                height: 200,
                color: paccentColor,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/running.gif'),
                        fit: BoxFit.fitHeight)),
              )
            ]),
            Padding(padding: EdgeInsets.symmetric(vertical: 16)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.pink[200]))),
              Container(
                child: Text("  Loading",
                    style: TextStyle(
                        color: Colors.pink[200],
                        fontFamily: 'poppins',
                        fontSize: 20)),
                padding: EdgeInsets.symmetric(horizontal: 10),
              )
            ])
          ])));
}

class SlideLeftRoute extends PageRouteBuilder {
  final Widget page;
  SlideLeftRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class GoHome extends StatefulWidget {
  @override
  GoHomeState createState() => GoHomeState();
}

class GoHomeState extends State<GoHome> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: PreferredSize(child: AppBar(), preferredSize: Size.fromHeight(0)),
      body: Container(
        child: loadingScreen(),
        color: primaryColor,
      ),
    );
  }
}
