import 'package:flutter/material.dart';
import 'package:interference/leaderboard.dart';
import 'game.dart';
import 'global.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    wm = MediaQuery.of(context).size.width / 411;
    hm = MediaQuery.of(context).size.height / 822;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
        ),
      ),
      body: Stack(children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bgm1.png'),
                    fit: BoxFit.fitWidth))),

        //Body
        Align(
          alignment: AlignmentDirectional.center,
          child: Container(
            height: 240*hm,
            width: 320*wm,
            margin: EdgeInsets.only(bottom: 280*hm),
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                  height: 280*hm,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/title.png'),
                          fit: BoxFit.fitHeight))),
            ),
          ),
        ),

        //butons
        Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
                height: 360*hm,
                width: 280*wm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                        height: 80*hm,
                        width: 260*wm,
                        child: RaisedButton(
                          color: secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24*wm),
                          ),
                          child: Text("Play Now",
                          textScaleFactor: wm,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 28,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w700)),
                          onPressed: () {
                            Navigator.push(context,
                                SlideLeftRoute(page: QuestionGenerator()));
                          },
                        )),
                    Padding(padding: EdgeInsets.symmetric(vertical: 8*hm)),
                    Container(
                        height: 80*hm,
                        width: 260*wm,
                        child: RaisedButton(
                          color: paccentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24*wm),
                          ),
                          child: Text("LeaderBoards",
                              textScaleFactor: wm,
                              style: TextStyle(
                                  color: Colors.pink[200],
                                  fontSize: 26,
                                  fontFamily: 'poppins')),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => LeaderBoard()));
                          },
                        ))
                  ],
                )))
      ]),
    );
  }
}
