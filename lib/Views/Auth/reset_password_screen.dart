import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/fontFamily_utils.dart';
import 'package:project/Views/Auth/successfully_changed.dart';
import 'package:project/Views/customeWidgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';
import '../customeWidgets/custom_appbar.dart';
import '../customeWidgets/custom_btn.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool obscurePassword=false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.appBgColor,
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize:Size.fromHeight(50),
            child: CustomAppBar(title: "Reset Password",),
          ),
          body:SingleChildScrollView(
            child: Padding(
              padding:  const EdgeInsets.only(top: 20,left: 10),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 15),
                child: Column(
                  children: [
                    Text("Create a new password",style: FontTextStyle.poppinsS14W4DarkGreyColor,),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomTextField(
                      prefixIcon:Icon(Icons.lock_outlined),
                      suffixIcon: GestureDetector
                        (onTap: (){
                        setState(() {
                          obscurePassword=! obscurePassword;
                        });

                      },
                          child: obscurePassword? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
                      obscureText: obscurePassword,
                      fieldName: "New Password",
                      hintName: "New Password",
                    ),
                    SizedBox(
                      height: 2.h,
                    ),

                    CustomTextField(
                        prefixIcon:Icon(Icons.lock_outlined),
                      suffixIcon: GestureDetector
                        (onTap: (){
                        setState(() {
                          obscurePassword=! obscurePassword;
                        });

                      },
                          child: obscurePassword? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
                      obscureText: obscurePassword,
                        fieldName: "Confirm New Password",
                        hintName: "Confirm New Password",
                      ),
                    SizedBox(
                      height: 45.h,
                    ),

                    CustomButton(
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>  SuccessfullChanged()));},
                      buttonText: "Confirm",
                      textStyle: FontTextStyle.poppinsS14W4WhiteColor,
                    ),
                  ],
                ),
              ),

            ),
          ),
        ),
      ),
    );
  }
}
