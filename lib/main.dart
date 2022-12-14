import 'package:flutter/material.dart';
import 'package:project/Views/Auth/forget_password_screen_2.dart';

import 'package:project/Views/Auth/login_screen.dart';
import 'package:project/Views/Auth/reg_screen.dart';
import 'package:project/Views/Auth/profile_screen.dart';
import 'package:project/Views/Auth/reset_password_screen.dart';
import 'package:project/Views/home/bottom_nav-bar_screen.dart';
import 'package:project/Views/home/listdemo.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Views/home/home_screen.dart';
import 'Views/onBoarding/onbording_screen.dart';
import 'Views/onBoarding/splash_screen.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final Future < FirebaseApp > _initialization = Firebase.initializeApp ( ) ;


  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
        return FutureBuilder(
            future: _initialization,
            builder: (context, snapshot){
              if(snapshot.hasError){
                print("Somthing Wents Wrong");
              }
              if(snapshot.connectionState==ConnectionState.done){
                return MaterialApp(
                  theme: ThemeData(
                    fontFamily: "Poppins", // backgroundColor: Color(0xffbE8F2F9),
                  ),
                  debugShowCheckedModeBanner: false,
                  home: const SplashScreen(),
                  //home: const BottomNavBarScreen(),
                  //home: const ListDemo(),
                );
              }
              return const CircularProgressIndicator();
            },
        );






      }
    );
  }
}


