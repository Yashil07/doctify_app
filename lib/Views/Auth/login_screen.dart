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
import 'package:project/Views/home/home_screen.dart';
import 'package:project/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';import '../../Provider/loader_provider.dart';
import '../../Provider/user_provider.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../customeWidgets/custom_btn.dart';
import '../customeWidgets/custom_text_field.dart';
import 'package:firebase_core/firebase_core.dart';

import '../customeWidgets/loader_layout.dart';
import '../customeWidgets/show_toast.dart';
import '../home/BottomNavBar.dart';
import 'forgot_password_email_screen.dart';

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

  @override
  void dispose() {
    _passwordController.clear();
    _emailController.clear();

  }

  //LOGIN DATA STORE ON FIREBASE
  loginData() async {
    final loading = Provider.of<LoaderProvider>(context, listen: false);
    loading.setLoader(value: true);
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
          bool result = await prefs.setString('patient', jsonEncode(map));
          String? userPref = prefs.getString('patient');

          Map<String, dynamic> mapuser =
          jsonDecode(userPref!) as Map<String, dynamic>;
          print(mapuser['uid']);
          print(userCredential.user!.uid);
          print('current User ${currentUser?.uid}');
          // store uid
          storage.write(key: "uid", value: userCredential.user!.uid);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return  BottomNavBar();
            },
          ), (route) => false);
          showToast(title: "Login Successfully !!", status: true);
          loading.setLoader(value: false);
        } else {

          showToast(title: "Patients does not exists", status: false);
          loading.setLoader(value: false);
        }
      });
    } on FirebaseAuthException catch (e) {

      showToast(title: "${e.message}", status: false);
      loading.setLoader(value: false);
    }
  }
  //LOGIN DATA STORE ON FIREBASE

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blueGrey,
          child: SafeArea(
            child: Scaffold(
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
                           CustomButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {

                                    loginData();


                                  }
                                },
                                buttonText: "Sign In",
                                textStyle: FontTextStyle.poppinsS14W4WhiteColor,
                              ),
                              //CustomButton(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBarScreen()));},buttonText:"Sign In",textStyle: FontTextStyle.poppinsS14W4WhiteColor,),
                              SizedBox(height: 2.h,),
                              GestureDetector(
                                child: Text(" Forgot Password?",style: FontTextStyle.poppinsS12W5labelColor,),
                                onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordEmailScreen()));},

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


          ),
        ),
        Provider.of<LoaderProvider>(context, listen: true).loader
            ? LoaderLayoutWidget()
            : SizedBox.shrink(),
      ],
    );
  }
}
