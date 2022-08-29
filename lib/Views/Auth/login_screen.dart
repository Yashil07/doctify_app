import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/image_utils.dart';
import '../customeWidgets/custom_btn.dart';
import '../customeWidgets/custom_text_field.dart';

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
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.w),
                    child:Center(child: Image.asset(ImageUtils.mainLogoImage,height: 8.h,)),),
                SizedBox(height: 3.w,),
                Center(child: Image.asset(ImageUtils.loginImage,height: 22.h,)),
                SizedBox(height: 6.w,),
                Padding(padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(

                 children: [
                   // Text("${_emailController.text}"),
                   // Text("${_passwordController.text}"),
                   CustomTextField(fieldName: "Email-ID",hintName: "Enter Email-ID",fieldController: _emailController,),
                   SizedBox(height: 5.w,),
                  CustomTextField(fieldName: "Password",hintName: "Enter Password",fieldController: _passwordController,),
                  SizedBox(height: 10.w,),
                   CustomButton(onTap: (){},btnColor: ColorUtils.primaryColor,buttonText: "Sign in",height: 6.h,),

 TextButton(onPressed: (){print("Email - id here :-${_emailController.text}");}, child: Text("ok"))
                 ],
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
