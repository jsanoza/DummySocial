import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trial/app/themes/app_colors.dart';
import 'package:trial/app/utils/widgets/app_bar/custom_app_bar.dart';
import 'package:trial/app/views/profile_module/profile_controller.dart';
import '../../themes/app_text_theme.dart';

class ProfilePage extends GetWidget<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColor.shade200,
        title: Text(
          "${controller.fullUserDetails.value.firstName.toString()} ${controller.fullUserDetails.value.lastName.toString()}",
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    controller.fullUserDetails.value.picture.toString(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.fullUserDetails.value.email.toString(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.fullUserDetails.value.location!.city.toString(),
                ),
                Text(
                  " - ",
                ),
                Text(
                  controller.fullUserDetails.value.location!.country.toString(),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                height: Get.height,
                width: Get.width,
                child: AlignedGridView.count(
                  cacheExtent: 9999,
                  itemCount: controller.postList.length,
                  crossAxisCount: 3,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.goToIndividualPost(index);
                      },
                      child: Stack(
                        children: [
                          Container(
                            child: Image.network(
                              controller.postList[index].image.toString(),
                              fit: BoxFit.cover,
                              height: 200,
                              width: 200,
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      icon: FaIcon(
                                        FontAwesomeIcons.heart,
                                        color: AppColors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      (controller.postList[index].likes!).toString(),
                                      style: AppTextStyles.base.whiteColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
