import 'dart:math';
import 'dart:io';

int nrep, nhostel, nplace, nregion, nhouse,nschool, nrel, ngen, nclas, nds, nspecs, nsinger, ndancer, nprogrammer;
int fcount;
String row, lastrow, lastvalue, value, da, regg;
bool firstQuestionCSA;

List<Person> dataList;
List<String> idk;

int fleg =0;

bool randomFlag(){
  if(fleg==0)
  {
    fleg=1;
    return true;
  }
  final flag = new Random();
  if(flag.nextInt(2)==1)
    return true;
  else
    return false;
}

class Person {
  String name;
  String hostel;
  String clas;
  String gen;
  String place;
  String rep;
  String house;
  String region;
  String ds;
  String rel;
  String school;
  String specs;
  String singer;
  String dancer;
  String programmer;

  Person(name, hostel, gen, clas, place, rep, house, rel, school, ds, specs, singer, dancer, programmer){
    this.name = name;
    this.hostel = hostel;
    this.gen = gen;
    this.clas = clas;
    this.place = place;
    this.rep = rep;
    this.house = house;
    this.rel = rel;
    this.house = house;
    this.rel = rel;
    this.school = school;
    this.ds = ds;
    this.specs = specs;
    this.singer = singer;
    this.dancer = dancer;
    this.programmer =programmer;
  }
}

List<String> cA; //Counted Already

bool ifcA(String x) //if counted already
{
  for(int i=0;i<cA.length;i++)
        if(cA[i]==x)
          return true;
      return false;
}


void main(){
initialiser();
fcount=1;
addDb();

String ques;
// ques = firstQuestion();
// print(ques);
// String ans= stdin.readLineSync();
// firstQuestionEvaluator(ans);
// firstQuestionEvaluator(ans);
String ans;

while(dataList.length>1){
  ques = otherQuestion();
  print(ques);
  if(row=="insufff") return;
  ans = stdin.readLineSync();
  otherQuestionEvaluator(ans);
}

print("Person thinking of: ${dataList[0].name}");

}


