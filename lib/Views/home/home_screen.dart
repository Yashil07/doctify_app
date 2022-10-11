import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:project/Utils/image_utils.dart';
import 'package:project/Views/customeWidgets/custom_text_field.dart';
import 'package:project/Views/home/Favourite-doctor_screen.dart';
import 'package:project/Views/home/about_doctor.dart';
import 'package:project/Views/home/selected_specialist.dart';
import 'package:project/Views/home/specialist_screen.dart';
import 'package:project/Views/home/top-doc_screen.dart';
import 'package:project/model/doctor_model.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorUtils.whiteColor,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(150),
              child: Container(
                width: double.infinity,
                child: Padding(

                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 15,top: 15),
                  child: Column(

                    children: [
                      Expanded(
                        child: Row(


                          mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(ImageUtils.logoImage,height: 7.h,width: 13.w),
                          SizedBox(width: 3.w,),
                          Text("Doctify",style: FontTextStyle.poppinsS10W5labelColor,),
                          SizedBox(width: 30.w,),
                          GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const   FavouriteDoctorScreen()));},
                            child: Container(
                              height:45,
                              width: 45,
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
                          SizedBox(width: 5.w,),
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
                                Icons.notifications_sharp,
                                size: 30,
                                color: ColorUtils.primaryColor,
                              ),
                            ),
                          ),
                        ],
                    ),
                      ),
                      SizedBox(height: 0.5.h,),
                      const CustomTextField(
                        hintName: "Search",
                        suffixIcon: Icon(Icons.search),
                      )

                    ],


                  ),
                ),
              )),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 3.w),child: Column(
                      children: [
                        SizedBox(height: 1.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Specialist Doctor",style: FontTextStyle.poppinsS12W5labelColor,),
                            GestureDetector(
                                child: Text("See All",style: FontTextStyle.poppinsS12W5labelColor,),
                                onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const SpecialistScreen()));},),

                          ],
                        ),
                        SizedBox(height: 1.5.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectedSpecialist(
                              sid:"Cardio",
                            )));},
                              child: Container(
                                height:160,
                                width: 112,
                                decoration: BoxDecoration(
                                    color: ColorUtils.pinkColor,
                                    borderRadius: BorderRadius.circular(10)

                                  //more than 50% of width makes circle
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(ImageUtils.cardioImage,height: 5.h,),
                                    SizedBox( height: 1.h,),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 15,right: 8,top: 4,bottom: 5),
                                      child: Text("Cardio Specialist", style: FontTextStyle.poppinsS14W4WhiteColor,),
                                    ),
                                  ],
                                ),

                              ),
                            ),
                            GestureDetector(
                              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectedSpecialist(
                                sid:"Dental",
                              )));},
                              child: Container(
                                height:160,
                                width: 112,
                                decoration: BoxDecoration(
                                    color: ColorUtils.primaryColor,
                                    borderRadius: BorderRadius.circular(10)

                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(ImageUtils.toothImage,height: 5.h,),
                                    SizedBox( height: 1.h,),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 15,right: 8,top: 4,bottom: 5),
                                      child: Text("Dental Specialist", style: FontTextStyle.poppinsS14W4WhiteColor,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectedSpecialist(
                                sid:"Eye",
                              )));},
                              child: Container(
                                height:160,
                                width: 112,
                                decoration: BoxDecoration(
                                    color: ColorUtils.yellowColor,
                                    borderRadius: BorderRadius.circular(10)
                                  //more than 50% of width makes circle
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(ImageUtils.eyeImage,height: 5.h,),
                                    SizedBox( height: 1.h,),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 15,right: 8,top: 4,bottom: 5),
                                      child: Text("Eye Specialist", style: FontTextStyle.poppinsS14W4WhiteColor,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.5.h),

                        SizedBox(height: 2.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("All Doctor",style: FontTextStyle.poppinsS12W5labelColor,),
                            GestureDetector(
                              child: Text("See All",style: FontTextStyle.poppinsS12W5labelColor,),
                              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const TopDoctorScreen()));},),
                          ],
                        ),
                      ],
                    ),),
                    SizedBox(height: 1.5.h),
                    StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: FirebaseFirestore.instance.collection('doctor').snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                        if (snapshot.hasData) {

                          final docs = snapshot.data!.docs;
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(docs.length, (index){
                                final data = docs[index].data();
                                print(data["doctor_id"]);
                                return Row(
                                  children: [
                                    GestureDetector(
                                      onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) =>  AboutDoctor(doctorId: "${data["doctor_id"]}",)));},

                                      child: Container(
                                        height:240,
                                        width: 145,
                                        decoration: BoxDecoration(
                                            color: ColorUtils.appBgColor,
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(width: 1,
                                                color: ColorUtils.lightGreyColor
                                            )

                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Column(

                                            children: [
                                              // ClipRRect(
                                              //     borderRadius: const BorderRadius.only(topLeft:Radius.circular(15), topRight: Radius.circular(15)),
                                              //
                                              //     child: Image.asset(ImageUtils.doctorImage,fit: BoxFit.fill,
                                              //       height: 160.0,
                                              //       width: 150.0,
                                              //     )
                                              // ),
                                              Container(
                                                height:160.0,
                                                width: 150.0,
                                                decoration: BoxDecoration(
                                                    borderRadius: const BorderRadius.only(topLeft:Radius.circular(15), topRight: Radius.circular(15)),
                                                    shape: BoxShape.rectangle,
                                                    color: ColorUtils.skyBlueColor,
                                                    image: DecorationImage(image: NetworkImage("${data['profileImg']}"),fit: BoxFit.cover)
                                                  //more than 50% of width makes circle
                                                ),
                                                // child:data.userModel?.profileImg != null && data.userModel?.profileImg != "" ?
                                                // Image.network("${data.userModel?.profileImg}", fit: BoxFit.contain,) : Image.asset(ImageUtils.profileAvtar),

                                              ),
                                              SizedBox(height: 1.h,),
                                              Center(child: Text("${data['fullName']}",style: FontTextStyle.poppinsS8W5labelColor,)),
                                              SizedBox(height: 1.h,),
                                              Center(child: Text("${data['specialist']}",style: FontTextStyle.poppinsS8W5labelColor,)),





                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 3.w,),
                                  ],
                                );
                              }),
                            ),
                          );
                        }

                        return Center(child: CircularProgressIndicator());
                      },
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
