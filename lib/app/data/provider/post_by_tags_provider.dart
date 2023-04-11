import 'package:trial/app/data/api/api_connect.dart';
import 'package:trial/app/data/models/user.dart';
import 'package:trial/app/utils/constants.dart';

import '../models/comments.dart';
import '../models/pagination.dart';
import '../models/post.dart';

class PostByTagsProvider {
  PostByTagsProvider();
  ApiConnect api = ApiConnect.instance;

  Future<Pagination<Post>> getUserPostsByTags(int page, int limit, String tag) async {
    final response = await api.get("${EndPoints.tag}/${tag}/post", headers: EndPoints.headers);
    final responseJson = response.body;
    final itemsJson = responseJson['data'] as List<dynamic>;

    final items = itemsJson.map((json) => Post.fromJson(json)).toList();
    final databaseResponse = Pagination<Post>(
      data: items,
      total: responseJson['total'] as int,
      page: responseJson['page'] as int,
      limit: responseJson['limit'] as int,
    );
    return databaseResponse;
  }

  Future<List<Comments>> getComments(String id, int page, int limit) async {
    final response = await api.get("${EndPoints.post}/${id}/comment", headers: EndPoints.headers);
    final responseJson = response.body;

    final itemsJson = responseJson['data'] as List<dynamic>;

    final items = itemsJson.map((json) => Comments.fromJson(json)).toList();
    return items;
  }
}
