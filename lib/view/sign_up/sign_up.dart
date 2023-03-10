import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/common/constants/constants.dart';
import 'package:flutter_application_7/dependency/dependency.dart';
import 'package:flutter_application_7/view/login/login.dart';
import 'package:flutter_application_7/view/login/widgets/scroll_behaviour.dart';
import 'package:flutter_application_7/view/sign_up/widgets/text_form_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen>
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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff07A3B2).withOpacity(.5),
                    Color(0xffD9ECC7).withOpacity(.2),
                  ],
                ),
              ),
              child: Opacity(
                opacity: opacity.value,
                child: Transform.scale(
                  scale: transform.value,
                  child: Container(
                    width: 370.w,
                    height: 617.h,
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
                            'SIGN UP',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: kBlack.withOpacity(.7),
                            ),
                          ),
                          const SizedBox(),
                          username(
                              Icons.account_circle_outlined, 'User name...'),
                          email(Icons.email_outlined, 'Email...'),
                          password(Icons.lock_outline, 'Password...'),
                          phonenumber(
                              Icons.account_circle_outlined, 'Phone number...'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              loginButton(
                                'SIGN UP',
                                2.6,
                                () {
                                  if (formKey.currentState!.validate()) {
                                    loginCtrl.saveUser();
                                    loginCtrl.inIt();
                                    formKey.currentState!.reset();
                                    Get.snackbar(
                                        "Success", "Successfully Registed");
                                  } else {
                                    return;
                                  }
                                },
                              ),
                            ],
                          ),
                          const SizedBox(),
                          RichText(
                            text: TextSpan(
                              text: 'Already registered Login',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 15.sp,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.offAll(() => LoginScreen(),
                                      duration: Duration(milliseconds: 400),
                                      transition: Transition.fadeIn);
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
