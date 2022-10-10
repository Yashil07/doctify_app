import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../Auth/profile_screen.dart';
import '../Profile/notification_setting_screen.dart';
import '../customeWidgets/custom_appbar.dart';
import '../customeWidgets/custom_btn.dart';
import 'messaging_end_screen.dart';

class AppointmentDetails extends StatefulWidget {
  final String? fullname;
  final String? age;
  final String? phoneno;
  final String? gender;
  final String? appointmentDate;
  final String? appointmentTime;
  const AppointmentDetails({Key? key, this.fullname, this.age, this.phoneno, this.gender, this.appointmentDate, this.appointmentTime}) : super(key: key);

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  String genderInitialValue = '';
  String appointmentDate = '';
  String appointmentTime = '';
  String fullname='';
  String age='';
  String phoneno='';
  @override
  void initState() {
    appointmentDate= widget.appointmentDate!;
    appointmentTime= widget.appointmentTime!;
    genderInitialValue= widget.gender!;
    fullname= widget.fullname!;
    age= widget.age!;
    phoneno= widget.phoneno!;
    print(appointmentDate);
    print(appointmentTime);
    print(genderInitialValue);
    print(fullname);
    print(age);
    print(phoneno);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child:  SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize:Size.fromHeight(50),
            child: CustomAppBar(title: "My Appointments",),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child: Column(
                children: [
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
                                  Icons.favorite,
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
                  SizedBox(height: 2.h),
                  Container(
                    height: 130,
                    width: 1000,
                    decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),
                      color: ColorUtils.whiteColor,
                      border: Border.all(color: ColorUtils.primaryColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 2.h,),
                            Center(
                              child: Container(
                                height:40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: ColorUtils.skyBlueColor,
                                    borderRadius: BorderRadius.circular(20)
                                  //more than 50% of width makes circle
                                ),
                                child:  Center(
                                  child: Icon(
                                    Icons.people,
                                    size: 30,
                                    color: ColorUtils.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            Text("5000+",style: FontTextStyle.poppinsS14W4PrimaryColor,),
                            SizedBox(height: 1.0,),
                            Text("Patients",style: FontTextStyle.poppinsS8W5labelColor,),
                          ],
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 2.h,),
                            Center(
                              child: Container(
                                height:40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: ColorUtils.skyBlueColor,
                                    borderRadius: BorderRadius.circular(20)
                                  //more than 50% of width makes circle
                                ),
                                child:  Center(
                                  child: Icon(
                                    Icons.person,
                                    size: 30,
                                    color: ColorUtils.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            Text("15+",style: FontTextStyle.poppinsS14W4PrimaryColor,),
                            SizedBox(height: 1.0,),
                            Text("Year Experience",style: FontTextStyle.poppinsS8W5labelColor,),
                          ],
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 2.h,),
                            Center(
                              child: Container(
                                height:40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: ColorUtils.skyBlueColor,
                                    borderRadius: BorderRadius.circular(20)
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
                            SizedBox(height: 1.h,),
                            Text("5000+",style: FontTextStyle.poppinsS14W4PrimaryColor,),
                            SizedBox(height: 1.0,),
                            Text("Reviews",style: FontTextStyle.poppinsS8W5labelColor,),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: ColorUtils.lightGreyColor),
                        bottom: BorderSide(
                            color: ColorUtils.lightGreyColor),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 15.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Visit Time",style:FontTextStyle.poppinsS12W7labelColor),
                                SizedBox(height: 1.h),
                                Text("${appointmentDate}",style:FontTextStyle.poppinsS12W5labelColor),
                                Text("${appointmentTime}",style:FontTextStyle.poppinsS12W5labelColor),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: ColorUtils.lightGreyColor),
                      ),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Patient Information",style:FontTextStyle.poppinsS12W7labelColor),
                                  SizedBox(height: 1.h),
                                  Row(
                                    children: [
                                      Column(

                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Full Name",style:FontTextStyle.poppinsS12W5labelColor),
                                          SizedBox(height: 1.5.h),
                                          Text("Age",style:FontTextStyle.poppinsS12W5labelColor),
                                          SizedBox(height: 1.5.h),
                                          Text("Gender",style:FontTextStyle.poppinsS12W5labelColor),
                                          SizedBox(height: 1.5.h),
                                          Text("Phone No",style:FontTextStyle.poppinsS12W5labelColor),
                                          //SizedBox(height: 1.5.h),
                                        ],
                                      ),
                                      SizedBox(width: 1.w),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(":",style:FontTextStyle.poppinsS12W5labelColor),
                                          SizedBox(height: 1.5.h),
                                          Text(":",style:FontTextStyle.poppinsS12W5labelColor),
                                          SizedBox(height: 1.5.h),
                                          Text(":",style:FontTextStyle.poppinsS12W5labelColor),
                                          SizedBox(height: 1.5.h),
                                          Text(":",style:FontTextStyle.poppinsS12W5labelColor),
                                          //SizedBox(height: 1.5.h),
                                        ],
                                      ),
                                      SizedBox(width: 1.w),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${fullname}",style:FontTextStyle.poppinsS12W5labelColor),
                                          SizedBox(height: 1.5.h),
                                          Text("${age}",style:FontTextStyle.poppinsS12W5labelColor),
                                          SizedBox(height: 1.5.h),
                                          Text("${genderInitialValue}",style:FontTextStyle.poppinsS12W5labelColor),
                                          SizedBox(height: 1.5.h),
                                          Text("${phoneno}",style:FontTextStyle.poppinsS12W5labelColor),
                                          //SizedBox(height: 1.5.h),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Fees Information",style:FontTextStyle.poppinsS12W7labelColor),
                                SizedBox(height: 1.h),
                                Row(
                                  children: [
                                    Text("500",style:FontTextStyle.poppinsS14W4PrimaryColor),
                                    Text("₹",style:FontTextStyle.poppinsS14W4PrimaryColor),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  CustomButton(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>MessagingEnd()));},buttonText:"Message Now",textStyle: FontTextStyle.poppinsS14W4WhiteColor,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
