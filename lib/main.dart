import 'package:flutter/material.dart';
import 'package:project/Views/Auth/forget_password_screen_2.dart';
import 'package:project/Views/Auth/forgot_password_screen.dart';

import 'package:project/Views/Auth/login_screen.dart';
import 'package:project/Views/Auth/reg_screen.dart';
import 'package:project/Views/Auth/profile_screen.dart';
import 'package:project/Views/Auth/reset_password_screen.dart';
import 'package:project/Views/Profile/contactus_screen.dart';
import 'package:project/Views/Profile/help_setting_screen.dart';
import 'package:project/Views/Profile/notification_setting_screen.dart';
import 'package:project/Views/Profile/profile_setting_screen.dart';
import 'package:project/Views/home/appointment_details.dart';
import 'package:project/Views/home/home_screen.dart';
import 'package:project/Views/home/messaging_end_screen.dart';
import 'package:project/Views/home/my_appointment_screen.dart';
import 'package:project/Views/home/write_review_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Views/onBoarding/onbording_screen.dart';
import 'Views/onBoarding/splash_screen.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

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
         home: const MessagingEnd(),
        );
      }
    );
  }
}


