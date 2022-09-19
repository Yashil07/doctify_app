import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/fontFamily_utils.dart';
import 'package:project/Views/Auth/reset_password_screen.dart';
import 'package:project/Views/customeWidgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';
import '../customeWidgets/custom_appbar.dart';
import '../customeWidgets/custom_btn.dart';

class ForgotPasswordScreen2 extends StatefulWidget {
  const ForgotPasswordScreen2({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen2> createState() => _ForgotPasswordScreen2State();
}

class _ForgotPasswordScreen2State extends State<ForgotPasswordScreen2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.appBgColor,
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize:Size.fromHeight(50),
            child: CustomAppBar(title: "Forgot Password",),
          ),
          body:SingleChildScrollView(
            child: Padding(
              padding:  const EdgeInsets.only(top: 250,right: 20,left: 20,bottom: 20),
              child: Center(child: Column(
                children: [
                  const CustomTextField(
                    hintName: "Enter OTP here",
                    fieldName: "Code has been send to +9174*****27",
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text("Resend code in 56s",style: FontTextStyle.poppinsS12W5labelColor,),
                  SizedBox(
                    height: 30.h,
                  ),

                  CustomButton(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordScreen()));},
                    buttonText: "Confirm",
                    textStyle: FontTextStyle.poppinsS14W4WhiteColor,
                  ),
                ],
              )),

            ),
          ),
        ),
      ),
    );

  }
}
