import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'game.dart';
import 'Utils/global.dart';
import 'services/connectivity_Handler.dart';

import 'package:http/http.dart';

var url = "https://mecinatorapi.herokuapp.com/leaderboard/";
int count = 1;

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
  StreamSubscription _connectionChangeStream;

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

    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    _connectionChangeStream =
        connectionStatus.connectionChange.listen(connectionChanged);
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: !isOffline
          ? Scaffold(
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
            )
          : noNetwork(),
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
                            brushSize: 60,
                            threshold: 45,
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

    String imageUrl = lowNoSpacedText(dataList[0].name);

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
              backgroundColor: insufficientData ? paccentColor : primaryColor,
              maxRadius: 88 * wm,
              child: CircleAvatar(
                backgroundColor: primaryColor,
                maxRadius: 80 * wm,
                child: !insufficientData
                    ? CachedNetworkImage(
                        imageUrl:
                            "https://projectinterference.000webhostapp.com/$imageUrl.jpeg",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => new Icon(
                          Icons.person_outline,
                          size: 80,
                        ),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover)),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/facepalm.png"),
                                fit: BoxFit.contain))),
              ),
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

  scoreUpdator() async {
    var response =
        await get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var map = json.decode(response.body);

    for (int i = 0; i < map.length; i++) {
      if (map[i]["name"] == dataList[0].name) {
        //Checking user did this before
        var result = await localDataBaseCheck() ?? 1;
        if (result == 0) return 0;
        //updating to firebase collection
        var score = map[i]["score"];
        if (score != null) {
          Map<String, dynamic> newValues = {
            "name": map[i]["name"],
            "score": score + 1
          };
          updateLeaderBoard(map[i]["id"], newValues);
          return 0;
        }
      }
    }

    var result = await localDataBaseCheck() ?? 1;
    if (result == 0) return 0;
    //adding to leaderboardDB
    Map<String, dynamic> newMap = {"name": dataList[0].name, "score": 1};
    createLeaderBoard(newMap);
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

  updateLeaderBoard(id, newValues) async{
    var response = await put(
      "$url$id/",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(newValues),
    );
    print('Response status: ${response.statusCode}. Updated Score');
  }
  

  createLeaderBoard(entryJson) async {
    var response = await post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(entryJson),
    );
    print('Response status: ${response.reasonPhrase}. Updated Score');
  }
}
