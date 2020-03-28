import 'dart:async';
import 'package:flutter/material.dart';
import 'package:interference/DataBase/localDBmanager.dart';
import 'package:interference/endScreen.dart';
import 'package:interference/global.dart';
import 'global.dart';
import 'global.dart';
import 'global.dart';
import 'global.dart';
import 'questionSelector.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/animation.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math';

class QuestionGenerator extends StatefulWidget {
  @override
  QuestionGeneratorState createState() => new QuestionGeneratorState();
}

class QuestionGeneratorState extends State<QuestionGenerator> {
  bool isLoaded;
  bool isLoaded2 = false;
  bool specialAnimation = false;
  int initialListSize;

  @override
  void initState() {
    super.initState();
    dataListImporter();
    isFirstQuestion = true;
    isLoaded = false;
    loading();
  }

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
        body: isLoaded
            ? Stack(children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/bgm2.png'),
                            fit: BoxFit.fitWidth))),
                noDragTarget(),
                yesDragTarget(),
                dontKnowDragTarget(),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 300*hm),
                    child: fakeStackCards()),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 300*hm),
                    child: QuestionCard()),
                Card(
                    margin: EdgeInsets.all(16),
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: IconButton(
                        onPressed: () {
                          pauseDialog(context);
                        },
                        padding: EdgeInsets.fromLTRB(0, 0, 8, 8),
                        icon: Icon(Icons.pause,
                            size: 48, color: secondaryColor))),

                // ),
                linePercentageIndicator(),
                charAnimation(),
              ])
            : Stack(children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/bgm2.png'),
                            fit: BoxFit.fitWidth))),
                AnimatedOpacity(
                  child: loadingScreen(),
                  duration: Duration(milliseconds: 400),
                  opacity: !isLoaded2 ? 1 : 0,
                ),
              ]));
  }

  Widget charAnimation() {
    return Stack(
      children: <Widget>[
        Align(
            alignment: Alignment.center,
            child: Container(
              height: 240*hm,
              width: 240*wm,
              margin: EdgeInsets.fromLTRB(12, 0, 0, 240*hm),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink[200],
              ),
            )),
        Align(
            alignment: Alignment.center,
            child: Container(
              height: 240*hm,
              width: 360*wm,
              margin: EdgeInsets.only(bottom: 220*hm),
              decoration: BoxDecoration(
                  image: specialAnimation
                      ? DecorationImage(
                          image: AssetImage('assets/alerted.gif'),
                          fit: BoxFit.fitWidth)
                      : DecorationImage(
                          image: AssetImage('assets/idle.gif'),
                          fit: BoxFit.fitWidth)),
            ))
      ],
    );
  }

  pauseDialog(BuildContext context) {
    return showDialog(
        context: this.context,
        barrierDismissible: false,
        child: Center(
            child: Container(
          height: 300*hm,
          width: 300*wm,
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(32*wm)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                  color: secondaryColor,
                  elevation: 0,
                  child: IconButton(
                      iconSize: 80,
                      color: primaryColor,
                      icon: Icon(Icons.play_circle_outline),
                      onPressed: () {
                        Navigator.pop(context);
                      })),
              Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
              Card(
                  color: secondaryColor,
                  elevation: 0,
                  child: IconButton(
                      iconSize: 80,
                      color: primaryColor,
                      icon: Icon(Icons.home),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => GoHome()));
                      })),
            ],
          ),
        )));
  }

  Widget linePercentageIndicator() {
    return Container(
      padding: const EdgeInsets.only(top: 90*0.8),
      child: LinearPercentIndicator(
        padding: EdgeInsets.symmetric(horizontal: 48*wm),
        animation: true,
        animationDuration: 500,
        animateFromLastPercent: true,
        progressColor: secondaryColor,
        backgroundColor: Colors.pink[200],
        percent: (-log(dataList.length / initialListSize)) / 4.69,
        lineHeight: 20,
        linearStrokeCap: LinearStrokeCap.roundAll,
      ),
    );
  }

  Widget noDragTarget() {
    return AnimatedOpacity(
        opacity: isLoaded ? 1 : 0,
        duration: Duration(milliseconds: 700),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: EdgeInsets.only(right: 338*wm),
            child: DragTarget<String>(
              builder:
                  (BuildContext context, List<String> incoming, List rejected) {
                return Container(
                  height: 240*hm,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/wrong.png'),
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.centerRight)),
                );
              },
              onWillAccept: (data) {
                return true;
              },
              onAccept: (data) {
                print("It falled in no");
                setState(() {
                  if (isFirstQuestion == true) {
                    firstQuestionEvaluator("n");
                    firstQuestionEvaluator("n");
                    isFirstQuestion = false;
                  } else {
                    otherQuestionEvaluator("n");
                  }

                  print("${dataList.length}");

                  if (dataList.length != 1) {
                    question =
                        otherQuestion() == null ? "null" : otherQuestion();
                    print(question);
                  } else {
                    question = dataList[0].name;
                    finished = true;
                    print("You guessed ${dataList[0].name}");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EndScreen()));
                  }
                });
                specialAnimationSetter();
              },
            ),
          ),
        ));
  }

  Widget yesDragTarget() {
    return AnimatedOpacity(
        opacity: isLoaded ? 1 : 0,
        duration: Duration(milliseconds: 700),
        child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(left: 338*wm),
              child: DragTarget<String>(
                builder: (BuildContext context, List<String> incoming,
                    List rejected) {
                  return Container(
                      height: 240*hm,
                      width: 200*wm,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/correct.png'),
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.centerLeft)));
                },
                onWillAccept: (data) {
                  return true;
                },
                onAccept: (data) {
                  print("It falled in yes");
                  setState(() {
                    if (isFirstQuestion == true) {
                      firstQuestionEvaluator("y");
                      firstQuestionEvaluator("y");
                      isFirstQuestion = false;
                    } else {
                      otherQuestionEvaluator("y");
                    }

                    print("${dataList.length}");

                    if (dataList.length != 1) {
                      question =
                          otherQuestion() == null ? "null" : otherQuestion();
                      print(question);
                    } else {
                      question = dataList[0].name;
                      finished = true;
                      print("You guessed ${dataList[0].name}");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => EndScreen()));
                    }
                  });
                  specialAnimationSetter();
                },
              ),
            )));
  }

  Widget dontKnowDragTarget() {
    return AnimatedOpacity(
      opacity: !isFirstQuestion ? 1 : 0,
      duration: Duration(milliseconds: 500),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(top: 140*hm),
            child: DragTarget<String>(
              builder:
                  (BuildContext context, List<String> incoming, List rejected) {
                return Container(
                    width: 280*wm,
                    height: 77*hm,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/dontknow.png'),
                            fit: BoxFit.fitWidth)));
              },
              onWillAccept: (data) {
                return true;
              },
              onAccept: (data) {
                print("It falled in don't know");
                setState(() {
                  if (isFirstQuestion == true) {
                    firstQuestionEvaluator("d");
                    firstQuestionEvaluator("d");
                    //because it works...
                    isFirstQuestion = false;
                  } else {
                    otherQuestionEvaluator("d");
                  }

                  print("${dataList.length}");

                  if (dataList.length > 1) {
                    question = otherQuestion();
                    // question = question == null ? "Nope" : question;
                    print(question);
                  } else {
                    question = dataList[0].name;
                    finished = true;
                    print("You guessed ${dataList[0].name}");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EndScreen()));
                  }
                });
                specialAnimationSetter();
              },
            ),
          )),
    );
  }

  Widget fakeStackCards() {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Card(
            elevation: 20,
            color: secondaryColor,
            margin: EdgeInsets.only(top: 64*hm),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20*wm)),
            child: Container(
              width: 190*wm,
              height: 180*hm,
            ),
          ),
          Card(
            elevation: 20,
            color: secondaryColor,
            margin: EdgeInsets.only(top: 32*hm),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20*wm)),
            child: Container(
              width: 200*wm,
              height: 190*hm,
            ),
          ),
          Card(
            elevation: 20,
            color: secondaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20*wm)),
            child: Container(
              width: 210*wm,
              height: 200*hm,
            ),
          ),
        ],
      ),
    );
  }

  specialAnimationSetter() async {
    var rng = Random();
    var random = rng.nextInt(3);
    if (random == 0 || random == 1) {
      setState(() {
        specialAnimation = true;
      });
      Future.delayed(Duration(seconds: 4)).then((_) {
        setState(() {
          specialAnimation = false;
        });
      });
    }
  }

  loading() async {
    Future.delayed(Duration(seconds: 4)).then((_) {
      setState(() {
        isLoaded = true;
      });
    });
    Future.delayed(Duration(seconds: 3)).then((_) {
      setState(() {
        initialListSize = dataList.length;
        isLoaded2 = true;
      });
    });
  }
}

