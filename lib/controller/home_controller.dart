import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_7/common/constants/constants.dart';
import 'package:flutter_application_7/view/homepage/home_page.dart';
import 'package:flutter_application_7/view/time_out_screen/time_out_screen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt inputNumber_1 = 0.obs;
  RxInt inputNumber_2 = 0.obs;
  RxInt inputNumber_3 = 0.obs;
  TextEditingController num1Text = TextEditingController();
  TextEditingController num2Text = TextEditingController();
  TextEditingController num3Text = TextEditingController();
  RxBool num1 = true.obs;
  RxBool num2 = true.obs;
  RxBool num3 = true.obs;

  validationHome() async {
    if (inputNumber_1 == null && inputNumber_1 == 0 ||
        inputNumber_2 == null && inputNumber_2 == 0 ||
        inputNumber_3 == null && inputNumber_3 == 0) {
      Get.snackbar(
          "Error", "Check All The Fiels\nPlease Enter A Number Greater Than 0",
          colorText: kRed);
    } else {
      inputNumber_1.value = int.parse(num1Text.value.text);
      inputNumber_2.value = int.parse(num2Text.value.text);
      inputNumber_3.value = int.parse(num3Text.value.text);
      Get.to(() => const TimeOutScreen(),
          duration: const Duration(milliseconds: 400),
          transition: Transition.fadeIn);
      await decrementFn();
      Get.snackbar("Sucess", "sdsd");
    }
  }

  decrementFn() {
    decrementTimer1();
    decrementTimer2();
    decrementTimer3();
  }

  // var temp = value;
  decrementTimer1() async {
    final temp = inputNumber_1.value;
    var temp1 = inputNumber_1.value;

    for (var i = 1; i <= temp; i++) {
      temp1 = temp1 - 1;
      if (temp1 <= 0) {
        checkComplete();
        break;
      }
      inputNumber_1.value = temp1;
      // inputNumber_1.value = inputNumber_1.value - 1;
      await Future.delayed(const Duration(seconds: 1));

      // return value;
    }
    num1.value = false;
    checkComplete();
  }

  decrementTimer2() async {
    final temp = inputNumber_2.value;
    var temp1 = inputNumber_1.value;

    for (var i = 1; i <= temp; i++) {
      temp1 = temp1 - 2;
      if (temp1 <= 0) {
        checkComplete();
        break;
      }
      inputNumber_2.value = temp1;
      // inputNumber_2.value = inputNumber_2.value - 2;
      await Future.delayed(const Duration(seconds: 1));

      // return value;

    }
    num2.value = false;
    checkComplete();
  }

  decrementTimer3() async {
    final temp = inputNumber_3.value;
    var temp1 = inputNumber_3.value;

    for (var i = 1; i <= temp; i++) {
      temp1 = temp1 - 3;
      if (temp1 <= 0) {
        checkComplete();
        break;
      }
      inputNumber_3.value = temp1;
      await Future.delayed(const Duration(seconds: 1));

      if (i == temp) {
        break;
      }
      // return value;
    }
    num3.value = false;
    checkComplete();
  }

  checkComplete() {
    if (num1.value == false && num2.value == false && num3.value == false) {
      Get.defaultDialog(
        buttonColor: kBlack,
        confirmTextColor: kWhite,
        title: "Completed",
        content: Text("SUCCESSFULLY COMPLETED"),
        textConfirm: "OK",
        onConfirm: () {
          Get.offAll(() => const HomePageScreen(),
              duration: Duration(
                milliseconds: 400,
              ),
              transition: Transition.rightToLeft);
        },
      );
    }
    // if (inputNumber_1.value <= 0 &&
    //     inputNumber_2.value <= 0 &&
    //     inputNumber_3.value <= 0) {

    // } else {
    //   return;
    // }
    // if ((num1.value && inputNumber_1.value != 0) &&
    //     (num2.value && inputNumber_2.value != 0) &&
    //     (num3.value && inputNumber_3.value != 0)) {
    //   return;
    // } else {
    //   Get.defaultDialog(title: "Completed");
    //   return;
    // }
  }
}