void addDb() {
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
    addRow("Meghana O P", "Nava Jyoti", "F", "CSB", "Ernakulam", "n", "T", "hindu","", "n", "n", "n", "y", "y");
    addRow("Jagath Jijo", "Sky Blue", "M", "CSB", "Kottayam", "n", "T", "hindu","Chavara", "n", "y", "n", "n", "y");
    addRow("Faheem P P ", "Shamla", "M", "CSA", "Malapuram", "n", "D", "muslim","Hyderabad", "n", "n", "n", "n", "n");
    addRow("Ashwin Girish", "MH", "M", "CSA", "Pathanamthitaa", "y", "A", "hindu","", "n", "n", "n", "n", "n");
    addRow("Sreeram Vinaykumar", "MH", "M", "CSA", "Kozhikode", "n", "A", "hindu","SAPS", "n", "n", "n", "n", "n");
    addRow("Muflih Ali K P", "Better Homes", "M", "CSB", "Kozhikode", "n", "S", "muslim","Spring Valley", "n", "n", "n", "n", "n");
    addRow("Sreelal K", "Some other PG ", "M", "CSB", "Malapuram", "n", "R", "hindu","", "n", "n", "n", "n", "n");
    addRow("Nithin Antony", "Aneeta", "M", "CSB", "Alapuzha", "n", "T", "christian","Holy Family", "n", "n", "n", "n", "n");
    addRow("Govind Gayathri", "Aneeta", "M", "CSA", "Thiruvananthapuram", "y", "A", "hindu","Kendriya Vidyalaya", "n", "n", "y", "n", "y");
    addRow("Alen J Ninan", "RR", "M", "CSB", "Malapuram", "n", "S", "christian","Placid", "n", "n", "n", "n", "n");
    addRow("Sunny James", "MH", "M", "CSB", "Kottayam", "n", "A", "christian","Placid", "n", "n", "n", "n", "n");
    


    ///DS
    addRow("Gokul Sagar", "NIL", "M", "CSA", "Ernakulam", "n", "T", "hindu","KE", "y", "n", "n", "n", "n");
    addRow("Khushi Shah", "NIL", "F", "CSA", "Ernakulam", "n", "S", "hindu","Navy Children School", "y", "n", "n", "n", "n");
    addRow("Hemanth R", "NIL", "M", "CSA", "Ernakulam", "n", "A", "hindu","Bhavan's Vidya Mandir", "y", "y", "n", "n", "y");
    addRow("Aneetta Mary Sajan", "NIL", "F", "CSA", "Ernakulam", "n", "R", "christian","Navy Children School ", "y", "y", "n", "n", "n");
    addRow("Muhammed Abnan M S ", "NIL", "M", "CSA", "Ernakulam", "n", "T", "muslim","SAPS", "y", "y", "n", "n", "n");
    addRow("Kevin Abraham", "NIL", "M", "CSA", "Ernakulam", "n", "R", "christian","Toc H", "y", "y", "n", "n", "n");
    addRow("Pranav Jayashankar", "NIL", "M", "CSA", "Ernakulam", "n", "R", "hindu","Bhavan's Vidya Mandir", "y", "n", "y", "n", "y");
    addRow("Alan Phlipose N.V ", "NIL", "M", "CSA", "Ernakulam", "n", "R", "christian","RCJPS", "y", "n", "n", "n", "n");
    addRow("Anagha S Menon", "NIL", "F", "CSA", "Ernakulam", "n", "T", "hindu","Chinmaya Vidyalaya", "y", "n", "n", "n", "n");
    addRow("Elizabeth Mary Mathew", "NIL", "F", "CSA", "Ernakulam", "n", "D", "christian","Chinmaya Vidyalaya", "y", "n", "n", "n", "y");
    addRow("Noel Eldho", "NIL", "M", "CSA", "Ernakulam", "n", "T", "christian","St Mary's", "y", "y", "n", "n", "n");
    addRow("Vishruth S", "NIL", "M", "CSA", "Ernakulam", "n", "S", "hindu","Bhavan's Vidya Mandir", "y", "y", "n", "n", "y");
    addRow("Ebin Bigi", "NIL", "M", "CSA", "Ernakulam", "n", "T", "christian","Chavara", "y", "y", "n", "n", "n");
    addRow("Angela Tony", "NIL", "F", "CSA", "Ernakulam", "n", "S", "christian","Toc H", "y", "n", "n", "n", "n");
    addRow("Jessica jolly", "NIL", "F", "CSA", "Ernakulam", "n", "S", "christian","Choice school", "y", "n", "n", "n", "n");
    addRow("Nikhil George Mathew ", "NIL", "M", "CSA", "Ernakulam", "n", "T", "christian","Assisi Vidyaniketan Public school ", "y", "y", "n", "n", "n");
    addRow("Deepaklal T A", "NIL", "M", "CSA", "Ernakulam", "n", "D", "hindu","Infant Jesus", "y", "n", "n", "n", "n");
    addRow("Joel Joseph Jude", "NIL", "M", "CSA", "Ernakulam", "n", "T", "christian","St Sebastian's hss, palluruthi", "y", "n", "n", "n", "n");
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

}

addRow(name, hostel, gen, clas, place, rep, house, rel, school, ds, specs, singer, dancer, programmer){
  Person newPer = Person(name, hostel, gen, clas, place, rep, house, rel, school, ds, specs, singer, dancer, programmer);
  dataList.add(newPer);
  print("Added ${fcount++}");
}



initialiser() {
  nrep = 1;
  nhostel = 1;
  nds = 1;
  nplace = 1;
  nhouse = 1;
  nclas = 1;
  ngen = 1;
  nrel = 1;
  row = "abc";
  lastrow = "xyz";
  lastvalue = "qwe";
  value = "zxc";
  da = "the person you are thinking of";
  idk  = List<String>();
  dataList = List<Person>();
}



void rmp(Person per) {
  dataList.remove(per);
}

int count() {
  return dataList.length;
}


bool present(var x)
  {
      for(int i=0;i<idk.length;i++)
        if(idk[i]==x)
          return true;
      return false;
  }





void findrow(){
  fleg=0;
  int i,j,half=count() ~/ 2, max=1000,c,delta;

  //class
cA = List<String>();
for(i=0;i<dataList.length;i++)
  {
      c=0;
      if(ifcA(dataList[i].clas))
        continue;
      cA.add(dataList[i].clas);
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[i].clas==dataList[j].clas){
          c++;
          //print(dataList[i].hostel);
      }}
    delta=(half-c).abs();
    if(delta<max|| randomFlag())
    {
      max=delta;
      row="clas";
      value=dataList[i].clas;
      print("half=$half delta=$delta row=$row value=$value");
    }
  }

  //Hostel
