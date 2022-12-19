import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/common/constants/constants.dart';
import 'package:flutter_application_7/dependency/dependency.dart';
import 'package:get/get.dart';

Widget username(IconData icon, String hintText) {
  Size size = Get.size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    child: TextFormField(
        style: TextStyle(color: kBlack.withOpacity(.8)),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          fillColor: kBlack.withOpacity(.03),
          filled: true,
          prefixIcon: Icon(
            icon,
            color: kBlack.withOpacity(.7),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(.5),
          ),
        ),
        validator: (value) {
          if (value != null) {
            if (value.length < 4) {
              return "Minimum 4 letters needed";
            }
            loginCtrl.name = value;
          } else {
            return "Invalid user name";
          }
        }),
  );
}

Widget email(IconData icon, String hintText) {
  Size size = Get.size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    child: TextFormField(
        style: TextStyle(color: kBlack.withOpacity(.8)),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          fillColor: kBlack.withOpacity(.03),
          filled: true,
          prefixIcon: Icon(
            icon,
            color: kBlack.withOpacity(.7),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: kBlack.withOpacity(.5)),
        ),
        validator: (value) {
          if (value != null && EmailValidator.validate(value)) {
            loginCtrl.email = value;
          } else {
            return "Invalid Email";
          }
        }),
  );
}

Widget password(IconData icon, String hintText) {
  Size size = Get.size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    child: TextFormField(
        style: TextStyle(color: Colors.black.withOpacity(.8)),
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          fillColor: kBlack.withOpacity(.03),
          filled: true,
          prefixIcon: Icon(
            icon,
            color: kBlack.withOpacity(.7),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          // hintMaxLines: 1,
          hintText: hintText,
          hintStyle:
              TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
        ),
        validator: (value) {
          if (value != null) {
            if (value.length < 6) {
              return "Minimum 6 letters needed";
            }
            loginCtrl.passwordSettter = value;
          } else {
            return "Invalid password";
          }
        }),
  );
}

Widget phonenumber(IconData icon, String hintText) {
  Size size = Get.size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    child: TextFormField(
        style: TextStyle(color: Colors.black.withOpacity(.8)),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          fillColor: kBlack.withOpacity(.03),
          filled: true,
          prefixIcon: Icon(
            icon,
            color: kBlack.withOpacity(.7),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle:
              TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
        ),
        validator: (value) {
          if (value != null) {
            if (value.length < 10) {
              return "Minimum 10 letters needed";
            } else if (value.length > 10) {
              return "Maximum 10 letters only";
            }
            loginCtrl.phone = int.parse(value);
          } else {
            return "Invalid phone";
          }
        }),
  );
}
