import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../customeWidgets/custom_btn.dart';
import '../customeWidgets/custom_text_field.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorUtils.whiteColor,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(75),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Container(

                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(ImageUtils.logoImage,height: 5.h,width: 13.w),
                            SizedBox(width: 3.w,),
                            Text("Profile",style: FontTextStyle.poppinsS12W5labelColor,),
                          ],
                        ),
                      ),
                      // SizedBox(width: 50.w,),
                      // Container(
                      //   height:45,
                      //   width: 45,
                      //   decoration: BoxDecoration(
                      //       color: ColorUtils.skyBlueColor,
                      //       borderRadius: BorderRadius.circular(10)
                      //     //more than 50% of width makes circle
                      //   ),
                      //   child:  Center(
                      //     child: Icon(
                      //       Icons.favorite,
                      //       size: 30,
                      //       color: ColorUtils.primaryColor,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(width: 17.w,),
                      Container(
                        height:45,
                        width: 45,
                        decoration: BoxDecoration(
                            color: ColorUtils.skyBlueColor,
                            borderRadius: BorderRadius.circular(10)
                          //more than 50% of width makes circle
                        ),
                        child: Center(
                          child: Icon(
                            Icons.edit,
                            size: 30,
                            color: ColorUtils.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          body: Padding(
            padding: const EdgeInsets.only(top: 2.0, left: 12.0, right: 12.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                      color: ColorUtils.darkGreyColor),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Container(

                            height:100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: ColorUtils.skyBlueColor,
                                borderRadius: BorderRadius.circular(100)
                              //more than 50% of width makes circle
                            ),
                            child: Icon(
                              Icons.person,
                              size: 5.h,
                              color: ColorUtils.primaryColor,
                            ),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Doctify",style:FontTextStyle.poppinsS12W5labelColor),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text("doctify@gmail.com",style:FontTextStyle.poppinsS14W4DarkGreyColor),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text("India",style: FontTextStyle.poppinsS14W4DarkGreyColor),
                            ],


                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10.0,
                // ),




                  const SizedBox(
                    height: 5.0,
                  ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: ColorUtils.darkGreyColor),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Container(

                            height:50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: ColorUtils.skyBlueColor,
                                borderRadius: BorderRadius.circular(10)
                              //more than 50% of width makes circle
                            ),
                            child: Icon(
                              Icons.notifications,
                              size: 4.h,
                              color: ColorUtils.primaryColor,
                            ),

                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Notification",style:FontTextStyle.poppinsS12W5labelColor),
                            ],
                          ),
                        ),
                        // Padding(
                        //     padding: const EdgeInsets.only(left: 150.0, top: 25.0),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text("Hello",)
                        //     ],
                        //   ),
                        // ),

                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 5.0,
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ColorUtils.darkGreyColor),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Container(

                            height:50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: ColorUtils.skyBlueColor,
                                borderRadius: BorderRadius.circular(10)
                              //more than 50% of width makes circle
                            ),
                            child: Icon(
                              Icons.lock,
                              size: 4.h,
                              color: ColorUtils.primaryColor,
                            ),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Security",style:FontTextStyle.poppinsS12W5labelColor),
                            ],


                          ),
                        ),

                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 5.0,
                ),



                Container(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ColorUtils.darkGreyColor),
                        ),
                      ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Container(

                              height:50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: ColorUtils.skyBlueColor,
                                  borderRadius: BorderRadius.circular(10)
                                //more than 50% of width makes circle
                              ),
                              child: Icon(
                                Icons.help,
                                size: 4.h,
                                color: ColorUtils.primaryColor,
                              ),

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Help",style:FontTextStyle.poppinsS12W5labelColor),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 200.0),
                          //   child: Column(
                          //     // crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Icon(
                          //         Icons.arrow_forward_ios,
                          //         size: 3.h,
                          //         color: ColorUtils.primaryColor,)
                          //     ],
                          //   ),
                          // ),
                          // Padding(
                          //     padding: const EdgeInsets.only(left: 150.0, top: 25.0),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text("Hello",)
                          //     ],
                          //   ),
                          // ),

                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 5.0,
                ),

                Container(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ColorUtils.darkGreyColor),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Container(

                              height:50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: ColorUtils.skyBlueColor,
                                  borderRadius: BorderRadius.circular(10)
                                //more than 50% of width makes circle
                              ),
                              child: Icon(
                                Icons.people_alt_outlined,
                                size: 4.h,
                                color: ColorUtils.primaryColor,
                              ),

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Invite Friends",style:FontTextStyle.poppinsS12W5labelColor),
                              ],
                            ),
                          ),
                          // Padding(
                          //     padding: const EdgeInsets.only(left: 130.0),
                          //   child: Column(
                          //     // crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Icon(
                          //         Icons.arrow_forward_ios,
                          //         size: 3.h,
                          //         color: ColorUtils.primaryColor,)
                          //     ],
                          //   ),
                          // ),

                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 5.0,
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ColorUtils.darkGreyColor),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Container(

                            height:50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: ColorUtils.lightPinkColor,
                                borderRadius: BorderRadius.circular(10)
                              //more than 50% of width makes circle
                            ),
                            child: Icon(
                              Icons.logout,
                              size: 4.h,
                              color: ColorUtils.redColor,
                            ),

                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Logout",style:FontTextStyle.poppinsS12W5labelColor),
                            ],
                          ),
                        ),
                        // Padding(
                        //     padding: const EdgeInsets.only(left: 150.0, top: 25.0),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text("Hello",)
                        //     ],
                        //   ),
                        // ),

                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 5.0,
                ),













              ],
            ),


          ),
      ),
      )
    );

  }
}

