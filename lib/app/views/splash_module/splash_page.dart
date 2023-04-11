import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trial/app/routes/app_pages.dart';
import 'package:trial/app/utils/widgets/app_bar/custom_app_bar.dart';

import '../../utils/loading.dart';

class SplashPage extends GetWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.home);
    });

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                bottom: Get.context!.mediaQueryPadding.bottom + 10,
              ),
              child: Loading(loadingType: LoadingType.chasingDots),
            ),
          )
        ],
      ),
    );
  }
}
