import 'package:flutter/material.dart';
import 'package:flutter_application_7/common/constants/clipper.dart';
import 'package:flutter_application_7/common/constants/common.dart';
import 'package:flutter_application_7/common/constants/constants.dart';
import 'package:flutter_application_7/dependency/dependency.dart';
import 'package:flutter_application_7/view/homepage/widgets/text_input_widget.dart';
import 'package:flutter_application_7/view/login/login.dart';
import 'package:flutter_application_7/view/login/widgets/scroll_behaviour.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kBlack,
        title: const Text(
          "SPOT HOME",
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
              height: 100.0.h,
              width: Get.width,
              color: kBgHome,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputNumber(Icons.dialpad_outlined, "Enter a number..",
                  homeController.num1Text),
              kHeight15,
              inputNumber(Icons.dialpad_outlined, "Enter a number..",
                  homeController.num2Text),
              kHeight15,
              inputNumber(Icons.dialpad_outlined, "Enter a number..",
                  homeController.num3Text),
              kHeight15,
              loginButton(
                "START",
                2.6,
                () {
                  homeController.num1.value = true;
                  homeController.num2.value = true;
                  homeController.num3.value = true;
                  homeController.validationHome();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
