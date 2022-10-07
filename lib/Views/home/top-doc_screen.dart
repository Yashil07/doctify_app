import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/Utils/fontFamily_utils.dart';
import 'package:project/Views/Auth/profile_screen.dart';

import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/image_utils.dart';
import '../customeWidgets/custom_appbar.dart';
import 'about_doctor.dart';

class TopDoctorScreen extends StatefulWidget {
  const TopDoctorScreen({Key? key}) : super(key: key);

  @override
  State<TopDoctorScreen> createState() => _TopDoctorScreenState();
}

class _TopDoctorScreenState extends State<TopDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child:  SafeArea(
        child: Scaffold(
          appBar:   const PreferredSize(
              preferredSize:Size.fromHeight(80),
              child: CustomAppBar(title: "Top Doctor",),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                children: [
                  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance.collection('doctor').snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                    if (snapshot.hasData) {
                      final docs = snapshot.data!.docs;
                      return SingleChildScrollView(
                        child: Column(
                          children: List.generate(docs.length, (index){
                            final data = docs[index].data();
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutDoctor()));},
                                  child: Container(

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
                                                Text("${data['fullName']}",style: FontTextStyle.poppinsS12W5labelColor,),
                                                SizedBox(height: 1.h),
                                                Text("${data['specialist']} Specialist",style: FontTextStyle.poppinsS8W5labelColor,),
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
                                ),
                                SizedBox(height: 2.h),
                              ],
                            );
                          }),
                        ),
                      );
                    }

                    return Center(child: CircularProgressIndicator());
                  },
                ),],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
