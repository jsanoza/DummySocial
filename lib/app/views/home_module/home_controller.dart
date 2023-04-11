import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trial/app/data/provider/home_provider.dart';
import 'package:trial/app/routes/app_pages.dart';
import 'package:trial/app/views/profile_module/profile_controller.dart';
import '../../data/models/comments.dart';
import '../../data/models/post.dart';
import '../../utils/loading.dart';
import '../postbytags_module/post_by_tags_controller.dart';

class HomeController extends GetxController {
  HomeController({this.provider});
  final HomeProvider? provider;
  TextEditingController textController = TextEditingController();
  List<Comments> comments = <Comments>[].obs;
  List<String> likedPhotos = <String>[].obs;
  List<Post> postList = <Post>[].obs;

  var currentPage = 0.obs;
  var index = 0.obs;
  var postId = "".obs;
  var searchValue = "".obs;

  initializeCurrentPage() async {
    var rng = Random();
    for (var i = 0; i < 10; i++) {
      currentPage.value = rng.nextInt(100);
    }
    getPosts();
  }

  getPosts() async {
    currentPage.value++;
    final pagination = await provider!.getPosts(currentPage.value, 5);
    postList.addAll(pagination.data);
  }

  loadComments(String id) async {
    comments.clear();
    final pagination = await provider!.getComments(id, 1, 10);
    comments.addAll(pagination);
  }

  Future<void> load() async {
    currentPage.value++;
    final pagination = await provider!.getPosts(currentPage.value, 2);
    postList.addAll(pagination.data);
    update();
  }

  goToProfilePage(userId) async {
    Get.put(ProfileController());
    Get.dialog(
      Container(
        height: 20,
        width: 20,
        child: Loading(loadingType: LoadingType.fadingFour),
      ),
    );
    await Get.find<ProfileController>().setUser(userId).then((value) {
      Get.back();
      Get.toNamed(AppRoutes.profile);
    });
  }

  onDoubleTapScreen() async {
    if (likedPhotos.contains(index.toString())) {
      likedPhotos.remove(index.toString());
    } else {
      likedPhotos.add(index.toString());
    }
  }

  pageViewOnPageChanged(index) async {
    index.value = index;
    postId.value = postList[index].id.toString();
    loadComments(postId.value.toString());
  }

  onSearchSubmitted() async {
    Get.find<PostByTagsController>().setTag(textController.text).then((value) {
      Get.toNamed(AppRoutes.postByTags);
    });
  }

  onTagClicked(index, tagsIndex) async {
    Get.find<PostByTagsController>().setTag(postList[index].tags![tagsIndex].toString());
    Get.toNamed(AppRoutes.postByTags);
  }

  removeLike(index) async {
    likedPhotos.remove(index.toString());
  }

  addLike(index) async {
    likedPhotos.add(index.toString());
  }

  @override
  void onInit() {
    initializeCurrentPage();

    super.onInit();
  }
}
