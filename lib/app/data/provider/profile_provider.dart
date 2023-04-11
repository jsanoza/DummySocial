import 'dart:developer';

import 'package:trial/app/data/api/api_connect.dart';
import 'package:trial/app/utils/constants.dart';

import '../models/pagination.dart';
import '../models/post.dart';
import '../models/user_full.dart';

class ProfileProvider {
  ProfileProvider();
  ApiConnect api = ApiConnect.instance;

  Future<UserFull> getUser(String id) async {
    final response = await api.get("${EndPoints.user}/${id}", headers: EndPoints.headers);
    final responseJson = response.body;
    final items = UserFull.fromJson(responseJson);
    return items;
  }

  Future<Pagination<Post>> getUserPosts(int page, int limit, String id) async {
    final response = await api.get("${EndPoints.user}/${id}/post", headers: EndPoints.headers);
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
}
