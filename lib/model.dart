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
  String sports;

  Person({this.name, this.hostel, this.gen, this.clas, this.place, this.rep, this.house, this.rel, this.school, this.ds, this.specs, this.singer, this.dancer, this.programmer, this.sports});

  Map<String, dynamic> toMap() {
    return {
      'name' : name,
      'hostel' : hostel,
      'clas' : clas,
      'gen' : gen,
      'place' : place,
      'rep' : rep,
      'house' : house,
      'rel' : rel,
      'school': school,
      'ds' : ds,
      'specs': specs,
      'singer': singer,
      'dancer': dancer,
      'programmer': programmer,
      'sports' : sports
    };
  }

  Person.fromMapObject(Map<String, dynamic> map) {
    this.name = map['name'];
    this.hostel = map['hostel'];
    this.gen = map['gen'];
    this.clas = map['clas'];    
    this.place = map['place'];
    this.rep = map['rep'];
    this.house = map['house'];
    this.ds = map['ds'];
    this.rel = map['rel'];
    this.school = map['school'];
    this.specs = map['specs'];
    this.singer = map['singer'];
    this.dancer= map['dancer'];
    this.programmer = map['programmer'];
    this.sports= map['sports'];
  }

  

}
