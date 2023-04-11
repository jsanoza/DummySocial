import 'package:trial/app/data/models/pagination.dart';
import 'package:trial/app/data/models/user.dart';

class Comments implements HasToJson {
  final String id;
  final String message;
  final User owner;
  final String post;
  final String publishDate;

  Comments({
    required this.id,
    required this.message,
    required this.owner,
    required this.post,
    required this.publishDate,
  });

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      id: json['id'] as String,
      message: json['message'] as String,
      owner: User.fromJson(json['owner']),
      post: json['post'] as String,
      publishDate: json['publishDate'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'owner': owner.toJson(),
      'post': post,
      'publishDate': publishDate,
    };
  }
}
