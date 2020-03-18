import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interference/model.dart';
import 'dart:async';

class OnlineDataBaseHandler{
  OnlineDataBaseHandler();

  Future init() async{
    deleteCollection().then((_) => addDb());
  }

  bool noerrors = true;

  addDb(){
    //adding Data
    addRow("Deon Joshy", "Aneeta", "M", "CSA", "Ernakulam", "n", "T", "christian","St.George HSS", "n", "n", "y", "y", "n");
    addRow("Tom Vempala", "Aneeta", "M", "CSA", "Kottayam", "n", "T", "christian","Kendriya Vidyalaya", "n", "n", "n", "n", "y");
    addRow("Karthika R", "Vimala", "F", "CSA", "Kottayam", "n", "R", "hindu","SFS Public School", "n", "n", "n", "n", "n");
    addRow("Poorab Shenoy", "MH", "M", "CSA", "Kannur", "n", "A", "hindu","Chinmaya Vidyalaya", "n", "n", "n", "n", "n");
    addRow("Sahil Sait", "Backer", "M", "CSA", "Kannur", "n", "S", "muslim","Chavara", "n", "n", "n", "n", "n");
    addRow("Royce Elson", "RR", "M", "CSA", "Ernakulam", "n", "R", "christian","Chavara", "n", "y", "n", "y", "n");
    addRow("Sharat Jacob Jacob", "Aneeta", "M", "CSB", "Kottayam", "n", "S", "christian","The Indian School", "n", "y", "n", "n", "y");
    addRow("Gayathry S", "Nava Jyoti", "F", "CSA", "Ernakulam", "n", "D", "hindu","Saraswathi Vidyanikethan", "n", "n", "n", "y", "n");
    addRow("Roy Jose", "RR", "M", "CSA", "Ernakulam", "n", "D", "christian","SAPS", "n", "n", "n", "n", "n");
    addRow("Navaneeth S Nair", "MH", "M", "CSB", "Palakad", "n", "T", "hindu","SAPS", "n", "y", "n", "n", "n");
    addRow("Vineeth M Vinoy", "Aneeta", "M", "CSA", "Ernakulam", "n", "R", "christian","SAPS", "n", "n", "n", "y", "y");
    addRow("Anand V", "RR", "M", "CSA", "Ernakulam", "n", "T", "hindu","Kailasanadha", "n", "n", "n", "n", "n");
    addRow("Shimil Abraham", "Better Homes", "M", "CSA", "Kozhikode", "n", "R", "christian","Auxilium Nava Jyoti", "n", "n", "n", "n", "y");
    addRow("Syyed Anwar", "Some other PG", "M", "CSB", "Pathanamthitaa", "n", "R", "muslim","Kendriya Vidyalaya", "n", "n", "n", "n", "n");
    addRow("Nayana Vinod", "Udaya", "F", "CSB", "Kottayam", "n", "D", "hindu","Chavara", "n", "n", "y", "n", "y");
    addRow("Tony Augustine", "Some other PG", "M", "CSB", "Ernakulam", "y", "S", "christian","Co-operative Public School", "n", "n", "n", "n", "y");
    addRow("Gokulnath M Prabhu", "Some other PG", "M", "CSB", "Alapuzha", "n", "R", "hindu","St Joseph Public School", "n", "y", "n", "n", "n");
    addRow("Aleena Baby", "YMCA", "F", "CSB", "Idukki", "y", "D", "christian","Placid", "n", "n", "n", "y", "n");
    addRow("Sidharth S", "Some other PG", "M", "CSA", "Idukki", "y", "S", "hindu","Vimala", "n", "n", "y", "n", "y");
    addRow("Tiss Joseph", "YMCA", "F", "CSB", "Kottayam", "n", "D", "christian","Placid", "n", "n", "n", "y", "n");
    addRow("Anjali Rajendran ", "Udaya", "F", "CSA", "Kannur", "n", "D", "hindu","Chavara", "n", "n", "n", "n", "n");
    addRow("Shweta Jayan", "YMCA", "F", "CSA", "Thiruvananthapuram", "y", "T", "hindu","St. Thomas", "n", "n", "y", "y", "n");
    addRow("Arun Sojan", "Some other PG", "M", "CSB", "Kottayam", "n", "S", "christian","Good Shepherd", "n", "y", "n", "n", "y");
    addRow("Anjali Parapattu", "YMCA", "F", "CSB", "Ernakulam", "n", "A", "christian","Mar Athanasius", "n", "n", "n", "n", "n");
    addRow("Bharath Raj R", "Shamla", "M", "CSA", "Kollam", "n", "S", "hindu","SAPS", "n", "y", "y", "n", "n");
    addRow("Denin Paul", "Aneeta", "M", "CSB", "Thrissur", "n", "T", "christian","CMI", "n", "y", "n", "n", "y");
    addRow("George Sabu", "Aneeta", "M", "CSB", "Kottayam", "n", "T", "christian","Kendriya Vidyalaya", "n", "n", "n", "n", "y");
    addRow("Abiram P", "Some other PG", "M", "CSB", "Kozhikode", "n", "A", "hindu","St Thomas", "n", "n", "n", "n", "n");
    addRow("Joel Joshua", "MH", "M", "CSA", "Kasargode", "n", "A", "christian", "Chavara", "n", "y", "n", "n", "n");
    addRow("Neeraj Hari", "Some other PG", "M", "CSA", "Alapuzha", "n", "T", "hindu","Kendriya Vidyalaya", "n", "y", "n", "n", "n");
    addRow("Akhil Prem", "Some other PG", "M", "CSB", "Kannur", "y", "D", "hindu","Bharatiya Vidya Bhavan", "n", "n", "n", "n", "n");
    addRow("Jomey J James", "MH", "M", "CSB", "Thiruvananthapuram", "n", "A", "christian","KE", "n", "y", "n", "n", "n");
    addRow("Gopika G", "Vimala", "F", "CSB", "Kottayam", "n", "R", "hindu","Govt. Girls HSS", "n", "n", "n", "n", "n");
    addRow("Ashish Mathew Philip", "MH", "M", "CSB", "Thiruvananthapuram", "n", "A", "christian","SAPS", "n", "n", "y", "n", "y");
    addRow("Sebin Davis", "MH", "M", "CSB", "Ernakulam", "n", "A", "christian","SAPS", "n", "n", "n", "n", "y");
    addRow("Abraham Jacob", "MH", "M", "CSA", "Kannur", "y", "A", "christian","SAPS", "n", "y", "n", "n", "n");
    addRow("Deepak Sembakam", "Aneeta", "M", "CSA", "Kottayam", "y", "R", "christian","SAPS", "n", "n", "n", "n", "n");
    addRow("Balu U R", "MH", "M", "CSB", "Malapuram", "y", "A", "hindu","Govt. HSS", "n", "n", "n", "n", "n");
    addRow("Vikas P Nambiar", "MH", "M", "CSB", "Kannur", "y", "A", "hindu","St.Vincent", "n", "n", "n", "n", "n");
    addRow("Nikita Menon", "Udaya", "F", "CSB", "Thrissur", "n", "S", "hindu","Sacred Heart CMI Public School", "n", "n", "y", "n", "y");
    addRow("Ansaf Muhammed", "MH", "M", "CSB", "Kannur", "y", "A", "muslim","Kendriya Vidyalaya", "n", "y", "n", "n", "n");
    addRow("Jerin Tom", "RR", "M", "CSA", "Kottayam", "n", "T", "christian","Placid", "n", "n", "n", "n", "n");
    addRow("Anjana Sudevan", "YMCA", "F", "CSA", "Kozhikode", "n", "S", "hindu","Silver Hills", "n", "y", "n", "n", "n");
    addRow("Nihitha  S", "Nava Jyoti", "F", "CSA", "Idukki", "n", "T", "hindu","Vimala", "n", "n", "n", "n", "n");
    addRow("Meghana O P", "Nava Jyoti", "F", "CSB", "Ernakulam", "n", "T", "hindu","SNMHSS, Moothakunnam", "n", "n", "n", "y", "y");
    addRow("Jagath Jijo", "Sky Blue", "M", "CSB", "Kottayam", "n", "T", "hindu","Chavara", "n", "y", "n", "n", "y");
    addRow("Faheem P P ", "Shamla", "M", "CSA", "Malapuram", "n", "D", "muslim","Hyderabad", "n", "n", "n", "n", "n");
    addRow("Ashwin Girish", "MH", "M", "CSA", "Pathanamthitaa", "y", "A", "hindu","Syrian Christian Seminary", "n", "n", "n", "n", "n");
    addRow("Sreeram Vinaykumar", "MH", "M", "CSA", "Kozhikode", "n", "A", "hindu","SAPS", "n", "n", "n", "n", "n");
    addRow("Muflih Ali K P", "Better Homes", "M", "CSB", "Kozhikode", "n", "S", "muslim","Spring Valley", "n", "n", "n", "n", "n");
    addRow("Sreelal K", "Some other PG ", "M", "CSB", "Malapuram", "n", "R", "hindu","", "n", "n", "n", "n", "n");
    addRow("Nithin Antony", "Aneeta", "M", "CSB", "Alapuzha", "n", "T", "christian","Holy Family", "n", "n", "n", "n", "n");
    addRow("Govind Gayathri", "Aneeta", "M", "CSA", "Thiruvananthapuram", "y", "A", "hindu","Kendriya Vidyalaya", "n", "n", "y", "n", "y");
    addRow("Alen J Ninan", "RR", "M", "CSB", "Malapuram", "n", "S", "christian","Placid", "n", "n", "n", "n", "n");
    addRow("Sunny James", "MH", "M", "CSB", "Kottayam", "n", "A", "christian","Placid", "n", "n", "n", "n", "n");
    addRow("Pranav Jayashankar", "NIL", "M", "CSA", "Ernakulam", "n", "R", "hindu","Bhavan's Vidya Mandir", "y", "n", "y", "n", "y");
    addRow("Noel Eldho", "NIL", "M", "CSA", "Ernakulam", "n", "T", "christian","St Mary's", "y", "y", "n", "n", "n");
    addRow("Vishruth S", "NIL", "M", "CSA", "Ernakulam", "n", "S", "hindu","Bhavan's Vidya Mandir", "y", "y", "n", "n", "y");
    addRow("Joel Joseph Jude", "NIL", "M", "CSA", "Ernakulam", "n", "T", "christian","St Sebastian's hss, palluruthi", "y", "n", "n", "n", "n");
    addRow("Gokul Sagar", "NIL", "M", "CSA", "Ernakulam", "n", "T", "hindu","KE", "y", "n", "n", "n", "n");
    addRow("Khushi Shah", "NIL", "F", "CSA", "Ernakulam", "n", "S", "hindu","Navy Children School", "y", "n", "n", "n", "n");
    addRow("Hemanth R", "NIL", "M", "CSA", "Ernakulam", "n", "A", "hindu","Bhavan's Vidya Mandir", "y", "y", "n", "n", "y");
    addRow("Aneetta Mary Sajan", "NIL", "F", "CSA", "Ernakulam", "n", "R", "christian","Navy Children School ", "y", "y", "n", "n", "n");
    addRow("Muhammed Abnan M S ", "NIL", "M", "CSA", "Ernakulam", "n", "T", "muslim","SAPS", "y", "y", "n", "n", "n");
    addRow("Kevin Abraham", "NIL", "M", "CSA", "Ernakulam", "n", "R", "christian","Toc H", "y", "y", "n", "n", "n");
    addRow("Alan Phlipose N.V ", "NIL", "M", "CSA", "Ernakulam", "n", "R", "christian","RCJPS", "y", "n", "n", "n", "n");
    addRow("Anagha S Menon", "NIL", "F", "CSA", "Ernakulam", "n", "T", "hindu","Chinmaya Vidyalaya", "y", "n", "n", "n", "n");
    addRow("Elizabeth Mary Mathew", "NIL", "F", "CSA", "Ernakulam", "n", "D", "christian","Chinmaya Vidyalaya", "y", "n", "n", "n", "y");
    addRow("Ebin Bigi", "NIL", "M", "CSA", "Ernakulam", "n", "T", "christian","Chavara", "y", "y", "n", "n", "n");
    addRow("Angela Tony", "NIL", "F", "CSA", "Ernakulam", "n", "S", "christian","Toc H", "y", "n", "n", "n", "n");
    addRow("Jessica jolly", "NIL", "F", "CSA", "Ernakulam", "n", "S", "christian","Choice school", "y", "n", "n", "n", "n");
    addRow("Nikhil George Mathew ", "NIL", "M", "CSA", "Ernakulam", "n", "T", "christian","Assisi Vidyaniketan Public school ", "y", "y", "n", "n", "n");
    addRow("Deepaklal T A", "NIL", "M", "CSA", "Ernakulam", "n", "D", "hindu","Infant Jesus", "y", "n", "n", "n", "n");
    addRow("Anitha S Menon", "NIL", "F", "CSA", "Ernakulam", "n", "S", "hindu","Saraswathi Vidyanikethan", "y", "y", "n", "n", "n");
    addRow("Ashique Ali P S", "NIL", "M", "CSA", "Ernakulam", "n", "D", "muslim","Sacred Heart CMI Public School", "y", "y", "n", "n", "n");
    addRow("Arjun Sudheer ", "NIL", "M", "CSA", "Ernakulam", "n", "T", "hindu","Choice School", "y", "y", "n", "n", "n");
    addRow("Jabira Farhath ", "NIL", "F", "CSA", "Ernakulam", "n", "D", "muslim","SNDP HSS Aluva", "y", "n", "n", "n", "n");
    addRow("Diya Naushad", "NIL", "F", "CSA", "Ernakulam", "n", "R", "muslim","Bhavan's Vidya Mandir", "y", "n", "n", "y", "n");
    addRow("PJ Aravind", "NIL", "M", "CSB", "Ernakulam", "y", "R", "hindu","KE", "y", "n", "n", "n", "n");
    addRow("Gouri Hariharan", "NIL", "F", "CSB", "Ernakulam", "n", "R", "hindu","Gregorian Public School", "y", "n", "n", "y", "n");
    addRow("Vaishnav R", "NIL", "M", "CSB", "Ernakulam", "n", "R", "hindu","Bhavan's Vidya Mandir", "y", "n", "y", "y", "n");
    addRow("Navaneeth R", "NIL", "M", "CSB", "Ernakulam", "n", "S", "hindu","Saraswathi Vidyanikethan", "y", "n", "n", "n", "n");
    addRow("Rahul S Kumar", "NIL", "M", "CSB", "Ernakulam", "n", "A", "hindu","S. T Vincent", "y", "n", "n", "y", "n");
    addRow("Adarsh R", "NIL", "M", "CSB", "Ernakulam", "n", "D", "hindu","Kendriya Vidyalaya", "y", "n", "n", "n", "n");
    addRow("Joseph Dominic Mathew", "NIL", "M", "CSB", "Ernakulam", "y", "R", "christian","St. Joseph's HSS Pulicunnu", "y", "n", "n", "n", "n");
    addRow("Amith Raveendranath", "NIL", "M", "CSB", "Ernakulam", "n", "R", "hindu","Bhavan's Vidya Mandir", "y", "y", "y", "y", "n");
    addRow("Nikhil P S", "NIL", "M", "CSB", "Ernakulam", "n", "S", "hindu","SNDPHSS Udayamperoor", "y", "n", "n", "n", "n");
    addRow("Arjun Sarma", "NIL", "M", "CSB", "Ernakulam", "n", "S", "hindu","Toc H", "y", "n", "y", "y", "n");
    addRow("Steve Sam Jacob", "NIL", "M", "CSB", "Ernakulam", "n", "R", "christian","RCJPS", "y", "n", "y", "n", "n");
    addRow("Pranoy Santhosh M", "NIL", "M", "CSB", "Ernakulam", "y", "D", "hindu","Saraswathi Vidyanikethan", "y", "n", "n", "n", "n");
    addRow("Aldrin Jenson", "NIL", "M", "CSB", "Ernakulam", "n", "T", "christian","Kendriya Vidyalaya", "y", "n", "y", "y", "y");
    addRow("Muhammed Razeen V", "NIL", "M", "CSB", "Ernakulam", "n", "R", "muslim","Bhavan's Vidya Mandir", "y", "n", "n", "n", "y");
    addRow("Nevin Manoj", "NIL", "M", "CSB", "Ernakulam", "n", "R", "hindu","Greets Public School", "y", "n", "n", "n", "n");
    addRow("V S Sreeram ", "NIL", "M", "CSB", "Ernakulam", "y", "R", "hindu","Rajashree S M Memorial School ", "y", "n", "y", "n", "n");
    addRow("Pranav H. Nair ", "NIL", "M", "CSB", "Ernakulam", "n", "D", "hindu","RCJPS", "y", "y", "n", "n", "y");
    addRow("Tony Augustine", "NIL", "M", "CSB", "Ernakulam", "y", "S", "christian","Co-operative Public School", "y", "n", "n", "n", "n");
    addRow("Adithya Anilkumar", "NIL", "M", "CSB", "Ernakulam", "n", "A", "hindu","Bhavan's Vidya Mandir", "y", "y", "n", "n", "y");
    addRow("Thomas john", "NIL", "M", "CSB", "Ernakulam", "n", "S", "christian","Peters Senior Secondary School", "y", "n", "n", "n", "n");
    addRow("Tobin abraham", "NIL", "M", "CSB", "Ernakulam", "y", "D", "christian","RCJPS", "y", "n", "n", "n", "y");
    addRow("Gautham S Baiju", "NIL", "M", "CSB", "Ernakulam", "n", "T", "hindu","RCJPS", "y", "n", "n", "n", "n");
    addRow("Aravind P Sabu", "NIL", "M", "CSB", "Ernakulam", "n", "T", "hindu","Choice School", "y", "n", "y", "y", "n");
    addRow("Krishnendu Nambiar", "NIL", "F", "CSB", "Ernakulam", "n", "T", "hindu","Navy Children School", "y", "n", "y", "y", "n");
    addRow("Devanarayan J", "NIL", "M", "CSB", "Ernakulam", "n", "R", "hindu","Vidyodaya  ", "y", "n", "n", "n", "y");
    addRow("Farhath Sulthana Jamal", "NIL", "F", "CSB", "Ernakulam", "y", "D", "muslim","St. Paul's Bethany Public School ", "y", "y", "n", "n", "n");
    addRow("Vishnu Vinod","NIL","M","CSA","Ernakulam","n","R","hindu","Saraswathi Vidyanikethan", "y", "n", "n", "n", "n");
    addRow("Dona Yeldo","NIL","F","CSA","Ernakulam","y","A","christian","MA, Puthenkurish", "y", "n", "n", "y", "n");
    addRow("Arti Bhatia","NIL","F","CSA","Ernakulam","n","T","hindu","Kendriya Vidyalaya", "y", "n", "n", "y", "y");
    addRow("Thomas SJ","NIL","M","CSA","Ernakulam","n","R","christian","Saraswathi Vidyanikethan", "y", "y", "n", "n", "n");

    if(!noerrors){
      print("There has been an error in updating the databse");
    } else{
      print("Update database successful");
    }
  } 

  Future<void> addRow(String name, String hostel, String gen, String clas, String place, String rep, String house, String rel, String school, String ds, String specs, String singer, String dancer, String programmer) async{
    Person entry = Person(name:name,hostel:hostel,gen:gen,clas:clas, place:place, rep:rep, house:house, rel:rel, school:school, ds:ds, specs:specs, singer:singer, dancer:dancer, programmer:programmer);
    var entryJson = entry.toMap();
    Firestore.instance.collection('list').add(entryJson).catchError((e){
      print(e);
      noerrors=false;
    });
  }

  Future<void> deleteCollection() async{
      Firestore.instance.collection('list').getDocuments().then((snapshot) {
      for(DocumentSnapshot doc in snapshot.documents){
        doc.reference.delete();
      }
    });
  }
}