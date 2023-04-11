import 'dart:developer';

import 'package:get/get.dart';
import 'package:trial/app/routes/app_pages.dart';
import 'package:trial/app/views/userpost_module/user_posts_controller.dart';
import '../../../app/data/provider/profile_provider.dart';
import '../../data/models/post.dart';
import '../../data/models/user_full.dart';

class ProfileController extends GetxController {
  final ProfileProvider? provider;
  ProfileController({this.provider});

  Rx<UserFull> fullUserDetails = UserFull().obs;
  List<Post> postList = <Post>[].obs;

  setUser(userId) async {
    postList.clear();
    final userDetails = await provider!.getUser(userId);
    fullUserDetails.value = userDetails;

    await getUserPosts(fullUserDetails.value.id);
  }

  getUserPosts(userId) async {
    final userPosts = await provider!.getUserPosts(1, 10, userId);
    postList.addAll(userPosts.data);
  }

  goToIndividualPost(index) async {
    await Get.find<UserPostsController>().setPostList(postList, index, fullUserDetails.value);
    Get.toNamed(AppRoutes.userPosts);
  }
}
