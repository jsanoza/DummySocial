import 'package:get/get.dart';
import 'package:trial/app/data/provider/user_posts_provider.dart';
import 'package:trial/app/views/profile_module/profile_controller.dart';
import 'package:trial/app/views/userpost_module/user_posts_controller.dart';

import '../../../app/data/provider/profile_provider.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(
        provider: ProfileProvider(),
      ),
    );
    Get.lazyPut<UserPostsController>(
      () => UserPostsController(
        provider: UserPostsProvider(),
      ),
    );
  }
}
