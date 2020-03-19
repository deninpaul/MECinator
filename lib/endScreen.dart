import 'dart:math';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

import 'game.dart';
import 'global.dart';

class EndScreen extends StatefulWidget {
  @override
  EndScreenState createState() => EndScreenState();
}

class EndScreenState extends State<EndScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  AnimationController _animationController;
  Animation _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;
  bool isScratchOver = false;

  @protected
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<double>(end: 0, begin: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Stack(children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bgm2.png'),
                    fit: BoxFit.fitWidth))),
        Align(
          child: scratchCard(),
          alignment: Alignment.center,
        ),
        AnimatedOpacity(
          child: callActionButtons(),
          duration: Duration(milliseconds: 500),
          opacity: isScratchOver ? 1 : 0,
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 80),
              height: 44,
              width: 280,
              color: paccentColor,
              child: Text(isScratchOver? "Did You Guess?": "Scratch the Card",
              textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.pink[200],
                              fontSize: 28,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w700)),
            ))
      ]),
    );
  }

  Widget callActionButtons() {
    return Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Container(
            height: 260,
            width: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                    height: 72,
                    width: 260,
                    child: RaisedButton(
                      color: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text("Play Again",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 28,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w700)),
                      onPressed: () {
                        Navigator.push(
                            context, SlideLeftRoute(page: QuestionGenerator()));
                      },
                    )),
                Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                Container(
                    height: 72,
                    width: 260,
                    child: RaisedButton(
                      color: paccentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text("Return To Menu",
                          style: TextStyle(
                              color: Colors.pink[200],
                              fontSize: 26,
                              fontFamily: 'poppins')),
                      onPressed: () {
                        Navigator.push(context, SlideLeftRoute(page: GoHome()));
                      },
                    ))
              ],
            )));
  }

  Widget scratchCard() {
    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateX(pi * _animation.value),
        child: _animation.value >= 0.3
            ? Container(
                width: 220,
                height: 210,
                margin: EdgeInsets.only(bottom: 140),
                child: Card(
                  elevation: 20,
                  color: secondaryColor,
                ))
            : Container(
                width: 280,
                height: 360,
                margin: EdgeInsets.only(bottom: 140),
                child: Card(
                    elevation: 20,
                    color: secondaryColor,
                    child: Stack(
                      children: <Widget>[
                        AnimatedOpacity(
                          child: resultCard(),
                          duration: Duration(milliseconds: 50),
                          opacity: isScratchOver ? 1 : 0,
                        ),
                        AnimatedOpacity(
                          child: Scratcher(
                            color: secondaryColor,
                            brushSize: 70,
                            threshold: 50,
                            child: resultCard(),
                            onThreshold: () {
                              setState(() {
                                print("Scratch Over");
                                isScratchOver = true;
                              });
                            },
                          ),
                          duration: Duration(milliseconds: 200),
                          opacity: !isScratchOver ? 1 : 0,
                        ),
                      ],
                    )),
              ));
  }

  Widget resultCard() {
    return Container(
      padding: EdgeInsets.all(4),
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.all(10),
        color: Colors.pink[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: primaryColor,
              maxRadius: 88,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(dataList[0].name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 24,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
    );
  }

  goToHome() async {
    Navigator.push(
        context,
        SlideLeftRoute(
            page: Scaffold(
          appBar:
              PreferredSize(child: AppBar(), preferredSize: Size.fromHeight(0)),
          body: loadingScreen(),
        )));
  }
}
