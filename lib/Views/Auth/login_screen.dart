import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Views/Auth/reg_screen.dart';
import 'package:sizer/sizer.dart';import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../customeWidgets/custom_btn.dart';
import '../customeWidgets/custom_text_field.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();

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
                  SizedBox(height: 5.h,),
                  Padding(padding: EdgeInsets.symmetric(vertical: 8.w),
                    child: Center(child: Image.asset(ImageUtils.logoImage,height: 16.h,)),
                  ),
                  // SizedBox(height: 3.h,),
                  Center(
                    child: Text("Sign In",style:FontTextStyle.poppinsS20W7PrimaryColor),
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
                        SizedBox(height: 3.h,),

                        CustomButton(onTap: (){},buttonText:"Sign In",textStyle: FontTextStyle.poppinsS14W4WhiteColor,),
                        SizedBox(height: 1.h,),
                        GestureDetector(
                          child: Text(" Forgot Password",style:FontTextStyle.poppinsS10W5labelColor),
                          onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPassword()));},

                        ),
                        SizedBox(height: 3.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",style:FontTextStyle.poppinsS14W4DarkGreyColor),
                            GestureDetector(
                              child: Text(" Sign Up",style:FontTextStyle.poppinsS14W4PrimaryColor),
                              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const RegScreen()));},

                            ),

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
