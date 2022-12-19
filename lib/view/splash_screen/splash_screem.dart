import 'package:flutter/material.dart';
import 'package:flutter_application_7/common/constants/constants.dart';
import 'package:flutter_application_7/dependency/dependency.dart';
import 'package:flutter_application_7/view/login/login.dart';
import 'package:flutter_application_7/view/sign_up/sign_up.dart';
import 'package:get/get.dart';

class SplashShreen extends StatelessWidget {
  const SplashShreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loginCtrl.inIt();
      timerSplash();
    });
    return Scaffold(
      backgroundColor: kWhite,
      body: SizedBox(
        child: Center(
          child: Image.asset("assets/images/splash.gif"),
        ),
      ),
    );
  }

  timerSplash() {
    Future.delayed(const Duration(seconds: 3)).then((value) => Get.offAll(() {
          return loginCtrl.registered
              ? const LoginScreen()
              : const SignUpScreen();
        },
            duration: const Duration(milliseconds: 400),
            transition: Transition.fadeIn));
  }
}
