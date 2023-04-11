import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trial/app/themes/app_colors.dart';
import 'package:trial/app/themes/app_text_theme.dart';
import 'package:trial/app/views/userpost_module/user_posts_controller.dart';

import '../../utils/widgets/app_bar/custom_app_bar.dart';

class UserPostsPage extends GetWidget<UserPostsController> {
  const UserPostsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: false,
        backgroundColor: AppColors.kPrimaryColor.shade200,
        title: Container(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    controller.fullUserDetails.picture.toString(),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  controller.fullUserDetails.firstName.toString() + " " + controller.fullUserDetails.lastName.toString(),
                  style: AppTextStyles.base.w500.s20.whiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => PageView.builder(
          onPageChanged: (index) {},
          controller: controller.pageViewController,
          itemCount: controller.postList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  height: Get.height,
                  width: Get.width,
                  child: Image.network(
                    controller.postList[index].image.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: DelayedDisplay(
                      delay: Duration(milliseconds: 200),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        height: 210,
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.postList[index].text.toString(),
                                          style: AppTextStyles.base.s16.whiteColor,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            FittedBox(
                              child: Container(
                                height: 50,
                                width: Get.width,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: controller.postList[index].tags!.length,
                                  itemBuilder: (context, tagsIndex) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Chip(
                                        label: Text(
                                          controller.postList[index].tags![tagsIndex].toString(),
                                          style: AppTextStyles.base.s12.blackColor,
                                        ),
                                        backgroundColor: AppColors.kPrimaryColor.shade200,
                                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        IconButton(
                                          icon: FaIcon(
                                            FontAwesomeIcons.heart,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: FaIcon(
                                          FontAwesomeIcons.commentDots,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: FaIcon(
                                          FontAwesomeIcons.link,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          print("Pressed");
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
