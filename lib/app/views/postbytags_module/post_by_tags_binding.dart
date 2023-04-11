import 'package:get/get.dart';
import 'package:trial/app/data/provider/profile_provider.dart';
import 'package:trial/app/views/postbytags_module/post_by_tags_controller.dart';

import '../../../app/data/provider/post_by_tags_provider.dart';
import '../profile_module/profile_controller.dart';

class PostByTagsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostByTagsController>(
      () => PostByTagsController(
        provider: PostByTagsProvider(),
      ),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(
        provider: ProfileProvider(),
      ),
    );
  }
}
