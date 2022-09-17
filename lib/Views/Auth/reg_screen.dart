import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/fontFamily_utils.dart';
import 'package:project/Utils/image_utils.dart';
import 'package:project/Views/customeWidgets/custom_btn.dart';
import 'package:project/Views/customeWidgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

import 'login_screen.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final TextEditingController  _emailController = TextEditingController();
  final TextEditingController  _passwordController = TextEditingController();
  final TextEditingController  _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 1.5.h,),
                  Padding(padding: EdgeInsets.symmetric(vertical: 8.w),
                    child: Center(child: Image.asset(ImageUtils.logoImage,height: 16.h,)),
                  ),
                  // SizedBox(height: 3.h,),
                  Center(
                    child: Container(
                      child: Text("Sign Up",style:FontTextStyle.poppinsS20W7PrimaryColor),
                    ),
                  ),
                  SizedBox(height: 3.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      children: [
                        CustomTextField(
                          fieldName: "Email-Id",
                          hintName: "Enter Your Email Id",
                          fieldController:_emailController,
                        ),
                        SizedBox(height: 2.h,),
                        CustomTextField(
                          fieldName: "Password",
                          hintName: "Enter Your Password",
                          fieldController:_passwordController,
                        ),
                        SizedBox(height: 2.h,),
                        CustomTextField(
                          fieldName: "Confirm Password",
                          hintName: "Enter Your Password Again",
                          fieldController:_confirmPasswordController,
                        ),
                        SizedBox(height: 3.h,),
                        CustomButton(onTap: (){},buttonText:"Sign Up",textStyle: FontTextStyle.poppinsS14W4WhiteColor,),
                        SizedBox(height: 3.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("Already have an account?",style:FontTextStyle.poppinsS14W4DarkGreyColor),
                            ),
                            Container(
                              child: GestureDetector(
                                  child: Text(" Sign In",style:FontTextStyle.poppinsS14W4PrimaryColor),
                                  onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));},

                            )),
                          ],
                        )
                      ],
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
