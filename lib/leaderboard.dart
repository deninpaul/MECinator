import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'global.dart';

class LeaderBoard extends StatelessWidget {
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
          homeButton(context),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8 * wm),
            child: Column(
              children: <Widget>[
                title(),
                Padding(
                  padding: EdgeInsets.all(16),
                ),
                LeaderBoardList()
              ],
            ),
          )
        ]));
  }

  homeButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        padding: EdgeInsets.fromLTRB(16 * wm, 16 * hm, 8 * wm, 8 * hm),
        icon: Icon(Icons.arrow_back_ios, size: 42 * wm, color: secondaryColor));
  }

  title() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 100 * hm),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              color: secondaryColor,
              child: Text(
                "LeaderBoards",
                textScaleFactor: wm,
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: "poppins",
                    color: primaryColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              color: primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              margin: EdgeInsets.only(top: 8),
              child: Text(
                "The Most Searched Celebrities",
                textScaleFactor: wm,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'poppins',
                    color: secondaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LeaderBoardList extends StatefulWidget {
  @override
  LeaderBoardListState createState() => LeaderBoardListState();
}

class LeaderBoardListState extends State<LeaderBoardList> {
  Stream snapshot;

  @override
  void initState() {
    super.initState();
    listRetriever();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: snapshot,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: (550) * hm,
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                  return true;
                },
                child: ListView.builder(
                    itemCount: snapshot.data.documents.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16 * wm)),
                        color: Color(0xcc210c45),
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              24 * wm, 16 * hm, 28 * wm, 16 * hm),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 240 * wm,
                                child: Text(
                                  " ${snapshot.data.documents[index].data['name']}",
                                  overflow: TextOverflow.ellipsis,
                                  textScaleFactor: wm,
                                  style: TextStyle(
                                      fontFamily: "poppins",
                                      fontSize: 22,
                                      color: Colors.pink[200],
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 40 * hm,
                                    width: 3,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    color: Colors.pink[200],
                                  ),
                                  Text(
                                    "${snapshot.data.documents[index].data['score']}",
                                    textScaleFactor: wm,
                                    style: TextStyle(
                                        fontFamily: "poppins",
                                        fontSize: 24,
                                        color: Colors.pink[200],
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  listRetriever() async {
    var result = await Firestore.instance
        .collection('leaderboard')
        .orderBy('score', descending: true)
        .getDocuments()
        .asStream();
    setState(() {
      snapshot = result;
    });
  }
}
