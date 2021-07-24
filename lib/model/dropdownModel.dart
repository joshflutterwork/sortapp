class DropDownObj {
  String id;
  String descs;
  dynamic obj;
  bool value;

  DropDownObj({this.id: '', this.descs: '', this.obj, this.value: false});
  bool operator ==(o) => o is DropDownObj && o.id == id;
  int get hashCode => id.hashCode;
}
