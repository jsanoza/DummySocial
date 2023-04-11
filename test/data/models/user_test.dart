import 'package:flutter_test/flutter_test.dart';
import 'package:trial/app/data/models/user.dart';

void main() {
  group('User model', () {
    const String id = '1';
    const String title = 'Mr.';
    const String firstName = 'John';
    const String lastName = 'Doe';
    const String picture = 'https://example.com/picture.jpg';

    test('fromJson() creates a User object from json', () {
      final Map<String, dynamic> json = {
        'id': id,
        'title': title,
        'firstName': firstName,
        'lastName': lastName,
        'picture': picture,
      };
      final user = User.fromJson(json);

      expect(user.id, id);
      expect(user.title, title);
      expect(user.firstName, firstName);
      expect(user.lastName, lastName);
      expect(user.picture, picture);
    });

    test('toJson() converts a User object to json', () {
      final user = User(
        id: id,
        title: title,
        firstName: firstName,
        lastName: lastName,
        picture: picture,
      );
      final Map<String, dynamic> json = user.toJson();

      expect(json['id'], id);
      expect(json['title'], title);
      expect(json['firstName'], firstName);
      expect(json['lastName'], lastName);
      expect(json['picture'], picture);
    });
  });
}
