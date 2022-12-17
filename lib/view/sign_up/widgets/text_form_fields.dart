import 'package:flutter/material.dart';
import 'package:flutter_application_7/common/constants/constants.dart';
import 'package:get/get.dart';

Widget username(IconData icon, String hintText) {
  Size size = Get.size;
  return Container(
    height: size.width / 8,
    width: size.width / 1.22,
    alignment: Alignment.center,
    padding: EdgeInsets.only(right: size.width / 30),
    decoration: BoxDecoration(
      color: kBlack.withOpacity(.05),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextFormField(
      style: TextStyle(color: kBlack.withOpacity(.8)),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: kBlack.withOpacity(.7),
        ),
        border: InputBorder.none,
        hintMaxLines: 1,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.black.withOpacity(.5),
        ),
      ),
    ),
  );
}

Widget email(IconData icon, String hintText) {
  Size size = Get.size;
  return Container(
    height: size.width / 8,
    width: size.width / 1.22,
    alignment: Alignment.center,
    padding: EdgeInsets.only(right: size.width / 30),
    decoration: BoxDecoration(
      color: kBlack.withOpacity(.05),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextFormField(
      style: TextStyle(color: kBlack.withOpacity(.8)),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: kBlack.withOpacity(.7),
        ),
        border: InputBorder.none,
        hintMaxLines: 1,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: kBlack.withOpacity(.5)),
      ),
    ),
  );
}

Widget password(IconData icon, String hintText) {
  Size size = Get.size;
  return Container(
    height: size.width / 8,
    width: size.width / 1.22,
    alignment: Alignment.center,
    padding: EdgeInsets.only(right: size.width / 30),
    decoration: BoxDecoration(
      color: kBlack.withOpacity(.05),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextFormField(
      style: TextStyle(color: Colors.black.withOpacity(.8)),
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: kBlack.withOpacity(.7),
        ),
        border: InputBorder.none,
        hintMaxLines: 1,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
      ),
    ),
  );
}

Widget phonenumber(IconData icon, String hintText) {
  Size size = Get.size;
  return Container(
    height: size.width / 8,
    width: size.width / 1.22,
    alignment: Alignment.center,
    padding: EdgeInsets.only(right: size.width / 30),
    decoration: BoxDecoration(
      color: kBlack.withOpacity(.05),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextFormField(
      style: TextStyle(color: Colors.black.withOpacity(.8)),
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: kBlack.withOpacity(.7),
        ),
        border: InputBorder.none,
        hintMaxLines: 1,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
      ),
      validator: (value) {
        if (value != null && value.length < 10) {
          Get.snackbar("Error",
              "Error on Phone number\nPlease Enter Your 10 digits mobile number",
              colorText: kRed);
        } else {
          return null;
        }
      },
    ),
  );
}
