import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_7/common/constants/clipper.dart';
import 'package:flutter_application_7/dependency/dependency.dart';
import 'package:flutter_application_7/view/login/login.dart';
import 'package:flutter_application_7/view/time_out_screen/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/constants/common.dart';
import '../../common/constants/constants.dart';

class TimeOutScreen extends StatelessWidget {
  const TimeOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kBlack,
        title: const Text(
          "TIMER",
          style: kTextBoldBlack,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kBgHome,
        actions: [
          IconButton(
              onPressed: () async {
                Get.offAll(() => const LoginScreen(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 400));
              },
              icon: const Icon(
                Icons.logout,
                color: kBlack,
              ))
        ],
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 100.0.h,
              width: Get.width,
              color: kBgHome,
            ),
          ),
          Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                centerTile(homeController.inputNumber_1.value,
                    homeController.num1.value),
                centerTile(homeController.inputNumber_2.value,
                    homeController.num2.value),
                centerTile(homeController.inputNumber_3.value,
                    homeController.num3.value)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
