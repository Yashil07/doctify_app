import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/Views/home/top-doc_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../../model/user_model.dart';
import '../Auth/profile_screen.dart';
import '../customeWidgets/custom_btn.dart';
import 'messaging_end_screen.dart';
import 'my_appointment_history_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String userId = "";
  String doctorId = "";
  SharedPreferences? sharedPreferences;
  void getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> data =
    jsonDecode(sharedPreferences!.getString("patient")!);
    var userData = UserModel.fromJson(data);

    print('uid${userData.uid}');
    setState(() {
      print(userData.uid);
      userId = userData.uid!;
    });
  }

  void initState() {
    getData();

    super.initState();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>>
  FetchAppointmentData(userId) {
    Stream<QuerySnapshot<Map<String, dynamic>>> futureSnap = FirebaseFirestore
        .instance
        .collection("appointment") .where('userId', isEqualTo: userId )
        .where('status', isEqualTo: 1 )

        .snapshots();
    return futureSnap;
  }
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
                        Text("Appointments History",style: FontTextStyle.poppinsS12W5labelColor,),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const TopDoctorScreen()));},
                    child: Container(
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
                    // children: [
                    //   Text("Yesterday, March 25 2022",style: FontTextStyle.poppinsS12W5labelColor,),
                    // ],
                  ),
                  SizedBox(height: 1.h),

                  StreamBuilder(
                      stream: FetchAppointmentData(userId),
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
                            print("apointment table length :-${length}");

                            final docList = snapshot.data.docs;
                            // final docId= {docList[in]['doctor_id']};
                            // doctorImage = "${docList[0]['profileImg']}";
                            // doctorName = "${docList[0]['fullName']}";doctorSpecialist = "${docList[0]['specialist']}";
                            //if(docList[index]["doctorName"] == 500) ? msg : call
                            print("amount :==${docList[0]["amount"] }");


                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: List.generate(docList.length, (index){
                                  final data = docList[index].data();
                                  final now = new DateTime.now();
                                  String callDateAndTimeCheck =
                                  DateFormat('EEEE, MMM dd, yyyy hh:mm a').format(now);
                                  print("callDateAndTimeCheck := ${callDateAndTimeCheck}");


                                  String myAppointmentDateTime ="${docList[index]["appointmentDate"]} ${docList[index]["appointmentTime"]}";
                                  print("myAppointmentDateTime:== ${myAppointmentDateTime}");
                                  return Column(
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
                                              Container(

                                                height:120,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    borderRadius: const BorderRadius.only(topLeft:Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                    shape: BoxShape.rectangle,
                                                    color: ColorUtils.skyBlueColor,
                                                    image: DecorationImage(image: NetworkImage("${docList[index]["doctorImage"]}"),fit: BoxFit.cover)
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
                                                    Text("Dr ${docList[index]["doctorName"]}",style: FontTextStyle.poppinsS12W5labelColor,),
                                                    SizedBox(height: 1.h),
                                                    Text("${docList[index]["doctorSpecialist"]}",style: FontTextStyle.poppinsS8W5labelColor,),
                                                    SizedBox(height: 1.h),
                                                    Text("${docList[index]["appointmentDate"]}",style: FontTextStyle.poppinsS8W5labelColor,),
                                                    SizedBox(height: 1.h),
                                                    Text("${docList[index]["appointmentTime"]}",style: FontTextStyle.poppinsS8W5labelColor,),
                                                  ],
                                                ),
                                              ),



                                              GestureDetector(
                                                onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => MessagingEnd(doctorImg: "${docList[index]["doctorImage"]}",doctorName: "Dr ${docList[index]["doctorName"]}",)));},
                                                child: Center(
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
                                                        Icons.feedback_outlined,
                                                        size: 30,
                                                        color:ColorUtils.primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            );

                          }

                          ///
                        } else {
                          return Center(
                            child: Column(
                                children:[
                                  SizedBox(height: 15.0),
                                  Image.asset(ImageUtils.noAppointmentImage),
                                  Text("You don't have an appointment",style: FontTextStyle.poppinsS12W5labelColor,),
                                  SizedBox(height: 10.h),
                                  //CustomButton(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => rofileScreen()));},buttonText:"Book Appointment Now",textStyle: FontTextStyle.poppinsS14W4WhiteColor,),

                                ]
                            ),
                          );
                        }
                      }),

                  SizedBox(height: 2.h),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
