import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/fontFamily_utils.dart';
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
              child: Column(
                children: [
                  Text("Create a new password"),
                  Padding(
                    padding: EdgeInsets.only(top:30,left:10,right: 15),
                    child: CustomTextField(
                      fieldName: "New Password",
                      hintName: "New Password",
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:20,left: 10,right: 15),
                    child: CustomTextField(
                        fieldName: "Confirm New Password",
                        hintName: "Confirm New Password",
                      ),
                  ),
                  SizedBox(
                    height: 45.h,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: CustomButton(
                      onTap: () {},
                      buttonText: "Confirm",
                      textStyle: FontTextStyle.poppinsS14W4WhiteColor,
                    ),
                  ),
                ],
              ),

            ),
          ),
        ),
      ),
    );
  }
}
