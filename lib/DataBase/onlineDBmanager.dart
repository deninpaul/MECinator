import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

int flag=1;

void main(){
  print("Continue Replacing Current Data with New Data? (y or n)");
  var response = stdin.readLineSync();
  if(response == 'y'){
    deleteDb().then((_) => addDb());
  }
}

Future<Null> deleteDb() async{
  var url = "https://projectinterference.000webhostapp.com/DeleteAll.php";

  var response = await http.post(url);
  if (response.statusCode == 200) {
      print("Deleted all Data");
    } else {
      print("Not Deleted");
    }
}

void addDb() async{
  addRow("Deon Joshy","Aneeta","M","CSA","Ernakulam","n","T","christian","n");
  addRow("Tom Vempala","Aneeta","M","CSA","Kottayam","n","T","christian","n");
  addRow("Karthika R","Vimala","F","CSA","Kottayam","n","R","hindu","n");
  addRow("Poorab Shenoy","MH","M","CSA","Kannur","n","A","hindu","n");
  addRow("Sahil Sait","Backer","M","CSA","Kannur","n","S","muslim","n");
  addRow("Royce Elson","RR","M","CSA","Ernakulam","n","R","christian","n");
  addRow("Sharat Jacob Jacob","Aneeta","M","CSB","Kottayam","n","S","christian","n");
  addRow("Gayathry ","Nava Jyoti","F","CSA","Ernakulam","n","D","hindu","n");
  addRow("Roy Jose","RR","M","CSA","Ernakulam","n","D","christian","n");
  addRow("Navaneeth S Nair","MH","M","CSB","Palakad","n","T","hindu","n");
  addRow("Vineeth M Vinoy","Aneeta","M","CSA","Ernakulam","n","R","christian","n");
  addRow("Anand V","RR","M","CSA","Ernakulam","n","T","hindu","n");
  addRow("Shimil Abraham","Better Homes","M","CSA","Kozhikode","n","R","christian","n");
  addRow("Syyed Anwar","Some other PG","M","CSB","Pathanamthitaa","n","R","muslim","n");
  addRow("Nayana Vinod","Udaya","F","CSB","Kottayam","n","D","hindu","n");
  addRow("Tony Augustine","Some other PG","M","CSB","Ernakulam","y","S","christian","n");
  addRow("Gokulnath M Prabhu","Some other PG","M","CSB","Alapuzha","n","R","hindu","n");
  addRow("Aleena Baby","YMCA","F","CSB","Idukki","y","D","christian","n");
  addRow("Sidharth S","Some other PG","M","CSA","Idukki","y","S","hindu","n");
  addRow("Tiss Joseph","YMCA","F","CSB","Kottayam","n","D","christian","n");
  addRow("Anjali Rajendran ","Udaya","F","CSA","Kannur","n","D","hindu","n");
  addRow("Shweta Jayan","YMCA","F","CSA","Thiruvananthapuram","y","T","hindu","n");
  addRow("Arun Sojan","Some other PG","M","CSB","Kottayam","n","S","christian","n");
  addRow("Anjali Parapattu","YMCA","F","CSB","Ernakulam","n","A","christian","n");
  addRow("Bharath Raj R","Shamla","M","CSA","Kollam","n","S","hindu","n");
  addRow("Denin Paul","Aneeta","M","CSB","Thrissur","n","T","christian","n");
  addRow("George Sabu","Aneeta","M","CSB","Kottayam","n","T","christian","n");
  addRow("Abiram P","Some other PG","M","CSB","Kozhikode","n","A","hindu","n");
  addRow("Joel Joshua","MH","M","CSA","Kasargode","n","A","christian","n");
  addRow("Neeraj Hari","Some other PG","M","CSA","Alapuzha","n","T","hindu","n");
  addRow("Akhil Prem","Some other PG","M","CSB","Kannur","y","D","hindu","n");
  addRow("Jomey J James","MH","M","CSB","Thiruvananthapuram","n","A","christian","n");
  addRow("Gopika G","Vimala","F","CSB","Kottayam","n","R","hindu","n");
  addRow("Ashish Mathew Philip","MH","M","CSB","Thiruvananthapuram","n","A","christian","n");
  addRow("Sebin Davis","MH","M","CSB","Ernakulam","n","A","christian","n");
  addRow("Abraham Jacob","MH","M","CSA","Kannur","y","A","christian","n");
  addRow("Deepak Sembakam","Aneeta","M","CSA","Kottayam","y","R","christian","n");
  addRow("Balu U R","MH","M","CSB","Malapuram","y","A","hindu","n");
  addRow("Vikas P Nambiar","MH","M","CSB","Kannur","y","A","hindu","n");
  addRow("Nikita Menon","Udaya","F","CSB","Thrissur","n","S","hindu","n");
  addRow("Ansaf Muhammed","MH","M","CSB","Kannur","y","A","muslim","n");
  addRow("Jerin Tom","RR","M","CSA","Kottayam","n","T","christian","n");
  addRow("Anjana Sudevan","YMCA","F","CSA","Kozhikode","n","S","hindu","n");
  addRow("Nihitha  S","Nava Jyoti","F","CSA","Idukki","n","T","hindu","n");
  addRow("Meghana O P","Nava Jyoti","F","CSB","Ernakulam","n","T","hindu","n");
  addRow("Jagath Jijo","Sky Blue","M","CSB","Kottayam","n","T","hindu","n");
  addRow("Faheem P P ","Shamla","M","CSA","Malapuram","n","D","muslim","n");
  addRow("Ashwin Girish","MH","M","CSA","Pathanamthitaa","y","A","hindu","n");
  addRow("Sreeram","MH","M","CSA","Kozhikode","n","A","hindu","n");
  addRow("Nithin Antony","Aneeta","M","CSB","Alapuzha","n","T","christian","n");
  addRow("Govind Gayathri","Aneeta","M","CSA","Thiruvananthapuram","y","A","hindu","n");
  addRow("Alen J Ninan","RR","M","CSB","Malapuram","n","S","christian","n");
      ///DS
  addRow("Gokul Sagar","NIL","M","CSA","Ernakulam","n","T","hindu","y");
  addRow("Khushi Shah","NIL","F","CSA","Ernakulam","n","S","hindu","y");
  addRow("Hemanth","NIL","M","CSA","Ernakulam","n","A","hindu","y");
  addRow("Aneetta Mary Sajan","NIL","F","CSA","Ernakulam","n","R","christian","y");
  addRow("Muhammed Abnan M S ","NIL","M","CSA","Ernakulam","n","T","muslim","y");
  addRow("Kevin abraham","NIL","M","CSA","Ernakulam","n","R","christian","y");
  addRow("Pranav Jayashankar","NIL","M","CSA","Ernakulam","n","R","hindu","y");
  addRow("Alan Phlipose N.V ","NIL","M","CSA","Ernakulam","n","R","christian","y");
  addRow("Anagha S Menon","NIL","F","CSA","Ernakulam","n","T","hindu","y");
  addRow("Elizabeth Mary Mathew","NIL","F","CSA","Ernakulam","n","D","christian","y");
  addRow("Noel Eldho","NIL","M","CSA","Ernakulam","n","T","christian","y");
  addRow("Vishruth S","NIL","M","CSA","Ernakulam","n","S","hindu","y");
  addRow("Ebin Bigi","NIL","M","CSA","Ernakulam","n","T","christian","y");
  addRow("Angela Tony","NIL","F","CSA","Ernakulam","n","S","christian","y");
  addRow("Jessica jolly","NIL","F","CSA","Ernakulam","n","S","christian","y");
  addRow("Nikhil George Mathew ","NIL","M","CSA","Ernakulam","n","T","christian","y");
  addRow("Deepaklal T A","NIL","M","CSA","Ernakulam","n","D","hindu","y");
  addRow("JOEL JOSEPH JUDE","NIL","M","CSA","Ernakulam","n","T","christian","y");
  addRow("ANITHA S MENON","NIL","F","CSA","Ernakulam","n","S","hindu","y");
  addRow("Ashique Ali P S","NIL","M","CSA","Ernakulam","n","D","muslim","y");
  addRow("Arjun Sudheer ","NIL","M","CSA","Ernakulam","n","T","hindu","y");
  addRow("Jabira Farhath ","NIL","F","CSA","Ernakulam","n","D","muslim","y");
  addRow("Diya Naushad","NIL","F","CSA","Ernakulam","n","R","muslim","y");
  addRow("P j ARAVIND","NIL","M","CSB","Ernakulam","y","R","hindu","y");
  addRow("Gouri Hariharan","NIL","F","CSB","Ernakulam","n","R","hindu","y");
  addRow("Vaishnav R","NIL","M","CSB","Ernakulam","n","R","hindu","y");
  addRow("Navaneeth R","NIL","M","CSB","Ernakulam","n","S","hindu","y");
  addRow("Rahul S Kumar","NIL","M","CSB","Ernakulam","n","A","hindu","y");
  addRow("Adarsh r","NIL","M","CSB","Ernakulam","n","D","hindu","y");
  addRow("Joseph Dominic Mathew","NIL","M","CSB","Ernakulam","y","R","christian","y");
  addRow("Amith Raveendranath","NIL","M","CSB","Ernakulam","n","R","hindu","y");
  addRow("Nikhil P S","NIL","M","CSB","Ernakulam","n","S","hindu","y");
  addRow("Arjun Sarma","NIL","M","CSB","Ernakulam","n","S","hindu","y");
  addRow("Steve Sam Jacob","NIL","M","CSB","Ernakulam","n","R","christian","y");
  addRow("Pranoy Santhosh M","NIL","M","CSB","Ernakulam","y","D","hindu","y");
  addRow("Aldrin Jenson","NIL","M","CSB","Ernakulam","n","T","christian","y");
  addRow("Muhammed Razeen V","NIL","M","CSB","Ernakulam","n","R","muslim","y");
  addRow("Nevin Manoj","NIL","M","CSB","Ernakulam","n","R","hindu","y");
  addRow("V S Sreeram ","NIL","M","CSB","Ernakulam","y","R","hindu","y");
  addRow("Pranav H. Nair ","NIL","M","CSB","Ernakulam","n","D","hindu","y");
  addRow("Tony Augustine","NIL","M","CSB","Ernakulam","y","S","christian","y");
  addRow("Adithya Anilkumar","NIL","M","CSB","Ernakulam","n","A","hindu","y");
  addRow("Thomas john","NIL","M","CSB","Ernakulam","n","S","christian","y");
  addRow("Tobin abraham","NIL","M","CSB","Ernakulam","y","D","christian","y");
  addRow("Gautham S Baiju","NIL","M","CSB","Ernakulam","n","T","hindu","y");
  addRow("Aravind P Sabu","NIL","M","CSB","Ernakulam","n","T","hindu","y");
  addRow("Krishnendu Nambiar","NIL","F","CSB","Ernakulam","n","T","hindu","y");
  addRow("Devanarayan J","NIL","M","CSB","Ernakulam","n","R","hindu","y");
  addRow("Nikita Menon","NIL","F","CSB","Ernakulam","n","S","hindu","y");
  addRow("Farhath Sulthana Jamal","NIL","F","CSB","Ernakulam","y","D","muslim","y");
}

void addRow(String name, String hostel, String clas, String gen, String place, String rep, String house, String ds, String rel){
  var url = "https://projectinterference.000webhostapp.com/AddRow.php";

  http.post(url, body: {
      "name" : name,
      "hostel" : hostel,
      "clas" : clas,
      "gen" : gen,
      "place" : place,
      "rep" : rep,
      "house" : house,
      "ds" : ds,
      "rel" : rel
    }).then((_) => print("Adding Row ${flag++}"));
}