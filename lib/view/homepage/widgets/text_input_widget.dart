import 'package:flutter/material.dart';
import 'package:flutter_application_7/common/constants/constants.dart';
import 'package:flutter_application_7/dependency/dependency.dart';
import 'package:get/get.dart';

Widget inputNumber(
    IconData icon, String hintText, TextEditingController controller) {
  Size size = Get.size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    child: TextFormField(
      style: TextStyle(color: Colors.black.withOpacity(.8)),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        fillColor: kBlack.withOpacity(.03),
        labelText: "Enter a Number",
        filled: true,
        prefixIcon: Icon(
          icon,
          color: kBlack.withOpacity(.7),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintMaxLines: 1,
        hintStyle: TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
      ),
      controller: controller,
    ),
  );
}
