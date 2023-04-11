import 'package:trial/app/data/models/pagination.dart';

class User implements HasToJson {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;

  User({this.id, this.title, this.firstName, this.lastName, this.picture});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] ?? "";
    firstName = json['firstName'] ?? "";
    lastName = json['lastName'] ?? "";
    picture = json['picture'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['picture'] = picture;
    return data;
  }
}
