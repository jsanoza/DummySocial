import 'package:get/get.dart';

import 'package:trial/app/views/home_module/home_binding.dart';
import 'package:trial/app/views/home_module/home_page.dart';
import 'package:trial/app/views/splash_module/splash_page.dart';

import '../views/postbytags_module/post_by_tags_binding.dart';
import '../views/postbytags_module/post_by_tags_page.dart';
import '../views/profile_module/profile_binding.dart';
import '../views/profile_module/profile_page.dart';
import '../views/userpost_module/user_posts_binding.dart';
import '../views/userpost_module/user_posts_page.dart';
part './app_routes.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.userPosts,
      page: () => const UserPostsPage(),
      binding: UserPostsBinding(),
    ),
    GetPage(
      name: AppRoutes.postByTags,
      page: () => const PostByTagsPage(),
      binding: PostByTagsBinding(),
    ),
  ];
}
