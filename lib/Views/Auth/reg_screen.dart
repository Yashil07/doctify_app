import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/fontFamily_utils.dart';
import 'package:project/Utils/image_utils.dart';
import 'package:project/Views/Auth/profile_screen.dart';
import 'package:project/Views/customeWidgets/custom_btn.dart';
import 'package:project/Views/customeWidgets/custom_text_field.dart';
import 'package:project/Views/home/bottom_nav-bar_screen.dart';
import 'package:sizer/sizer.dart';

import 'login_screen.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  clearField() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorUtils.whiteColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.w),
                    child: Center(
                        child: Image.asset(
                      ImageUtils.logoImage,
                      height: 16.h,
                    )),
                  ),
                  // SizedBox(height: 3.h,),
                  Center(
                    child: Container(
                      child: Text("Sign Up",
                          style: FontTextStyle.poppinsS20W7PrimaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        children: [
                          CustomTextField(
                            fieldName: "Email-Id",
                            hintName: "Enter Your Email Id",
                            fieldController: _emailController,
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
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomTextField(
                            fieldName: "Password",
                            hintName: "Enter Your Password",
                            keyboard: TextInputType.visiblePassword,
                            fieldController: _passwordController,
                            validator: (str) {
                              if (str!.isEmpty) {
                                return '* Is Required';
                              } else if (str.trim().length < 8) {
                                return "Password must be least 8 character long!";
                              }

                              return null;
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomTextField(textInputAction: TextInputAction.done,
                            fieldName: "Confirm Password",
                            hintName: "Enter Your Password Again",
                            keyboard: TextInputType.visiblePassword,
                            fieldController: _confirmPasswordController,
                            validator: (str) {
                              if (str!.isEmpty) {
                                return '* Is Required';
                              } else if (str != _passwordController.text) {
                                return "Password does not match!";
                              }
                            },
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          CustomButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileScreen(
                                              emailId: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                            )));
                               // clearField();

                              }
                            },
                            buttonText: "Sign Up",
                            textStyle: FontTextStyle.poppinsS14W4WhiteColor,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text("Already have an account?",
                                    style: FontTextStyle
                                        .poppinsS14W4DarkGreyColor),
                              ),
                              Container(
                                  child: GestureDetector(
                                child: Text(" Sign In",
                                    style:
                                        FontTextStyle.poppinsS14W4PrimaryColor),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                              )),
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
    );
  }
}
