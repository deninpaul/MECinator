import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:interference/global.dart';
import 'DataBase/localDBmanager.dart';
import 'questionSelector.dart';
import 'dart:async';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getDataFromOnline().then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interference',
      theme: ThemeData(primaryColor: Colors.blue),
      home: QuestionGenerator(),
    );
  }
}

class QuestionGenerator extends StatefulWidget {
  @override
  QuestionGeneratorState createState() => new QuestionGeneratorState();
}

class QuestionGeneratorState extends State<QuestionGenerator> {
  void initState() {
    super.initState();
    isFirstQuestion = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Testing Arena"),
        elevation: 0,
      ),
      body: Stack(children: <Widget>[
        Container(
          color: Colors.blue,
        ),
        noDragTarget(),
        yesDragTarget(),
        dontKnowDragTarget(),
        QuestionCard()
      ]),
    );
  }

  Widget noDragTarget() {
    return Align(
        alignment: Alignment.bottomLeft,
        child: DragTarget<String>(
          builder:
              (BuildContext context, List<String> incoming, List rejected) {
            return Container(
              margin: EdgeInsets.only(bottom: 150),
              height: 150,
              width: 100,
              child: Center(
                child: Text("No"),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
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
                otherQuestionEvaluation("n");
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
          },
        ));
  }

  Widget yesDragTarget() {
    return Align(
        alignment: Alignment.bottomRight,
        child: DragTarget<String>(
          builder:
              (BuildContext context, List<String> incoming, List rejected) {
            return Container(
              margin: EdgeInsets.only(bottom: 150),
              height: 150,
              width: 100,
              child: Center(
                child: Text("Yes"),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            );
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
                otherQuestionEvaluation("y");
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
          },
        ));
  }

  Widget dontKnowDragTarget() {
    if (isFirstQuestion == false) {
      return Align(
          alignment: Alignment.bottomCenter,
          child: DragTarget<String>(
            builder:
                (BuildContext context, List<String> incoming, List rejected) {
              return Container(
                height: 100,
                width: 250,
                child: Center(
                  child: Text("Don't Know"),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              );
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
                  otherQuestionEvaluation("d");
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
            },
          ));
    } else {
      return Container(height: 0, width: 0);
    }
  }
}

class QuestionCard extends StatefulWidget {
  @override
  QuestionCardState createState() => QuestionCardState();
}

class QuestionCardState extends State<QuestionCard> {
  bool isAccepted;

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
  }

  @override
  Widget build(BuildContext context) {
    if (!isAccepted) {
      return Material(
        color: Colors.blue,
        child: Align(
          alignment: Alignment.center,
          heightFactor: 2,
          child: Draggable(
            data: "Question",
            onDragCompleted: () {
              setState(() {
                isAccepted = true;
              });
            },
            child: card(question),
            feedback: card(question),
            childWhenDragging: Container(width: 0, height: 0),
          ),
        ),
      );
    } else {
      return QuestionCard();
    }
  }

  Widget card(String question) {
    return Container(
      height: 150,
      width: 250,
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Center(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(question)),
        ),
      ),
    );
  }

  newCard() async {
    await new Future.delayed(const Duration(seconds: 1));
  }

  @override
  void dispose() {
    print("i died");
    super.dispose();
  }
}
