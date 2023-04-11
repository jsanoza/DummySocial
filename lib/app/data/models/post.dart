import 'package:trial/app/data/models/pagination.dart';
import 'package:trial/app/data/models/user.dart';

class Post implements HasToJson {
  final String? id;
  final String? text;
  final String? image;
  final int? likes;
  final List<String>? tags;
  final String? publishDate;
  final User? owner;
  Post({
    this.id,
    this.text,
    this.image,
    this.likes,
    this.tags,
    this.publishDate,
    this.owner,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'image': image,
      'likes': likes,
      'tags': tags,
      'publishDate': publishDate,
      'owner': owner!.toJson(),
    };
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      text: json['text'],
      image: json['image'],
      likes: json['likes'],
      tags: List<String>.from(json['tags']),
      publishDate: json['publishDate'],
      owner: User.fromJson(json['owner']),
    );
  }
}
