import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interference/global.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  Widget pauseIcon, correctIcon, wrongIcon, dontknowIcon;
  bool isLoaded;
  bool isLoaded2 = false;
  bool specialAnimation = false;
  int initialListSize;

  @override
  void initState() {
    super.initState();
    isFirstQuestion = true;
    isLoaded = false;
    loading();
    setState(() {
      pauseIcon = SvgPicture.asset('assets/pause.svg', fit: BoxFit.fitHeight);
      correctIcon =
          SvgPicture.asset('assets/correct.svg', fit: BoxFit.fitHeight);
      wrongIcon = SvgPicture.asset('assets/wrong.svg', fit: BoxFit.fitHeight);
      dontknowIcon =
          SvgPicture.asset('assets/dontknow.svg', fit: BoxFit.fitWidth);
    });
    initialListSize = dataList.length;
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
                    margin: EdgeInsets.only(top: 300),
                    child: fakeStackCards()),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 300),
                    child: QuestionCard()),
                Container(
                    height: 28,
                    width: 28,
                    margin: EdgeInsets.all(16),
                    alignment: AlignmentDirectional.topStart,
                    child: pauseIcon),
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
              height: 240,
              width: 240,
              margin: EdgeInsets.fromLTRB(12, 0, 0, 240),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink[200],
              ),
            )),
        Align(
            alignment: Alignment.center,
            child: Container(
              height: 240,
              width: 360,
              margin: EdgeInsets.only(bottom: 220),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: specialAnimation? AssetImage('assets/alerted.gif'): AssetImage('assets/idle.gif'),
                      fit: BoxFit.fitWidth)),
            ))
      ],
    );
  }

  Widget linePercentageIndicator() {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: LinearPercentIndicator(
        padding: EdgeInsets.symmetric(horizontal: 48),
        animation: true,
        animationDuration: 500,
        animateFromLastPercent: true,
        progressColor: secondaryColor,
        backgroundColor: Colors.pink[200],
        percent: 1 - (dataList.length / initialListSize),
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
          child: DragTarget<String>(
            builder:
                (BuildContext context, List<String> incoming, List rejected) {
              return Container(
                height: 240,
                child: wrongIcon,
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
                  question = otherQuestion() == null ? "null" : otherQuestion();
                  print(question);
                } else {
                  question = dataList[0].name;
                  finished = true;
                  print("You guessed ${dataList[0].name}");
                }
              });
              specialAnimationSetter();
            },
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
              child: DragTarget<String>(
                builder: (BuildContext context, List<String> incoming,
                    List rejected) {
                  return Container(height: 240, child: correctIcon);
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
            margin: EdgeInsets.only(top: 140),
            child: DragTarget<String>(
              builder:
                  (BuildContext context, List<String> incoming, List rejected) {
                return Container(width: 280, height: 78, child: dontknowIcon);
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
                    print(question);
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
            margin: EdgeInsets.only(top: 64),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 190,
              height: 180,
            ),
          ),
          Card(
            elevation: 20,
            color: secondaryColor,
            margin: EdgeInsets.only(top: 32),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 200,
              height: 190,
            ),
          ),
          Card(
            elevation: 20,
            color: secondaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 210,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }

  specialAnimationSetter() async{
    var rng = Random();
    if(rng.nextInt(1) == 0){
      setState(() {
        specialAnimation = true;
      });
      Future.delayed(Duration(seconds: 3)).then((_){
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
    Future.delayed(Duration(seconds: 3, milliseconds: 700)).then((_) {
      setState(() {
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
                width: 220,
                height: 210,
                margin: EdgeInsets.only(bottom: 36),
                child: Card(
                  elevation: 20,
                  color: secondaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ))
            : Container(
                width: 220,
                height: 210,
                margin: EdgeInsets.only(bottom: 36),
                child: Card(
                    elevation: 20,
                    color: secondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Card(
                        color: Colors.pink[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Container(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                question,
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
