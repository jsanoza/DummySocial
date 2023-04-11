import 'package:trial/app/data/models/location.dart';
import 'package:trial/app/data/models/pagination.dart';

class UserFull implements HasToJson {
  final String? id;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? email;
  final String? dateOfBirth;
  final String? registerDate;
  final String? phone;
  final String? picture;
  final Location? location;

  UserFull({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.dateOfBirth,
    this.registerDate,
    this.phone,
    this.picture,
    this.location,
  });

  factory UserFull.fromJson(Map<String, dynamic> json) {
    return UserFull(
      id: json['id'],
      title: json['title'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      email: json['email'],
      dateOfBirth: json['dateOfBirth'],
      registerDate: json['registerDate'],
      phone: json['phone'],
      picture: json['picture'],
      location: Location.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'email': email,
      'dateOfBirth': dateOfBirth,
      'registerDate': registerDate,
      'phone': phone,
      'picture': picture,
      'location': location!.toJson(),
    };
  }
}
