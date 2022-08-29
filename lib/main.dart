import 'package:flutter/material.dart';
import 'package:project/Views/Auth/login_screen.dart';
import 'package:project/Views/Auth/reg_screen.dart';
import 'package:sizer/sizer.dart';

import 'Views/onBoarding/onbording_screen.dart';
import 'Views/onBoarding/splash_screen.dart';


void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: ThemeData(
            fontFamily: "Poppins",
            // backgroundColor: Color(0xffbE8F2F9),
          ),
          debugShowCheckedModeBanner: false,
         // home: const LoginScreen(),
         home: const SplashScreen(),
        );
      }
    );
  }
}


