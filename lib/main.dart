import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:interference/global.dart';
import 'DataBase/localDBmanager.dart';
import 'questionSelector.dart';

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
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: EdgeInsets.only(bottom: 150),
            height: 150,
            width: 50,
            child: Center(
              child: Text("No"),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: EdgeInsets.only(bottom: 150),
            height: 150,
            width: 50,
            child: Center(
              child: Text("Yes"),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            width: 250,
            child: Center(
              child: Text("Don't Know"),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        QuestionCard()
      ]),
    );
  }
}

class QuestionCard extends StatefulWidget {
  @override
  QuestionCardState createState() => QuestionCardState();
}

class QuestionCardState extends State<QuestionCard> {
  @protected
  void initState() {
    super.initState();
    setState(() {
      if (isFirstQuestion == true) {
        initialiser();
        question = firstQuestion();
      }
    });
    print(question);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: Align(
        alignment: Alignment.center,
        heightFactor: 2,
        child: Draggable(
          child: card(question),
          feedback: card(question),
          childWhenDragging: Container(width: 0, height: 0),
        ),
      ),
    );
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
}
