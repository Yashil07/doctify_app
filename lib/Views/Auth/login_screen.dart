import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/loder.dart';
import 'package:project/Views/Auth/forgot_password_screen.dart';
import 'package:project/Views/Auth/profile_screen.dart';
import 'package:project/Views/Auth/reg_screen.dart';
import 'package:project/Views/home/bottom_nav-bar_screen.dart';
import 'package:project/Views/home/home_screen.dart';
import 'package:project/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';import '../../Provider/user_provider.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../customeWidgets/custom_btn.dart';
import '../customeWidgets/custom_text_field.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
  bool obscurePassword=true;
  GlobalKey<FormState> formKey = GlobalKey();
  final currentUser = FirebaseAuth.instance.currentUser;
  final storage = const FlutterSecureStorage();
  bool loader = false;
  clearField() {
    _emailController.clear();
    _passwordController.clear();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //LOGIN DATA STORE ON FIREBASE
  loginData() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);

      FirebaseFirestore.instance
          .collection('patients')
          .doc(userCredential.user?.uid)
          .get()
          .then((value) async {
        print('value print $value');
        if (value.data() != null) {
          Map<String, dynamic> userMap = value.data() as Map<String, dynamic>;

          UserModel currentModel =  UserModel(
              email: userMap["email"],
              uid: userMap["uid"],
              fullName: userMap["fullName"],
              phoneNumber : userMap['phoneNumber'],
              gender: userMap["gender"],
              password: userMap["password"],
              profileImg: userMap['profileImg'],
              address: userMap["address"],
            birthdate: userMap["birthdate"],

          );

          Provider.of<UserProvider>(context, listen: false)
              .setUserModel(currentModel);

          Map<String, dynamic> map = currentModel.toJson();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          bool result = await prefs.setString('patients', jsonEncode(map));
          String? userPref = prefs.getString('patients');

          Map<String, dynamic> mapuser =
          jsonDecode(userPref!) as Map<String, dynamic>;
          print(mapuser['uid']);
          print(userCredential.user!.uid);
          print('current User ${currentUser?.uid}');
          // store uid
          storage.write(key: "uid", value: userCredential.user!.uid);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return  BottomNavBarScreen();
            },
          ), (route) => false);
clearField();        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Merchant does not exists")));
          setState(() {
            loader = false;
          });
        }
      });
    } on FirebaseAuthException catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${e.message}")));
      setState(() {
        loader = false;
      });
    }
  }
  //LOGIN DATA STORE ON FIREBASE

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Stack(
          children: [
            Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h,),
                      Padding(padding: EdgeInsets.symmetric(vertical: 8.w),
                        child: Center(child: Image.asset(ImageUtils.logoImage,height: 16.h,)),
                      ),
                      // SizedBox(height: 3.h,),
                      Center(
                        child: Container(
                          child: Text("Sign In",style:FontTextStyle.poppinsS20W7PrimaryColor),
                        ),
                      ),
                      SizedBox(height: 3.h,),
                      Form(
                        key: formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Column(
                            children: [
                              CustomTextField(
                                prefixIcon: Icon(Icons.email_outlined),
                                fieldName: "Email-Id",
                                hintName: "Enter Your Email Id",
                                fieldController:_emailController,
                                keyboard: TextInputType.emailAddress,
                                validator: (str) {
                                  if (str!.isEmpty) {
                                    return '* Is Required';
                                  } else if (!RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                      .hasMatch(str)) {
                                    return '* Enter valid email-ID';
                                  }
                                },
                              ),
                              SizedBox(height: 2.h,),
                              CustomTextField(
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: GestureDetector
                                  (onTap: (){
                                  setState(() {
                                    obscurePassword=! obscurePassword;
                                  });

                                },
                                    child: obscurePassword? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
                                obscureText: obscurePassword,
                                fieldName: "Password",
                                hintName: "Enter Your Password",
                                keyboard: TextInputType.visiblePassword,
                                maxLines: 1,
                                fieldController:_passwordController,
                                textInputAction:  TextInputAction.done,

                                validator: (str) {
                                  if (str!.isEmpty) {

                                    return '* Is Required';

                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 3.h,),
                           loader ? Lottie.asset(ImageUtils.loader, height: 10.w) :   CustomButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      loader = true;
                                    });
                                    loginData();


                                  }
                                },
                                buttonText: "Sign Up",
                                textStyle: FontTextStyle.poppinsS14W4WhiteColor,
                              ),
                              //CustomButton(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBarScreen()));},buttonText:"Sign In",textStyle: FontTextStyle.poppinsS14W4WhiteColor,),
                              SizedBox(height: 2.h,),
                              GestureDetector(
                                child: Text(" Forgot Password?",style: FontTextStyle.poppinsS12W5labelColor,),
                                onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));},

                              ),
                              SizedBox(height: 3.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account?",style:FontTextStyle.poppinsS14W4DarkGreyColor),
                                  GestureDetector(
                                    child: Text(" Sign Up",style:FontTextStyle.poppinsS14W4PrimaryColor),
                                    onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => RegScreen()));},

                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

            ),

          ],
        ),


      ),
    );
  }
}
