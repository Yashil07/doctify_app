import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/Utils/image_utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Provider/user_provider.dart';
import '../../model/user_model.dart';
import '../home/BottomNavBar.dart';
import 'onbording1_screen.dart';
import 'onbording_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SharedPreferences? sharedPreferences;
  void getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences!.getString("patients") != null) {
      String? userPref = sharedPreferences!.getString('patients');

      Map<String, dynamic> userMap =
      jsonDecode(userPref!) as Map<String, dynamic>;


      String userCollection = "patients";
      DocumentSnapshot<Map<String, dynamic>> data = await FirebaseFirestore
          .instance
          .collection(userCollection)
          .doc(userMap['uid'])
          .get();
      Map<String, dynamic> currentData = data.data() as Map<String, dynamic>;
      UserModel currentUser = UserModel.fromJson(currentData);
      Provider.of<UserProvider>(context, listen: false)
          .setUserModel(currentUser);

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return BottomNavBar();
        },
      ), (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => OnBordingScreen()),
              (Route<dynamic> route) => false);
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () => getData());
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Image.asset(ImageUtils.splashImage,height: double.infinity,width: double.infinity, fit: BoxFit.fill,)
    );
  }
}
