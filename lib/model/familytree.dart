class Marry {
  String id;
  String child;

  Marry(this.id, this.child);
}

class Child {
  String id;
  int totalChild;
  List<String> idPerson;

  Child(this.id, this.totalChild, this.idPerson);
}

class Person {
  String personID;
  String name;
  String gender;
  String marry;
  String parent;

  Person({this.personID, this.name, this.marry, this.parent, this.gender});
}
