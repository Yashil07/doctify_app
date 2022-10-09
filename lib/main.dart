import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project/Views/Auth/forget_password_screen_2.dart';

import 'package:project/Views/Auth/login_screen.dart';
import 'package:project/Views/Profile/profile_update_screen.dart';
import 'package:project/Views/Auth/reg_screen.dart';
import 'package:project/Views/Auth/profile_screen.dart';
import 'package:project/Views/Auth/reset_password_screen.dart';
import 'package:project/Views/home/about_doctor.dart';
import 'package:project/Views/home/listdemo.dart';
import 'package:project/Views/home/my_appointment_history_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Provider/loader_provider.dart';
import 'Provider/user_provider.dart';
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
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => UserProvider(),
            ),
            ChangeNotifierProvider(create: (context) => LoaderProvider()),
          ],
          child: GetMaterialApp(
            theme: ThemeData(
              fontFamily: "Poppins", // backgroundColor: Color(0xffbE8F2F9),
            ),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          ),
        );
        }
    );
  }
}



