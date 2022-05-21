import 'dart:collection';

class Services{
  int? id;
  var name;
  String? icon;
  String? banner;
  String? bgcolor;

  Services(this.id, this.name, this.icon, this.banner, this.bgcolor);
  Services.fromJson(json)
  {
    this.id=json['id'];
    this.name=json['name']['En'];
    this.icon=json['icon'];
    this.banner=json['banner'];
    this.bgcolor=json['bgcolor'];
  }
}