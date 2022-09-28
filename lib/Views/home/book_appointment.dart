import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/fontFamily_utils.dart';
import 'package:project/Views/Auth/reset_password_screen.dart';
import 'package:project/Views/customeWidgets/custom_appbar.dart';
import 'package:project/Views/customeWidgets/custom_btn.dart';
import 'package:sizer/sizer.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({Key? key}) : super(key: key);

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.whiteColor,
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize:Size.fromHeight(50),
            child: CustomAppBar(title: "Book Appointment",tooltip: "Share",),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10,top: 40,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Monday,March 25 2022",style: FontTextStyle.poppinsS12W5labelColor,),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: CustomButton(onTap: (){},buttonText:"Morning",textStyle: FontTextStyle.poppinsS14W4PrimaryColor,btnColor: ColorUtils.whiteColor,)),
                      SizedBox(width: 1.h,),
                      Expanded(child: CustomButton(onTap: (){},buttonText:"Evening",textStyle: FontTextStyle.poppinsS14W4PrimaryColor,btnColor: ColorUtils.whiteColor,)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      Text("Choose the Hour",style: FontTextStyle.poppinsS12W5labelColor,),
                      SizedBox(height: 2.h),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                            onTap: () {},
                            width: 120,
                            buttonText: "9:00 AM",
                            textStyle: FontTextStyle.poppinsS14W4PrimaryColor,
                            btnColor: ColorUtils.whiteColor,
                          ),
                          CustomButton(
                            onTap: () {},
                            width: 120,
                            buttonText: "10:00 AM",
                            textStyle: FontTextStyle.poppinsS14W4PrimaryColor,
                            btnColor: ColorUtils.whiteColor,
                          ),
                          CustomButton(
                            onTap: () {},
                            width: 120,
                            buttonText: "11:00 AM",
                            textStyle: FontTextStyle.poppinsS14W4PrimaryColor,
                            btnColor: ColorUtils.whiteColor,
                          ),
                        ],
                        ),
                        SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                            onTap: () {},
                            width: 120,
                            buttonText: "13:00 PM",
                            textStyle: FontTextStyle.poppinsS14W4PrimaryColor,
                            btnColor: ColorUtils.whiteColor,
                          ),
                          CustomButton(
                            onTap: () {},
                            width: 120,
                            buttonText: "14:00 PM",
                            textStyle: FontTextStyle.poppinsS14W4PrimaryColor,
                            btnColor: ColorUtils.whiteColor,
                          ),
                          CustomButton(
                            onTap: () {},
                            width: 120,
                            buttonText: "15:00 PM",
                            textStyle: FontTextStyle.poppinsS14W4PrimaryColor,
                            btnColor: ColorUtils.whiteColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                            onTap: () {},
                            width: 120,
                            buttonText: "17:00 PM",
                            textStyle: FontTextStyle.poppinsS14W4PrimaryColor,
                            btnColor: ColorUtils.whiteColor,
                          ),
                          CustomButton(
                            onTap: () {},
                            width: 120,
                            buttonText: "18:00 PM",
                            textStyle: FontTextStyle.poppinsS14W4PrimaryColor,
                            btnColor: ColorUtils.whiteColor,
                          ),
                          CustomButton(
                            onTap: () {},
                            width: 120,
                            buttonText: "19:00 PM",
                            textStyle: FontTextStyle.poppinsS14W4PrimaryColor,
                            btnColor: ColorUtils.whiteColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  Padding(
                    padding: const EdgeInsets.only(right: 20,left: 20),
                    child: CustomButton(
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>  ResetPasswordScreen()));},
                      buttonText: "Next",
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
