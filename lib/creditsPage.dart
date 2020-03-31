import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Utils/global.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Credits extends StatefulWidget {
  @override
  _CreditsState createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(),
        ),
        body: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bgm1.png"), fit: BoxFit.cover)),
          ),
          Column(children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(14 * wm, 24 * hm, 14 * wm, 0),
                //decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/bgm1.png"), fit: BoxFit.cover)),
                child: Column(children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      homeButton(context),
                      SizedBox(
                        width: 8 * hm,
                      ),
                      title(),
                    ],
                  ),
                  SizedBox(
                    height: 32 * hm,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: profile(
                            'Tom Vempala',
                            'assets/tom.jpg',
                            'Backend Dev and \nAlgorithms',
                            "https://instagram.com/tomthomasvempala"),
                      ),
                      SizedBox(width: 14 * wm),
                      Expanded(
                        child: profile(
                            'George Sabu',
                            'assets/george.jpg',
                            'Backend Dev and \nAlgorithms',
                            "https://instagram.com/george._.sabu"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20 * hm),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: profile(
                          'Denin Paul',
                          'assets/denin.jpg',
                          'Frontend Dev and \nDB Management',
                          "https://instagram.com/techcrawler_",
                        ),
                      ),
                      SizedBox(width: 14 * wm),
                      Expanded(
                        child: profile(
                            'CLINCE',
                            'assets/clince.jpg',
                            'Music Composer. \n Click for More Tracks.',
                            "https://www.youtube.com/channel/UC_fK3X5DvdJ6qFD8xAuErOg",
                            col: paccentColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 40 * hm),
                  callToActionButtons(
                      Colors.pink[200], "Buy Us a Drink ", context)
                ]))
          ])
        ]));
  }
}

homeButton(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: 24.0 * hm),
    child: FlatButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back_ios, size: 42 * wm, color: Colors.pink[200]),
    ),
  );
}

title() {
  return Align(
    alignment: Alignment.topCenter,
    child: Padding(
      padding: EdgeInsets.only(top: 20 * hm),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          "Our Team",
          textScaleFactor: wm,
          style: TextStyle(
              fontSize: 40,
              fontFamily: "poppins",
              color: Colors.pink[200],
              fontWeight: FontWeight.w700),
        ),
      ),
    ),
  );
}

callToActionButtons(Color col, String text, BuildContext context) {
  return Container(
      height: 56 * hm,
      padding: EdgeInsets.symmetric(horizontal: 48.0 * wm),
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.pink[200], width: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: col,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.local_drink,
              color: Colors.pink[200],
              size: 32,
            ),
            Text("  $text",
                textScaleFactor: wm,
                style: TextStyle(
                    fontFamily: "poppins",
                    color: Colors.pink[200],
                    fontWeight: FontWeight.w600,
                    fontSize: 20)),
          ],
        ),
        onPressed: () {
          _showDialog(context);
        },
      ));
}

_showDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.pink[200],
            title: Text(
              "Liked The Game ?",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w800),
            ),
            content: Text(
              "We would be happy if you could appreciate us through Donations. \n\nGoogle Pay No: 8547634760",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w600),
            ),
            actions: <Widget>[
              FlatButton(
                  color: Colors.pink[200],
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: "8547634760"));
                    Fluttertoast.showToast(
                        msg: "Copied to ClipBoard. Thanks :)");
                  },
                  child: Row(children: <Widget>[
                    Icon(
                      Icons.content_copy,
                      color: primaryColor,
                    ),
                    SizedBox(width: 4,),
                    Text(
                      "Copy",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontFamily: "poppins",
                          fontWeight: FontWeight.w600),
                    )
                  ])),
            ]);
      });
}

Widget profile(name, image, dept, url, {col = const Color(0xcc210c45)}) {
  var secondaryCol =
      col == Color(0xcc210c45) ? Colors.deepPurple[100] : Colors.pink[100];
  var tertiaryCol =
      col == Color(0xcc210c45) ? Colors.deepPurple[100] : Colors.pink[100];

  return RaisedButton(
    color: col,
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20 * hm),
          Container(
            width: 140 * wm,
            height: 140 * wm,
            decoration:
                BoxDecoration(color: Colors.pink[100], shape: BoxShape.circle),
            padding: EdgeInsets.all(3 * wm),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),
          ),
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10 * hm),
              Text(name,
                  textScaleFactor: wm,
                  style: TextStyle(
                      color: secondaryCol,
                      fontSize: 20,
                      fontFamily: "poppins",
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center),
              SizedBox(height: 0),
              Text(dept,
                  textScaleFactor: wm,
                  style: TextStyle(
                      color: tertiaryCol,
                      fontSize: col == Color(0xcc210c45) ?
                          13: 13,
                      fontFamily: "poppins",
                      fontWeight: col == Color(0xcc210c45)
                          ? FontWeight.w500
                          : FontWeight.w700),
                  textAlign: TextAlign.center),
              SizedBox(height: 20 * hm),
            ],
          ))
        ],
      ),
    ),
    onPressed: () {
      _launchURL(url);
    },
  );
}

_launchURL(var url) async {
  //url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
