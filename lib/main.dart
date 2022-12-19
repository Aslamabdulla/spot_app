import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/model/hive/user_model.dart';
import 'package:flutter_application_7/view/homepage/home_page.dart';

import 'package:flutter_application_7/view/splash_screen/splash_screem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveUserAdapter());
  await Hive.openBox("userBox");
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 844),
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Spot',
              theme: ThemeData(
                textTheme: TextTheme(button: TextStyle(fontSize: 18.sp)),
                fontFamily: 'Poppins',
                primarySwatch: Colors.blue,
              ),
              home: const SplashShreen());
        });
  }
}