class QuestionCard extends StatefulWidget {
  @override
  QuestionCardState createState() => QuestionCardState();
}

class QuestionCardState extends State<QuestionCard>
    with SingleTickerProviderStateMixin {
  bool isAccepted;
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  AnimationController _animationController;
  Animation _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @protected
  void initState() {
    super.initState();
    setState(() {
      isAccepted = false;

      if (isFirstQuestion == true) {
        initialiser();
        question = firstQuestion();
        print(question);
      }
    });

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
    if (!isAccepted) {
      return Draggable(
        data: "Question",
        onDragCompleted: () {
          setState(() {
            isAccepted = true;
          });
        },
        child: card(),
        feedback: card(),
        childWhenDragging: Card(),
      );
    } else {
      return QuestionCard();
    }
  }

  Widget card() {
    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateX(pi * _animation.value),
        child: _animation.value >= 0.3
            ? Container(
                width: 220*wm,
                height: 210*hm,
                margin: EdgeInsets.only(bottom: 36*hm),
                child: Card(
                  elevation: 20,
                  color: secondaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20*wm)),
                ))
            : Container(
                width: 220*wm,
                height: 210*hm,
                margin: EdgeInsets.only(bottom: 36*hm),
                child: Card(
                    elevation: 20,
                    color: secondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20*wm)),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Card(
                        color: Colors.pink[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20*wm)),
                        child: Center(
                          child: Container(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                question,
                                textScaleFactor: wm,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: primaryColor,
                                    fontFamily: 'quicksand',
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                      ),
                    ))));
  }

  @override
  void dispose() {
    print("i died");
    super.dispose();
  }
}
