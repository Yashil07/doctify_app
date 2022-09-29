import 'package:flutter/material.dart';
import 'package:project/Views/customeWidgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';

import '../../Utils/image_utils.dart';
import '../Auth/profile_screen.dart';
import '../customeWidgets/custom_btn.dart';

class MyAppointment extends StatefulWidget {
  const MyAppointment({Key? key}) : super(key: key);

  @override
  State<MyAppointment> createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
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
                      Expanded(child: CustomButton(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));},buttonText:"Upcoming",textStyle: FontTextStyle.poppinsS14W4WhiteColor,)),
                      SizedBox(width: 1.h,),
                      Expanded(child: CustomButton(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));},buttonText:"Past",textStyle: FontTextStyle.poppinsS14W4PrimaryColor,btnColor: ColorUtils.whiteColor,)),
                    ],
                  ),
                  Center(
                    child: Column(
                      children:[
                        SizedBox(height: 15.0),
                        Image.asset(ImageUtils.logoImage),
                        Text("You don't have an appointment",style: FontTextStyle.poppinsS12W5labelColor,),
                        SizedBox(height: 10.h),
                        CustomButton(onTap: (){},buttonText:"Book Appointment Now",textStyle: FontTextStyle.poppinsS14W4WhiteColor,),
  
                      ]
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
