import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/data/provider/user_posts_provider.dart';
import '../../data/models/post.dart';
import '../../data/models/user_full.dart';

class UserPostsController extends GetxController {
  final UserPostsProvider? provider;
  UserPostsController({this.provider});
  List<Post> postList = <Post>[].obs;
  UserFull fullUserDetails = UserFull();
  late PageController? pageViewController;

  setPostList(List<Post> posts, index, UserFull userDetails) async {
    pageViewController = PageController(initialPage: index);
    postList.addAll(posts);
    fullUserDetails = userDetails;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
