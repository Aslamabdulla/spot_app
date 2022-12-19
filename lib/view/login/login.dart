import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/common/constants/constants.dart';
import 'package:flutter_application_7/dependency/dependency.dart';
import 'package:flutter_application_7/view/login/widgets/scroll_behaviour.dart';
import 'package:flutter_application_7/view/sign_up/sign_up.dart';
import 'package:flutter_application_7/view/sign_up/widgets/text_form_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/constants/common.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacity;
  late Animation<double> transform;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.ease,
      ),
    )..addListener(() {
        setState(() {});
      });

    transform = Tween<double>(begin: 2, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
   
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ScrollConfiguration(
        behavior: Behaviour(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Container(
              alignment: Alignment.center,
              decoration: kBoxDecoration,
              child: Opacity(
                opacity: opacity.value,
                child: Transform.scale(
                  scale: transform.value,
                  child: Container(
                    width: 370.w,
                    height: 452.h,
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: kBlack.withOpacity(.1),
                          blurRadius: 90,
                        ),
                      ],
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(),
                          Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(.7),
                            ),
                          ),
                          const SizedBox(),
                          Text(
                            loginCtrl.user?.name == null
                                ? "USER"
                                : loginCtrl.user!.name!.toUpperCase(),
                            style: kTextBoldBlack,
                          ),
                          email(Icons.email_outlined, 'Email...'),
                          password(Icons.lock_outline, 'Password...'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              loginButton(
                                'LOGIN',
                                2.6.w,
                                () {
                                  HapticFeedback.vibrate();
                                  if (formKey.currentState!.validate()) {
                                    loginCtrl.loginUser();
                                  } else {
                                    Get.snackbar(
                                        "Error", "Please Check all the field",
                                        colorText: kRed);
                                  }
                                },
                              ),
                            ],
                          ),
                          const SizedBox(),
                          RichText(
                            text: TextSpan(
                              text: 'Create a new Account',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 16.sp,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.offAll(() => const SignUpScreen(),
                                      transition: Transition.fadeIn,
                                      duration:
                                          const Duration(milliseconds: 400));
                                },
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
