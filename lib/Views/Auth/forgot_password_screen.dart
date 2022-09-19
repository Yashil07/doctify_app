import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Views/Auth/forget_password_screen_2.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/fontFamily_utils.dart';
import '../customeWidgets/custom_appbar.dart';
import '../customeWidgets/custom_btn.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child:  SafeArea(
        child: Scaffold(
          appBar: PreferredSize(

            preferredSize: Size.fromHeight(50),
            child:CustomAppBar(title: "Forgot Password",),),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Select which contact details should we use to reset your password",style:FontTextStyle.poppinsS12W5labelColor,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(

                        height: 150,
                        width: 1000,
                        decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),
                          color: ColorUtils.whiteColor,
                        ),



                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(

                                height:100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: ColorUtils.skyBlueColor,
                                    borderRadius: BorderRadius.circular(100)
                                  //more than 50% of width makes circle
                                ),
                                child: Icon(
                                  Icons.sms,
                                  size: 5.h,
                                  color: ColorUtils.primaryColor,
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, top: 40.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("via SMS :",style:FontTextStyle.poppinsS12W5labelColor),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text("+91 9737xxxx73",style:FontTextStyle.poppinsS14W4PrimaryColor),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(

                        height: 150,
                        width: 1000,
                        decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),
                          color: ColorUtils.whiteColor,
                        ),



                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(

                                height:100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: ColorUtils.skyBlueColor,
                                    borderRadius: BorderRadius.circular(100)
                                  //more than 50% of width makes circle
                                ),
                                child: Icon(
                                  Icons.email,
                                  size: 5.h,
                                  color: ColorUtils.primaryColor,
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, top: 40.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("via Email :",style:FontTextStyle.poppinsS12W5labelColor),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text("exam..@gmail.com",style:FontTextStyle.poppinsS14W4PrimaryColor),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Container(
                        child: CustomButton(
                          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen2()));},
                          buttonText: "Confirm",
                          textStyle: FontTextStyle.poppinsS14W4WhiteColor,
                        ),
                      )
                    ],
                  ),

                ),
              ),
            ),
          ),
        ),

      ),
    );
  }
}