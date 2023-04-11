import 'package:get/get.dart';
import 'package:trial/app/views/userpost_module/user_posts_controller.dart';

import '../../../app/data/provider/user_posts_provider.dart';

class UserPostsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserPostsController>(
      () => UserPostsController(
        provider: UserPostsProvider(),
      ),
    );
  }
}
