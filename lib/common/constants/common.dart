import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';

const kTextMedium = TextStyle(
    fontWeight: FontWeight.w500, color: Color.fromRGBO(35, 31, 32, .8));
const kTextBoldBlack = TextStyle(fontWeight: FontWeight.w800, color: kBlack);
const kTextBoldWhite = TextStyle(fontWeight: FontWeight.w800, color: kWhite);
const textHomeHeadStyle = TextStyle(fontWeight: FontWeight.w800, color: kBlack);
final kBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      const Color(0xff07A3B2).withOpacity(.5),
      const Color(0xffD9ECC7).withOpacity(.2),
    ],
  ),
);
final kWidth5 = SizedBox(
  width: 5.w,
);
final kWidth10 = SizedBox(
  width: 10.w,
);
final kWidth30 = SizedBox(
  width: 30.w,
);
final kHeight5 = SizedBox(
  height: 5.h,
);
final kHeight10 = SizedBox(
  height: 10.h,
);
final kHeight15 = SizedBox(
  height: 15.h,
);
final glassDecoration = BoxDecoration(
    border: Border.all(width: .5, color: kBlack.withOpacity(.3)),
    borderRadius: BorderRadius.circular(20),
    gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: [Colors.white60, Colors.white12]));
