import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../Auth/profile_screen.dart';
import '../customeWidgets/custom_btn.dart';

class Appointment_History extends StatefulWidget {
  const Appointment_History({Key? key}) : super(key: key);

  @override
  State<Appointment_History> createState() => _Appointment_HistoryState();
}

class _Appointment_HistoryState extends State<Appointment_History> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorUtils.whiteColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(75),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Image.asset(ImageUtils.logoImage,height: 5.h,width: 13.w),
                        SizedBox(width: 3.w,),
                        Text("My Appointments",style: FontTextStyle.poppinsS12W5labelColor,),
                      ],
                    ),
                  ),

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
                        Icons.add_circle_outline_outlined,
                        size: 30,
                        color: ColorUtils.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 2.h,left: 10.0,right: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: CustomButton(onTap: (){},buttonText:"Past",textStyle: FontTextStyle.poppinsS14W4PrimaryColor,btnColor: ColorUtils.whiteColor,)),
                      SizedBox(width: 1.h,),
                      Expanded(child: CustomButton(onTap: (){},buttonText:"Upcoming",textStyle: FontTextStyle.poppinsS14W4WhiteColor,)),
                      ],
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      Text("Yesterday, March 25 2022",style: FontTextStyle.poppinsS12W5labelColor,),
                    ],
                  ),
                  SizedBox(height: 1.h),
                   Column(
                    children: List.generate(3, (index) =>
                        Column(
                          children: [
                            SizedBox( height: 1.5.h),
                            Container(

                              height:120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorUtils.appBgColor,
                                  border: Border.all(color: ColorUtils.lightGreyColor),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding:  EdgeInsets.only(right: 5.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                        borderRadius: const BorderRadius.only(topLeft:Radius.circular(15), bottomLeft: Radius.circular(15)),

                                        child: Image.asset(ImageUtils.doctorImage,fit: BoxFit.fill,
                                          height: 121,
                                          width: 100.0,)
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text("Dr. Janny willson",style: FontTextStyle.poppinsS12W5labelColor,),
                                          SizedBox(height: 1.h),
                                          Text("Cardio Specialist",style: FontTextStyle.poppinsS8W5labelColor,),
                                        ],
                                      ),
                                    ),

                                    Center(
                                      child: Container(
                                        height:40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: ColorUtils.skyBlueColor,
                                            borderRadius: BorderRadius.circular(10)
                                          //more than 50% of width makes circle
                                        ),
                                        child:  Center(
                                          child: Icon(
                                            Icons.call,
                                            size: 30,
                                            color: ColorUtils.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Text("Monday, March 24 2022",style: FontTextStyle.poppinsS12W5labelColor,),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Column(
                    children: List.generate(3, (index) =>
                        Column(
                          children: [
                            SizedBox( height: 1.5.h),
                            Container(

                              height:120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorUtils.appBgColor,
                                  border: Border.all(color: ColorUtils.lightGreyColor),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding:  EdgeInsets.only(right: 5.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                        borderRadius: const BorderRadius.only(topLeft:Radius.circular(15), bottomLeft: Radius.circular(15)),

                                        child: Image.asset(ImageUtils.doctorImage,fit: BoxFit.fill,
                                          height: 121,
                                          width: 100.0,)
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text("Dr. Janny willson",style: FontTextStyle.poppinsS12W5labelColor,),
                                          SizedBox(height: 1.h),
                                          Text("Cardio Specialist",style: FontTextStyle.poppinsS8W5labelColor,),
                                        ],
                                      ),
                                    ),

                                    Center(
                                      child: Container(
                                        height:40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: ColorUtils.skyBlueColor,
                                            borderRadius: BorderRadius.circular(10)
                                          //more than 50% of width makes circle
                                        ),
                                        child:  Center(
                                          child: Icon(
                                            Icons.message,
                                            size: 30,
                                            color: ColorUtils.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
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