cA = List<String>();
  for(i=0;i<dataList.length;i++)
  {
      c=0;
      if(ifcA(dataList[i].hostel))
        continue;
      cA.add(dataList[i].hostel);
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[i].hostel==dataList[j].hostel){
          c++;
          //print(dataList[i].hostel);
      }}
    delta=(half-c).abs();
    if(delta<=max&&(!present(dataList[i].hostel))&&dataList[i].hostel!="NIL")
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="hostel";
        value=dataList[i].hostel;
        print("half=$half delta=$delta row=$row value=$value");
      }
    }
  }

  //school
cA = List<String>();
  for(i=0;i<dataList.length;i++)
  {
      c=0;
      if(ifcA(dataList[i].school))
        continue;
      cA.add(dataList[i].school);
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[i].school==dataList[j].school)
          c++;
      }
    delta=(half-c).abs();
    if(delta<=max&&(!present(dataList[i].school))&&dataList[i].school!="NIL"&&nschool!=0)
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="school";
        value=dataList[i].school;
      }
    }
  }

  //gen
cA = List<String>();
  for(i=0;i<dataList.length;i++)
  {
      c=0;
      if(ifcA(dataList[i].gen))
        continue;
      cA.add(dataList[i].gen);
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[i].gen==dataList[j].gen)
          c++;
      }
    delta=(half-c).abs();
    if(delta<=max&&ngen!=0)
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="gen";
        value=dataList[i].gen;
      }
    }
  }

   //region
cA = List<String>();
  for(i=0;i<dataList.length;i++)
  {
      c=0;
      if(ifcA(dataList[i].region))
        continue;
      cA.add(dataList[i].region);
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[i].region==dataList[j].region)
          c++;
      }
    delta=(half-c).abs();
    if(delta<=max&&nregion!=0)
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="region";
        value=dataList[i].region;
      }
   }
  }

  //ds
cA = List<String>();
  for(i=0;i<dataList.length;i++)
  {
      c=0;
      if(ifcA(dataList[i].ds))
        continue;
      cA.add(dataList[i].ds);
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[i].ds==dataList[j].ds)
          c++;
      }
    delta=(half-c).abs();
    if(delta<=max&&nds!=0)
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="ds";
        value=dataList[i].ds;
      }
    }
  }
//house
cA = List<String>();
  for(i=0;i<dataList.length;i++)
  {
      c=0;
      if(ifcA(dataList[i].house))
        continue;
      cA.add(dataList[i].house);
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[i].house==dataList[j].house)
          c++;
      }
    delta=(half-c).abs();
    if( delta<=max && nhouse!=0)
    {
      if(delta<max && randomFlag()){
        max=delta;
        row="house";
        value=dataList[i].house;
      }
    }
  }
  //rel
cA = List<String>();
  for(i=0;i<dataList.length;i++)
  {
      c=0;
      if(ifcA(dataList[i].rel))
        continue;
      cA.add(dataList[i].rel);
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[i].rel==dataList[j].rel)
          c++;
      }
    delta=(half-c).abs();
    print("delta of rel:$delta but max rn is $max");
    if(delta<=max&&nrel!=0)
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="rel";
        value=dataList[i].rel;
      }
    }
  }

  //rep
  {
      c=0;
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[j].rep=="y")
          c++;
      }
    delta=(half-c).abs();
    if(delta<=max&&nrep!=0)
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="rep";
        value="y";
      }
    }
    c=0;
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[j].rep=="n")
          c++;
      }
    delta=(half-c).abs();
    if(delta<=max&&nrep!=0)
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="rep";
        value="n";
      }
    }
  }

  //place
cA = List<String>();
  for(i=0;i<dataList.length;i++)
  {
      c=0;
      if(ifcA(dataList[i].place))
        continue;
      cA.add(dataList[i].place);
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[i].place==dataList[j].place)
          c++;
      }
    delta=(half-c).abs();
    if(delta<=max&&nplace!=0)
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="place";
        value=dataList[i].place;
      }
    }
  }

//specs
  {
      c=0;
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[j].specs=="y")
          c++;
      }
    delta=(half-c).abs();
    if(delta<=max&&nspecs!=0)
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="specs";
        value="y";
      }
    }
    c=0;
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[j].specs=="n")
          c++;
      }
    delta=(half-c).abs();
    if(delta<max&&nspecs!=0)
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="specs";
        value="n";
      }
    }
  }

  //singer
  {
      c=0;
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[j].singer=="y")
          c++;
      }
    delta=(half-c).abs();
    if(delta<=max&&nsinger!=0)
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="singer";
        value="y";
      }
    }
    c=0;
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[j].singer=="n")
          c++;
      }
    delta=(half-c).abs();
    if(delta<=max&&nsinger!=0)
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="singer";
        value="n";
      }
    }
  }

  //dancer
  {
      c=0;
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[j].dancer=="y")
          c++;
      }
    delta=(half-c).abs();
    if(delta<=max&&ndancer!=0)
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="dancer";
        value="y";
      }
    }
    c=0;
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[j].dancer=="n")
          c++;
      }
    delta=(half-c).abs();
    if(delta<=max&&ndancer!=0)
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="dancer";
        value="n";
      }
    }
  }

