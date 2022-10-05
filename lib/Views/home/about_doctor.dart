
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Views/customeWidgets/custom_appbar.dart';
import 'package:project/Views/home/book_appointment.dart';
import 'package:sizer/sizer.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../customeWidgets/custom_btn.dart';
import 'home_screen.dart';
import 'package:intl/intl.dart';

class AboutDoctor extends StatefulWidget {
  const AboutDoctor({Key? key}) : super(key: key);

  @override
  State<AboutDoctor> createState() => _AboutDoctorState();

}

class _AboutDoctorState extends State<AboutDoctor> {
  final TextEditingController dateInput = TextEditingController();
  final TextEditingController _appointmentController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  String  aDate = "";

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dr Jenny Wilson'),
          backgroundColor: ColorUtils.primaryColor,
          leading: BackButton(),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.favorite_sharp),
              tooltip: 'Add to Favourite',
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.share),
              tooltip: 'Share',
              onPressed: () {},
            ),
          ],
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



                        ],
                      ),
                    ),
                  ),
                  SizedBox(height:4.h),
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

                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 15.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 1.h),
                            Text("About Doctor",style: FontTextStyle.poppinsS12W7labelColor),
                            SizedBox(height: 1.h),
                            Text("Dr. Jenny Wilson is the top most Cardiologist specialist in Apple Hospital at London. She achived several awards for herwonderful contribution in medical field. She is available forprivate consultation.",style: FontTextStyle.poppinsS10W5labelColor,),
                            SizedBox(height:4.h),
                            Text("Working Time",style: FontTextStyle.poppinsS12W7labelColor),
                            SizedBox(height:1.h),
                            Text("Mon-Fri,09.00AM - 20.00PM",style: FontTextStyle.poppinsS10W5labelColor,),
                            SizedBox(height:4.h),



                          ],
                        ),
                      ),
                    ),
                  ),



                  CustomButton(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>  BookAppointment()));},buttonText:"Book Appointment",textStyle: FontTextStyle.poppinsS14W4WhiteColor,),

                ]
            ),
          ),
        ),
      ),
    );
  }
}


