import 'package:test/test.dart';
import 'package:trial/app/data/models/location.dart';

void main() {
  group('Location', () {
    test('fromJson() should return a Location object', () {
      final json = {
        'street': '123 Main St',
        'city': 'Anytown',
        'state': 'CA',
        'country': 'USA',
      };
      final location = Location.fromJson(json);
      expect(location, isA<Location>());
    });

    test('toJson() should return a Map<String, dynamic>', () {
      final location = Location(
        street: '123 Main St',
        city: 'Anytown',
        state: 'CA',
        country: 'USA',
      );
      final json = location.toJson();
      expect(json, isA<Map<String, dynamic>>());
    });

    test('toJson() should contain all required fields', () {
      final location = Location(
        street: '123 Main St',
        city: 'Anytown',
        state: 'CA',
        country: 'USA',
      );
      final json = location.toJson();
      expect(json.containsKey('street'), isTrue);
      expect(json.containsKey('city'), isTrue);
      expect(json.containsKey('state'), isTrue);
      expect(json.containsKey('country'), isTrue);
    });
  });
}
