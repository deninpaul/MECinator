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

  Person({this.name, this.hostel, this.gen, this.clas, this.place, this.rep, this.house, this.ds, this.rel});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "hostel": hostel,
      "gen": gen,
      "clas": clas,      
      "place": place,
      "rep": rep,
      "house": house,
      "ds": ds,
      "rel": rel
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
  }
}