//programmer
  {
      c=0;
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[j].programmer=="y")
          c++;
      }
    delta=(half-c).abs();
    if(delta<=max&&nprogrammer!=0)
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="programmer";
        value="y";
      }
    }
    c=0;
      for(j=0;j<dataList.length;j++)
      {
        if(dataList[j].programmer=="n")
          c++;
      }
    delta=(half-c).abs();
    if(delta<=max&&nprogrammer!=0)
    {
      if(delta<max || randomFlag()){
        max=delta;
        row="programmer";
        value="n";
      }
    }
  }
  if(max+half==count())
    row="insufff";
  if(max==half)
    row="insufff";

  print("row:$row\nvalue:$value\ndelta:$delta\n");

}



String firstQuestion() {
  final _random = new Random();
  if (_random.nextInt(2) == 0) {
    firstQuestionCSA = true;
    return "Does $da study in CSA ?";
  } else {
    firstQuestionCSA = false;
    return "Does $da study in CSB ?";
  }
}

firstQuestionEvaluator(String answer) {
  int i;
  int flag=1;
  if (firstQuestionCSA == true) {
    if (answer == "y") {
      for (i = 0; i < dataList.length; i++) {
        if (dataList[i].clas == "CSB") {
          print("${flag++}");
          rmp(dataList[i--]);
        }
      }
    } else {
      for (i = 0; i < dataList.length; i++) {
        if (dataList[i].clas == "CSA") {
          print("${flag++}");
          rmp(dataList[i--]);
        }
      }
    }
  } else if (firstQuestionCSA == false) {
    if (answer == "y") {
      for (i = 0; i < dataList.length; i++) {
        if (dataList[i].clas == "CSA") {
          print("${flag++}");
          rmp(dataList[i--]);
        }
      }
    } else {
      for (i = 0; i < dataList.length; i++) {
        if (dataList[i].clas == "CSB") {
          print("${flag++}");
          rmp(dataList[i--]);
        }
      }
    }
  }
  for(i=0;i<dataList.length;i++){
    print("${dataList[i].name} - ${dataList[i].clas} \n" );
  }
}

String otherQuestion(){
  findrow();

  if (row == "insufff") {

    return "Insufficient Data";
  } 
  //question framing
  else if (row == "clas")
    return "Does $da study in $value ?";
  
  else if (row == "gen") {
    if (value == "M") {
      regg = "Male";
     // da = "he";
    } else {
      regg = "Female";
    //  da = "she";
    }
    return "Is $da a $regg ?";
  } 
  
  else if (row == "hostel") {
    if (value == "Some other PG") regg = "any PG other than RR";
    else regg=value;
    return "Does $da stay at $regg ?";
  } 
  
  else if (row == "rel")
    return "Is $da a $value ?";

  else if (row == "school")
    return "Did $da study 12th at $value ?";
  
  
  else if (row == "place")
    return "Is $da from $value ?";
  
  
  else if (row == "region") {
    if (value == "M")
      regg = "Middle";
    else if (value == "N")
      regg = "North";
    else
      regg = "South";
    return "Is $da from $regg Kerala?";
  } 
  
  else if (row == "house") {
    if (value == "T")
      regg = "Thandava";
    else if (value == "S")
      regg = "Samhara";
    else if (value == "R")
      regg = "Rakshasa";
    else if (value == "D")
      regg = "Dhruva";
    else
      regg = "Aryans";
    return "Is $da a member of $regg House ?";
  } 
  
  else if (row == "rep")
    return "Is $da a Repeater ?";
  
  else if (row == "ds") 
    return "Is $da a Day Scholar ?";

  else if (row == "specs") 
    return "Does $da often wear spectacles ?";

  else if (row == "singer") 
    return "Is $da a good singer ?";

  else if (row == "programmer") 
    return "Is $da a really good programmer ?";

  else if (row == "dancer") 
    return "Is $da a good dancer ?";
}

