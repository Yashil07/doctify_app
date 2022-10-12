import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/Views/home/top-doc_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../../model/user_model.dart';
import '../Auth/profile_screen.dart';
import '../Message/chat_msg_screen.dart';
import '../customeWidgets/custom_btn.dart';
import 'messaging_end_screen.dart';

class Appointment_History extends StatefulWidget {
  const Appointment_History({Key? key}) : super(key: key);

  @override
  State<Appointment_History> createState() => _Appointment_HistoryState();
}

class _Appointment_HistoryState extends State<Appointment_History> {
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

  String chatId({
    required String id1,
    required String id2,
  }) {
    debugPrint('id1 length => ${id1.length} id2 length=> ${id2.length}');
    if (id1.compareTo(id2) > 0) {
      return id1 + '-' + id2;
    } else {
      return id2 + '-' + id1;
    }
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
                        Text("My Appointments",style: FontTextStyle.poppinsS12W5labelColor,),
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
                                                    Text("Dr ${docList[index]["doctorName"]}",style: FontTextStyle.poppinsS12W5labelColor,),
                                                    SizedBox(height: 1.h),
                                                    Text("Cardio Specialist",style: FontTextStyle.poppinsS8W5labelColor,),
                                                  ],
                                                ),
                                              ),

                                  docList[index]["amount"] != 500 ? GestureDetector(
                                  onTap: () {
                                    print("my chat userid:=${userId}");
                                    print("my chat docid:=${docList[index]["doctorId"]}");

                                    String id = chatId(
                                        id1: userId,
                                        id2: docList[index]["doctorId"]);

                                    FirebaseFirestore.instance
                                        .collection("chat")
                                        .doc(id)
                                        .set({
                                      "senderId": userId,
                                      "receiverId": docList[index]["doctorId"],
                                    });
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChatMsgScreen(receiverId: "${docList[index]["doctorId"]}",senderId: userId,)));
                                    },
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
                                  Icons.message,
                                  size: 30,
                                  color: ColorUtils.primaryColor,
                                  ),
                                  ),
                                  ),
                                  ),
                                  ) :   GestureDetector(
                                                onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const MessagingEnd()));},
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
                                                        Icons.call,
                                                        size: 30,
                                                        color: ColorUtils.primaryColor,
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
