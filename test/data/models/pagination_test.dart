import 'package:flutter_test/flutter_test.dart';
import 'package:trial/app/data/models/pagination.dart';

void main() {
  group('Pagination tests', () {
    test('Serialization and deserialization', () {
      final pagination = Pagination(
        data: [
          MockData(id: 1, name: 'John'),
          MockData(id: 2, name: 'Jane'),
        ],
        total: 2,
        page: 1,
        limit: 10,
      );

      final json = pagination.toJson();
      final result = Pagination.fromJson(json, (json) => MockData.fromJson(json));

      expect(result.data.length, 2);
      expect(result.total, 2);
      expect(result.page, 1);
      expect(result.limit, 10);
      expect(result.data[0].id, 1);
      expect(result.data[0].name, 'John');
      expect(result.data[1].id, 2);
      expect(result.data[1].name, 'Jane');
    });
  });
}

class MockData implements HasToJson {
  final int id;
  final String name;

  MockData({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  factory MockData.fromJson(Map<String, dynamic> json) => MockData(
        id: json['id'] as int,
        name: json['name'] as String,
      );
}
