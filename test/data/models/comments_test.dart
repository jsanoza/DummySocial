import 'package:flutter_test/flutter_test.dart';
import 'package:trial/app/data/models/comments.dart';
import 'package:trial/app/data/models/user.dart';

void main() {
  group('Comments', () {
    test('fromJson creates a valid Comments instance', () {
      final json = {
        'id': '1',
        'message': 'Test message',
        'owner': {
          'id': '1',
          'firstName': 'John',
          'lastName': 'Doe',
          'title': 'title',
          'picture': 'url',
        },
        'post': '1',
        'publishDate': '2022-01-01',
      };

      final comment = Comments.fromJson(json);

      expect(comment.id, equals('1'));
      expect(comment.message, equals('Test message'));
      expect(comment.owner.id, equals('1'));
      expect(comment.owner.firstName, equals('John'));
      expect(comment.owner.lastName, equals('Doe'));
      expect(comment.owner.title, equals('title'));
      expect(comment.owner.picture, equals('url'));
      expect(comment.post, equals('1'));
      expect(comment.publishDate, equals("2022-01-01"));
    });

    test('toJson returns a valid JSON map', () {
      final comments = Comments(
        id: '1',
        message: 'Test message',
        owner: User(
          id: '1',
          firstName: 'John',
          lastName: 'Doe',
          title: "title",
          picture: "url",
        ),
        post: '1',
        publishDate: '2022-01-01',
      );

      final json = comments.toJson();

      expect(json['id'], '1');
      expect(json['message'], 'Test message');
      expect(json['owner'], {
        'id': '1',
        'firstName': 'John',
        'lastName': 'Doe',
        'title': 'title',
        'picture': 'url',
      });
      expect(json['post'], '1');
      expect(json['publishDate'], '2022-01-01');
    });

    test('fromJson throws an exception if id is null', () {
      final json = {
        'message': 'Test message',
        'owner': {
          'id': '1',
          'firstName': 'John ',
          'lastName': 'Doe',
        },
        'post': '1',
        'publishDate': '2022-01-01',
      };

      expect(() => Comments.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('fromJson throws an exception if message is null', () {
      final json = {
        'id': '1',
        'owner': {
          'id': '1',
          'name': 'John Doe',
          'email': 'johndoe@example.com',
        },
        'post': '1',
        'publishDate': '2022-01-01',
      };

      expect(() => Comments.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('fromJson throws an exception if owner is null', () {
      final json = {
        'id': '1',
        'message': 'Test message',
        'post': '1',
        'publishDate': '2022-01-01',
      };

      expect(() => Comments.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('fromJson throws an exception if post is null', () {
      final json = {
        'id': '1',
        'message': 'Test message',
        'owner': {
          'id': '1',
          'name': 'John Doe',
          'email': 'johndoe@example.com',
        },
        'publishDate': '2022-01-01',
      };

      expect(() => Comments.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('fromJson throws an exception if publishDate is null', () {
      final json = {
        'id': '1',
        'message': 'Test message',
        'owner': {
          'id': '1',
          'name': 'John Doe',
          'email': 'johndoe@example.com',
        },
        'post': '1',
      };

      expect(() => Comments.fromJson(json), throwsA(isA<TypeError>()));
    });
  });
}