otherQuestionEvaluator(String answer){
  if (row == "clas") {
    if (answer == 'y') {
      nclas = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].clas != value) rmp(dataList[i--]);
      }
    } else if (answer == 'n') {
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].clas == value) rmp(dataList[i--]);
      }
    } else {
      nclas = 0;
    }
  } 
  
  else if (row == "gen") {
    
    if (answer == 'y') {
      ngen = 0;
      if(value=="M")
        da="he";
      else
        da="she";
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].gen != value) rmp(dataList[i--]);
      }
    } else if (answer == 'n') {
      ngen = 0;
      if(value=="M")
        da="she";
      else
        da="he";
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].gen == value) rmp(dataList[i--]);
      }
    } else {
      
      ngen = 0;
    }
  } 
  
  else if (row == "hostel") {
    if (answer == 'y') {
      nhostel = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].hostel != value) rmp(dataList[i--]);
      }
    } else if (answer == 'n') {
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].hostel == value) rmp(dataList[i--]);
      }
    } else {
      idk.add(value);
      nhostel = 0;
    }
  } 
  
  else if (row == "rel") {
    if (answer == 'y') {
      nrel = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].rel != value) rmp(dataList[i--]);
      }
    } else if (answer == 'n') {
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].rel == value) rmp(dataList[i--]);
      }
    } else {
      idk.add(value);
      nrel = 0;
    }
  } 
  
  else if (row == "place") {
    if (answer == 'y') {
      nplace = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].place != value) rmp(dataList[i--]);
      }
    } else if (answer == 'n') {
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].place == value) rmp(dataList[i--]);
      }
    } else {
      idk.add(value);
      nplace = 0;
    }
  } 
  
  else if (row == "school") {
    if (answer == 'y') {
      nschool = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].school != value) rmp(dataList[i--]);
      }
    } else if (answer == 'n') {
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].school == value) rmp(dataList[i--]);
      }
    } else {
      idk.add(value);
      nschool = 0;
    }
  } 

  else if (row == "region") {
    if (answer == 'y') {
      nregion = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].region != value) rmp(dataList[i--]);
      }
    } else if (answer == 'n') {
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].region == value) rmp(dataList[i--]);
      }
    } else {
      nregion = 0;
    }
  } 
  
  else if (row == "house") {
    if (answer == 'y') {
      nhouse = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].house != value) rmp(dataList[i--]);
      }
    } else if (answer == 'n') {
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].house == value) rmp(dataList[i--]);
      }
    } else {
      idk.add(value);
      nhouse = 0;
    }
  } 
  
  else if (row == "rep") {
    if (answer == 'y') {
      nrep = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].rep != 'y') rmp(dataList[i--]);
      }
    } else if (answer == 'n') {
      nrep = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].rep == 'y') rmp(dataList[i--]);
      }
    } else {
      nrep = 0;
    }
  } 

  else if (row == "specs") {
    if (answer == 'y') {
      nspecs = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].specs != 'y') rmp(dataList[i--]);
      }
    } else if (answer == 'n') {
      nrep = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].specs == 'y') rmp(dataList[i--]);
      }
    } else {
      nspecs = 0;
    }
  } 

  else if (row == "singer") {
    if (answer == 'y') {
      nsinger = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].singer != 'y') rmp(dataList[i--]);
      }
    }   else if (answer == 'n') {
      nrep = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].singer == 'y') rmp(dataList[i--]);
      }
    } else {
      nsinger = 0;
    }
  } 

  else if (row == "dancer") {
    if (answer == 'y') {
      ndancer = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].dancer != 'y') rmp(dataList[i--]);
      }
    } else if (answer == 'n') {
      nrep = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].dancer == 'y') rmp(dataList[i--]);
      }
    } else {
      ndancer = 0;
    }
  } 

  else if (row == "programmer") {
    if (answer == 'y') {
      nprogrammer = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].programmer != 'y') rmp(dataList[i--]);
      }
    } else if (answer == 'n') {
      nrep = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].programmer == 'y') rmp(dataList[i--]);
      }
    } else {
      nprogrammer = 0;
    }
  } 
  
  else if (row == "ds") {
    if (answer == 'y') {
      nds = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].ds != 'y') rmp(dataList[i--]);
      }
    } else if (answer == 'n') {
      nds = 0;
      for (int i = 0; i < dataList.length; i++) {
        if (dataList[i].ds == 'y') rmp(dataList[i--]);
      }
    } else {
      nds = 0;
    }
  }
  for(int i=0;i<dataList.length;i++){
    print("${dataList[i].name} - ${dataList[i].clas} \n" );
  }
}
