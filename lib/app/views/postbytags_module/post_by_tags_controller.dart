import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../app/data/provider/post_by_tags_provider.dart';
import '../../data/models/comments.dart';
import '../../data/models/post.dart';
import '../../routes/app_pages.dart';
import '../../utils/loading.dart';
import '../profile_module/profile_controller.dart';

class PostByTagsController extends GetxController {
  final PostByTagsProvider? provider;
  PostByTagsController({this.provider});

  List<Post> postList = <Post>[].obs;
  List<Comments> comments = <Comments>[].obs;
  var currentPage = 0.obs;
  var index = 0.obs;
  var postId = "".obs;
  var tagName = "".obs;

  setTag(String tag) async {
    postList.clear();

    await provider!.getUserPostsByTags(1, 10, tag).then((value) {
      postList.addAll(value.data);
      tagName.value = tag;
      loadComments(postList.first.id.toString());
    }).onError((error, stackTrace) {
      Get.back();
    }).whenComplete(() {});
  }

  goToProfilePage(userId) async {
    Get.put(ProfileController());

    await Get.find<ProfileController>().setUser(userId).then((value) {
      Get.back();
      Get.toNamed(AppRoutes.profile);
    });
  }

  loadComments(String id) async {
    comments.clear();
    final pagination = await provider!.getComments(id, 1, 10);
    comments.addAll(pagination);
  }

  pageViewOnPageChanged(index) {
    index.value = index;
    postId.value = postList[index].id.toString();
    loadComments(postId.value.toString());
  }

  @override
  void onInit() {
    super.onInit();
  }
}
