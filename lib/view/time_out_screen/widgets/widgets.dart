import 'package:flutter/material.dart';
import 'package:flutter_application_7/common/constants/constants.dart';
import 'package:flutter_application_7/controller/home_controller.dart';
import 'package:flutter_application_7/dependency/dependency.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget centerTile(int num, bool color) => GetBuilder<HomeController>(
    init: HomeController(),
    builder: (ctrl) {
      return Center(
        child: Container(
          margin: EdgeInsets.all(8),
          height: 50.h,
          width: 160.w,
          decoration: BoxDecoration(
              color: color ? kWhite : kGreen,
              borderRadius: BorderRadius.circular(20),
              border: Border.all()),
          child: Center(
            child: Text(color ? num.toString() : "COMPLETED"),
          ),
        ),
      );
    });
