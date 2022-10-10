
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
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
final  String? doctorId;
  const AboutDoctor({Key? key,this.doctorId}) : super(key: key);

  @override
  State<AboutDoctor> createState() => _AboutDoctorState();

}

class _AboutDoctorState extends State<AboutDoctor> {
  final TextEditingController dateInput = TextEditingController();
  final TextEditingController _appointmentController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  String  aDate = "";
  String doctorId = "";


  static Stream<QuerySnapshot<Map<String, dynamic>>>
  FetchDoctorData(doctorId) {
    Stream<QuerySnapshot<Map<String, dynamic>>> futureSnap = FirebaseFirestore
        .instance
        .collection("doctor") .where('doctor_id', isEqualTo: doctorId)

        .snapshots();
    return futureSnap;
  }

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
    if(widget.doctorId != null){
      doctorId = widget.doctorId!;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              title: "About Doctor",
            ),
          ),

          body:StreamBuilder(
              stream: FetchDoctorData(doctorId),
              builder: (BuildContext context,
                  AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData &&
                    snapshot.data.docs.length != 0) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.none) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    int length =
                        snapshot.data.docs.length;
                    print(length);
                    final docList = snapshot.data.docs;

                    return  SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(2.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                      // ClipRRect(
                                      //     borderRadius: const BorderRadius.only(topLeft:Radius.circular(15), bottomLeft: Radius.circular(15)),
                                      //
                                      //     child: Image.asset(ImageUtils.doctorImage,fit: BoxFit.fill,
                                      //       height: 121,
                                      //       width: 100.0,)
                                      // ),

                                      Container(

                                        height:120,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.only(topLeft:Radius.circular(15), bottomLeft: Radius.circular(15)),
                                            shape: BoxShape.rectangle,
                                            color: ColorUtils.skyBlueColor,
                                            image: DecorationImage(image: NetworkImage("${docList[0]['profileImg']}"),fit: BoxFit.cover)
                                          //more than 50% of width makes circle
                                        ),


                                        // child:data.userModel?.profileImg != null && data.userModel?.profileImg != "" ?
                                        // Image.network("${data.userModel?.profileImg}", fit: BoxFit.contain,) : Image.asset(ImageUtils.profileAvtar),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("Dr. ${docList[0]['fullName']}",style: FontTextStyle.poppinsS12W5labelColor,),
                                            SizedBox(height: 1.h),
                                            Text("${docList[0]['specialist']}",style: FontTextStyle.poppinsS8W5labelColor,),
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
                                        Text("${docList[0]['experience']}+",style: FontTextStyle.poppinsS14W4PrimaryColor,),
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
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 1.h),
                                      Text("About Doctor",style: FontTextStyle.poppinsS12W7labelColor),
                                      SizedBox(height: 1.h),
                                      Text("${docList[0]['biography']}",style: FontTextStyle.poppinsS10W5labelColor,),
                                      SizedBox(height:4.h),
                                      Text("Address",style: FontTextStyle.poppinsS12W7labelColor),
                                      SizedBox(height: 1.h),
                                      Text("${docList[0]['address']}",style: FontTextStyle.poppinsS10W5labelColor,),
                                      SizedBox(height:4.h),
                                      Text("Working Time",style: FontTextStyle.poppinsS12W7labelColor),
                                      SizedBox(height:1.h),
                                      Text("Mon-Fri, 09.00AM - 20.00PM",style: FontTextStyle.poppinsS10W5labelColor,),
                                      SizedBox(height:4.h),



                                    ],
                                  ),
                                ),
                              ),



                              CustomButton(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>  BookAppointment()));},buttonText:"Book Appointment",textStyle: FontTextStyle.poppinsS14W4WhiteColor,),

                            ]
                        ),
                      ),
                    );

                  }

                  ///
                } else {
                  return Container(
                    height: MediaQuery.of(context)
                        .size
                        .height,
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: [
                        Center(
                          child:
                          Text('no data available'),
                        ),
                      ],
                    ),
                  );
                }
              })

        ),
      ),
    );
  }
}


