import 'package:flutter_application_7/common/constants/constants.dart';
import 'package:flutter_application_7/model/user/user.dart';
import 'package:flutter_application_7/view/homepage/home_page.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginController extends GetxController {
  String? email;
  String? _password;
  String? name;
  int? phone;
  bool registered = true;
  User? user;
  final box = Hive.box("userBox");

  set passwordSettter(String value) => _password = value;

  get passwordGetter => _password;

  saveUser() async {
    final temp = User(
        email: email!.trim(),
        password: _password!.trim(),
        name: name!.trim(),
        phoneNumber: phone);
    // Map<String, dynamic> user = {
    //   "name": name,
    //   "password": _password,
    //   "email": email,
    //   "phone": phone
    // };
    await box.put("user", temp.toMap());
    // final temp = box.get("user");
    // print(temp.toString());
  }

  inIt() async {
    final orderKeys = box.keys.toList();
    if (!orderKeys.contains("user")) {
      registered = false;
    } else {
      registered = true;
      // final temp = User.fromMap(box.get("user"));
      final temp = await box.get("user") as Map<dynamic, dynamic>;
      user = User.fromMap(temp);
    }
  }

  loginUser() async {
    if (user!.email == email && user!.password == _password) {
      Get.offAll(() => const HomePageScreen(),
          transition: Transition.leftToRight);
    } else {
      Get.snackbar("Error", "Email or Password is Wrong", colorText: kRed);
    }
  }

  @override
  void onInit() {
    inIt();
    // TODO: implement onInit
    super.onInit();
  }
}
