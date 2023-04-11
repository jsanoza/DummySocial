import 'package:flutter_test/flutter_test.dart';
import 'package:trial/app/data/models/pagination.dart';
import 'package:trial/app/data/models/post.dart';
import 'package:trial/app/data/models/user.dart';

void main() {
  test('Test Post.fromJson()', () {
    final json = {
      'id': '1',
      'text': 'Hello world!',
      'image': 'https://example.com/image.jpg',
      'likes': 10,
      'tags': ['flutter', 'dart'],
      'publishDate': '2023-04-11T10:30:00.000Z',
      'owner': {
        'id': '1',
        'firstName': 'John',
        'lastName': 'Doe',
        'title': 'title',
        'picture': 'picture',
      },
    };

    final post = Post.fromJson(json);

    expect(post.id, '1');
    expect(post.text, 'Hello world!');
    expect(post.image, 'https://example.com/image.jpg');
    expect(post.likes, 10);
    expect(post.tags, ['flutter', 'dart']);
    expect(post.publishDate, '2023-04-11T10:30:00.000Z');
    expect(post.owner!.firstName, equals('John'));
    expect(post.owner!.lastName, equals('Doe'));
    expect(post.owner!.title, equals('title'));
    expect(post.owner!.picture, equals('picture'));
  });

  test('Test Post.toJson()', () {
    final user = User(
      id: '1',
      firstName: 'John',
      lastName: 'Doe',
    );
    final post = Post(
      id: '1',
      text: 'Hello world!',
      image: 'https://example.com/image.jpg',
      likes: 10,
      tags: ['flutter', 'dart'],
      publishDate: '2023-04-11T10:30:00.000Z',
      owner: user,
    );

    final json = post.toJson();

    expect(json['id'], '1');
    expect(json['text'], 'Hello world!');
    expect(json['image'], 'https://example.com/image.jpg');
    expect(json['likes'], 10);
    expect(json['tags'], ['flutter', 'dart']);
    expect(json['publishDate'], '2023-04-11T10:30:00.000Z');
    expect(json['owner'], user.toJson());
  });
}
