import 'dart:collection';

class ServicesModel{
  int? id;
  var name;
  String? icon;
  String? banner;
  String? bgcolor;

  ServicesModel(this.id, this.name, this.icon, this.banner, this.bgcolor);
  ServicesModel.fromJson(json)
  {
    // print('inside service model ${json['name']['EN']}');
    this.id=json['id'];
    this.name=json['name']['EN'];
    this.icon=json['icon'];
    this.banner=json['banner'];
    this.bgcolor=json['bgcolor'];
  }
}