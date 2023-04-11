import 'package:flutter_test/flutter_test.dart';
import 'package:trial/app/data/models/location.dart';
import 'package:trial/app/data/models/user_full.dart';

void main() {
  group('UserFull model test', () {
    test('fromJson creates a valid UserFull object', () {
      final Map<String, dynamic> json = {
        'id': '1',
        'title': 'Mr.',
        'firstName': 'John',
        'lastName': 'Doe',
        'gender': 'male',
        'email': 'johndoe@example.com',
        'dateOfBirth': '1990-01-01',
        'registerDate': '2021-01-01',
        'phone': '1234567890',
        'picture': 'https://example.com/johndoe.jpg',
        'location': {
          'street': '123 Main St',
          'city': 'New York',
          'state': 'NY',
          'country': 'USA',
        },
      };

      final UserFull userFull = UserFull.fromJson(json);

      expect(userFull.id, '1');
      expect(userFull.title, 'Mr.');
      expect(userFull.firstName, 'John');
      expect(userFull.lastName, 'Doe');
      expect(userFull.gender, 'male');
      expect(userFull.email, 'johndoe@example.com');
      expect(userFull.dateOfBirth, '1990-01-01');
      expect(userFull.registerDate, '2021-01-01');
      expect(userFull.phone, '1234567890');
      expect(userFull.picture, 'https://example.com/johndoe.jpg');
      expect(userFull.location, isNotNull);
      expect(userFull.location!.street, '123 Main St');
      expect(userFull.location!.city, 'New York');
      expect(userFull.location!.state, 'NY');
      expect(userFull.location!.country, 'USA');
    });

    test('toJson creates a valid JSON object', () {
      final UserFull userFull = UserFull(
        id: '1',
        title: 'Mr.',
        firstName: 'John',
        lastName: 'Doe',
        gender: 'male',
        email: 'johndoe@example.com',
        dateOfBirth: '1990-01-01',
        registerDate: '2021-01-01',
        phone: '1234567890',
        picture: 'https://example.com/johndoe.jpg',
        location: Location(
          street: '123 Main St',
          city: 'New York',
          state: 'NY',
          country: 'USA',
        ),
      );

      final Map<String, dynamic> json = userFull.toJson();

      expect(json['id'], '1');
      expect(json['title'], 'Mr.');
      expect(json['firstName'], 'John');
      expect(json['lastName'], 'Doe');
      expect(json['gender'], 'male');
      expect(json['email'], 'johndoe@example.com');
      expect(json['dateOfBirth'], '1990-01-01');
      expect(json['registerDate'], '2021-01-01');
      expect(json['phone'], '1234567890');
      expect(json['picture'], 'https://example.com/johndoe.jpg');
      expect(json['location'], isNotNull);
      expect(json['location']['street'], '123 Main St');
      expect(json['location']['city'], 'New York');
      expect(json['location']['state'], 'NY');
      expect(json['location']['country'], 'USA');
    });
  });
}
