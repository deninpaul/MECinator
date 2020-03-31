import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Utils/global.dart';


class Credits extends StatefulWidget {
  @override
  _CreditsState createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Behind the Screens',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: 

        Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/bgm1.png"), fit: BoxFit.cover)),
        child:  
        ListView(children: <Widget>[
        Container(
        padding: EdgeInsets.all(19),
          //decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/bgm1.png"), fit: BoxFit.cover)),
        child:  
        Column(
        children:<Widget>[
          SizedBox(height: 20,),
          
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            profile('\nTom Vempala','CSA', 'assets/tom.jpg', 'Backend Dev and \nAlgorithms',paccentColor,"https://instagram.com/tomthomasvempala"),
            SizedBox(width:15),
            profile('\nGeorge Sabu','CSB', 'assets/george.jpg', 'Backend Dev and \nAlgorithms',paccentColor,"https://instagram.com/george._.sabu"),
          ],),
          SizedBox(height:20),
           Row(
             crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            profile('\nDenin Paul','CSB', 'assets/denin.jpg', 'Frontend Dev and \nDB Management',paccentColor,"https://instagram.com/dpstudios.official"), 
            SizedBox(width:15),
            profile('\nCLINCE','', 'assets/clince.jpg', 'Music',secondaryColor,"https://instagram.com/clince.music")
          ],),
          SizedBox(height:20),




      // Expanded(child: 
      // GridView(
      //  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20,childAspectRatio: 0.65,crossAxisSpacing: 16),
        
        
      //     children: <Widget>[
      //             profile('\nTom Vempala', 'assets/tom.jpg', 'Backend Dev and \nAlgorithms',paccentColor),
      //             profile('\nGeorge Sabu', 'assets/tom.jpg', 'Backend Dev and \nAlgorithms',paccentColor),
      //             profile('\nDenin Paul', 'assets/tom.jpg', 'Frontend Dev and \nDB Management',paccentColor), 
      //             profile('\nClince', 'assets/tom.jpg', 'Music',secondaryColor),
      //     ],
      //   ),
      // ),
      Row( children: <Widget>[
        Text("For more awesome music follow",style:TextStyle(color:Colors.white,fontSize: 17)),
        FlatButton(child: Text("Clence",style:TextStyle(color:Colors.white,fontSize: 17)),onPressed: (){_launchURL("https://www.youtube.com/channel/UC_fK3X5DvdJ6qFD8xAuErOg");},)
      ],),
      Row( children: <Widget>[
        Text("For the best tech news follow",style:TextStyle(color:Colors.white,fontSize: 17)),
        FlatButton(child: Text("TechCrawler",style:TextStyle(color:Colors.white,fontSize: 17)),onPressed: (){_launchURL("https://instagram.com/techcrawler2020");},)
      ],)
      
        ]
      )
        )
        ]
        )
        )
        
      
    );
  }
}

Widget profile(name,cls, image, dept,col,url) {
  return Stack( 
    alignment: AlignmentDirectional.center,
    children:<Widget>[
  Opacity(opacity: 0.75,child:
  Container(
    width:150,height :250,
  padding: EdgeInsets.only(top:20),
  decoration: BoxDecoration(color: col,borderRadius: BorderRadius.all(Radius.circular(10))),  
  //child:
  )
  ),

  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      //SizedBox(height:20),
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
             //color: Colors.black,
             image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(75.0)),
            // boxShadow: [BoxShadow(blurRadius: 9.0, color: Colors.black)]),
        ),
        child: 
        FlatButton(
          onPressed: (){_launchURL(url);},
          shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(75.0),),
          child:Text(""),
          ),
      ),
      Container(
        child: 
        // ListTile(
        //   title: Center(child: Text(name,style:TextStyle(color:Colors.white))),
        //   subtitle: Center(child: Text(dept,style:TextStyle(color:Colors.white))),
        //  )
          Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(name,style:TextStyle(color:Colors.white,fontSize: 20),textAlign: TextAlign.center),
            SizedBox(height:2),
            Text(cls,style:TextStyle(color:Colors.white,fontSize: 16),textAlign: TextAlign.center),
            SizedBox(height:5),
            Text(dept,style:TextStyle(color:Colors.white),textAlign: TextAlign.center,)
          ],
          )
        

      )
    ],
  )
  
  ]
  );
}

_launchURL(var url) async {
  //url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}