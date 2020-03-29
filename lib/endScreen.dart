import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  QuerySnapshot leaderboardSnap;

  @protected
  void initState() {
    super.initState();

    if (!insufficientData) {
      scoreUpdator();
    }

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
    return WillPopScope(
      child: Scaffold(
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
                margin: EdgeInsets.only(top: 80 * hm),
                height: 44 * hm,
                width: 280 * wm,
                color: paccentColor,
                child: Text(
                    isScratchOver ? "Did You Guess?" : "Scratch the Card",
                    textAlign: TextAlign.center,
                    textScaleFactor: wm,
                    style: TextStyle(
                        color: Colors.pink[200],
                        fontSize: 28,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w700)),
              ))
        ]),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }

  Widget callActionButtons() {
    return Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Container(
            height: 260 * hm,
            width: 280 * wm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                    height: 72 * hm,
                    width: 260 * wm,
                    child: RaisedButton(
                      color: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24 * wm),
                      ),
                      child: Text("Play Again",
                          textScaleFactor: wm,
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
                    height: 72 * hm,
                    width: 260 * wm,
                    child: RaisedButton(
                      color: paccentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24 * wm),
                      ),
                      child: Text("Return To Menu",
                          textScaleFactor: wm,
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
                width: 220 * wm,
                height: 210 * hm,
                margin: EdgeInsets.only(bottom: 140 * hm),
                child: Card(
                  elevation: 20,
                  color: secondaryColor,
                ))
            : Container(
                width: 280 * wm,
                height: 360 * hm,
                margin: EdgeInsets.only(bottom: 140 * hm),
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
    var result;

    if (insufficientData) {
      result = "You gotta be more social, mahn.";
    } else {
      result = dataList[0].name;
    }

    return Container(
      padding: EdgeInsets.all(4),
      width: 300 * wm,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20 * wm)),
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
            Padding(padding: EdgeInsets.symmetric(vertical: 10 * hm)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32 * wm),
              child: Text(result,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  textScaleFactor: wm,
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

  scoreUpdator() async {
    QuerySnapshot queryresult =
        await Firestore.instance.collection('leaderboard').getDocuments();

    for (int i = 0; i < queryresult.documents.length; i++) {
      if (queryresult.documents[i].data['name'] == dataList[0].name) {
        //Checking user did this before
        var result = await localDataBaseCheck() ?? 1;
        if (result == 0) return 0;
        //updating to firebase collection
        var score = queryresult.documents[i].data['score'];
        if (score != null) {
          Map<String, dynamic> newValues = {
            'name': queryresult.documents[i].data['name'],
            'score': score + 1
          };
          updateLeaderBoard(queryresult.documents[i].documentID, newValues);
          return 0;
        }
      }
    }

    var result = await localDataBaseCheck() ?? 1;
    if (result == 0) return 0;
    //adding to firebase collection
    Map<String, dynamic> newValues = {'name': dataList[0].name, 'score': 1};
    createLeaderBoard(newValues);
    return 0;
  }

  localDataBaseCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list;
    int flag = 0;

    list = prefs.getStringList("didBefore") ?? List<String>();
    print(list.length);

    for (int j = 0; j < list.length; j++) {
      if (list[j] == dataList[0].name) {
        flag++;
      }
    }
    print(flag);

    if (flag == 0) {
      list.add(dataList[0].name);
      print(list.length);
      await prefs.setStringList("didBefore", list);
    } else {
      return 0;
    }
  }

  updateLeaderBoard(selectedDoc, newValues) {
    return Firestore.instance
        .collection('leaderboard')
        .document(selectedDoc)
        .updateData(newValues)
        .catchError((e) {
      print(e);
    });
  }

  createLeaderBoard(entryJson) {
    Firestore.instance.collection('leaderboard').add(entryJson).catchError((e) {
      print(e);
    });
  }
}
