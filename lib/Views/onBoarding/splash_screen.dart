import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project/Utils/image_utils.dart';
import 'onbording1_screen.dart';
import 'onbording_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => const OnBordingScreen()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Image.asset(ImageUtils.splashImage,height: double.infinity,width: double.infinity, fit: BoxFit.fill,)
    );
  }
}
