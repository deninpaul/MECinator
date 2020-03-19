import 'package:flutter/material.dart';
import 'game.dart';
import 'global.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  double screenwidth;
  @override
  Widget build(BuildContext context) {
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

        //AppBar
        Container(
          height: 88,
          padding: EdgeInsets.all(10),
          color: primaryColor,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                    height: 36,
                    margin: EdgeInsets.fromLTRB(0, 8, 8, 0),
                    width: 36,
                    child: SvgPicture.asset('assets/settings.svg')),
              )
            ],
          ),
        ),

        //Body
        Align(
          alignment: AlignmentDirectional.center,
          child: Container(
            height: 240,
            width: 320,
            margin: EdgeInsets.only(bottom: 160),
            child: Stack(children: <Widget>[
              Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 24, 0, 16),
                  )),
              // child: SvgPicture.asset('assets/title back.svg'))),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                    height: 280,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/title.png'),
                            fit: BoxFit.fitHeight))),
              ),
            ]),
          ),
        ),

        //butons
        Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
                height: 288,
                width: 280,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                        height: 80,
                        width: 260,
                        child: RaisedButton(
                          color: secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text("Play Now",
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
                    Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                    Container(
                        height: 80,
                        width: 260,
                        child: RaisedButton(
                          color: paccentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text("LeaderBoards",
                              style: TextStyle(
                                  color: Colors.pink[200],
                                  fontSize: 26,
                                  fontFamily: 'poppins')),
                          onPressed: () {},
                        ))
                  ],
                )))
      ]),
    );
  }
}
