import 'package:get/get.dart';
import 'package:trial/app/data/provider/home_provider.dart';
import 'package:trial/app/data/provider/post_by_tags_provider.dart';
import 'package:trial/app/data/provider/profile_provider.dart';
import 'package:trial/app/views/home_module/home_controller.dart';
import 'package:trial/app/views/postbytags_module/post_by_tags_controller.dart';
import 'package:trial/app/views/profile_module/profile_controller.dart';

import '../../data/api/api_connect.dart';

class HomeBinding implements Bindings {
  ApiConnect api = ApiConnect.instance;

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        provider: HomeProvider(api: api),
      ),
    );

    Get.lazyPut<ProfileController>(
      () => ProfileController(
        provider: ProfileProvider(),
      ),
    );

    Get.lazyPut<PostByTagsController>(
      () => PostByTagsController(
        provider: PostByTagsProvider(),
      ),
    );
  }
}
