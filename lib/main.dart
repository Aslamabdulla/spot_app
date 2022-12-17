import 'package:flutter/material.dart';
import 'package:flutter_application_7/view/login/login.dart';
import 'package:flutter_application_7/view/splash_screen/splash_screem.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spot',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: Colors.blue,
        ),
        home: const SplashShreen());
  }
}
