import 'dart:developer';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trial/app/views/home_module/home_controller.dart';
import 'package:trial/app/themes/app_colors.dart';
import 'package:trial/app/utils/widgets/app_divider/app_divider.dart';
import 'package:trial/app/views/postbytags_module/post_by_tags_controller.dart';

import '../../routes/app_pages.dart';
import '../../themes/app_text_theme.dart';
import '../../utils/loading.dart';
import '../../utils/widgets/bottom_sheet_provider/bottom_sheet_provider.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onDoubleTap: () {
        controller.onDoubleTapScreen();
      },
      child: Obx(
        () => CustomRefreshIndicator(
          triggerMode: IndicatorTriggerMode.anywhere,
          trigger: IndicatorTrigger.trailingEdge,
          trailingScrollIndicatorVisible: true,
          leadingScrollIndicatorVisible: true,
          builder: (context, child, controller) {
            return AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return Stack(
                  children: [
                    child,
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: controller.isLoading
                            ? Container(
                                margin: const EdgeInsets.only(bottom: 0.0),
                                width: 40,
                                height: 40,
                                child: Loading(
                                  loadingType: LoadingType.fadingFour,
                                ),
                              )
                            : SizedBox.shrink(),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          onRefresh: controller.load,
          child: PageView.builder(
            onPageChanged: (index) {
              controller.pageViewOnPageChanged(index);
            },
            itemCount: controller.postList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              if (index == 0) controller.loadComments(controller.postList[index].id.toString());
              return Stack(
                children: [
                  FittedBox(
                    child: Container(
                      child: Image.network(
                        controller.postList[index].image.toString(),
                        height: Get.height,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SafeArea(
                    child: DelayedDisplay(
                      delay: Duration(milliseconds: 200),
                      child: Container(
                        height: 100,
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0.0, right: 10, left: 10),
                          child: AnimSearchBar(
                            color: AppColors.white.withOpacity(0.4),
                            width: 400,
                            textController: controller.textController,
                            onSuffixTap: () {},
                            rtl: true,
                            onSubmitted: (String value) {
                              controller.onSearchSubmitted();
                            },
                          ),
                        ),
                      ),
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
                              )),
                          height: 260,
                          width: Get.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
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
                                      return GestureDetector(
                                        onTap: () {
                                          controller.onTagClicked(index, tagsIndex);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Chip(
                                            label: Text(
                                              controller.postList[index].tags![tagsIndex].toString(),
                                              style: AppTextStyles.base.s12.blackColor,
                                            ),
                                            backgroundColor: AppColors.kPrimaryColor.shade200,
                                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                          ),
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
                                          Obx(
                                            () => controller.likedPhotos.contains(index.toString())
                                                ? IconButton(
                                                    icon: FaIcon(
                                                      FontAwesomeIcons.solidHeart,
                                                      color: AppColors.kPrimaryColor.shade200,
                                                    ),
                                                    onPressed: () {
                                                      controller.removeLike(index);
                                                    },
                                                  )
                                                : IconButton(
                                                    icon: FaIcon(
                                                      FontAwesomeIcons.heart,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {
                                                      controller.addLike(index);
                                                    },
                                                  ),
                                          ),
                                          Obx(() => controller.likedPhotos.contains(index.toString())
                                              ? Text(
                                                  (controller.postList[index].likes! + 1).toString(),
                                                  style: AppTextStyles.base.whiteColor,
                                                )
                                              : Text(
                                                  controller.postList[index].likes.toString(),
                                                  style: AppTextStyles.base.whiteColor,
                                                ))
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
          ),
        ),
      ),
    ));
  }
}
