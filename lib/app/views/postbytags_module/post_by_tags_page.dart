import 'dart:developer';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trial/app/utils/loading.dart';
import 'package:trial/app/views/postbytags_module/post_by_tags_controller.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_text_theme.dart';
import '../../utils/widgets/app_bar/custom_app_bar.dart';
import '../../utils/widgets/app_divider/app_divider.dart';
import '../../utils/widgets/bottom_sheet_provider/bottom_sheet_provider.dart';

class PostByTagsPage extends GetWidget<PostByTagsController> {
  const PostByTagsPage({Key? key}) : super(key: key);
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
                Obx(
                  () => DelayedDisplay(
                    delay: Duration(milliseconds: 400),
                    child: Text(
                      "${controller.tagName.value.toUpperCase()}",
                      style: AppTextStyles.base.w500.s20.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => controller.postList.isNotEmpty
            ? PageView.builder(
                onPageChanged: (index) {
                  controller.pageViewOnPageChanged(index);
                },
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
                              height: 250,
                              width: Get.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller.goToProfilePage(controller.postList[index].owner!.id.toString());
                                            },
                                            child: Container(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 30,
                                                      backgroundImage: NetworkImage(
                                                        controller.postList[index].owner!.picture.toString(),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      controller.postList[index].owner!.firstName.toString() + " " + controller.postList[index].owner!.lastName.toString(),
                                                      style: AppTextStyles.base.w500.s20.whiteColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
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
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
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
                                              onPressed: () {
                                                BottomSheetProvider.showBottomSheetWithHeader(
                                                  callback: () {},
                                                  title: "${controller.comments.length} comments",
                                                  content: Container(
                                                    child: Obx(
                                                      () => ListView.separated(
                                                        separatorBuilder: (context, index) => AppDivider(
                                                          color: AppColors.colorDivider,
                                                        ),
                                                        itemCount: controller.comments.length,
                                                        itemBuilder: ((context, index) {
                                                          return ListTile(
                                                            onTap: () {
                                                              controller.goToProfilePage(controller.comments[index].owner.id.toString());
                                                            },
                                                            dense: true,
                                                            isThreeLine: true,
                                                            contentPadding: EdgeInsets.all(8),
                                                            leading: CircleAvatar(
                                                              radius: 30,
                                                              backgroundImage: NetworkImage(
                                                                controller.comments[index].owner.picture.toString(),
                                                              ),
                                                            ),
                                                            title: Text(
                                                              "${controller.comments[index].owner.firstName.toString()}" + " " + "${controller.comments[index].owner.lastName.toString()}",
                                                              style: AppTextStyles.base.blackColor.w900.s14,
                                                            ),
                                                            subtitle: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      controller.comments[index].message.toString(),
                                                                      style: AppTextStyles.base.blackColor,
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 8,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      controller.comments[index].publishDate.toString(),
                                                                      style: AppTextStyles.base.blackColor.s10,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    ),
                                                  ),
                                                  maxHeight: Get.height / 1.5,
                                                  padding: EdgeInsets.zero,
                                                );
                                                print("Pressed");
                                              },
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
              )
            : Container(
                child: Center(child: Text("Uh oh! looks like its empty here")),
              ),
      ),
    );
  }
}
