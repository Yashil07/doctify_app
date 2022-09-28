import 'package:flutter/material.dart';

import 'package:project/Utils/image_utils.dart';
import 'package:project/Views/customeWidgets/custom_text_field.dart';
import 'package:project/Views/home/specialist_screen.dart';
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

                      Row(


                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImageUtils.logoImage,height: 7.h,width: 13.w),
                        SizedBox(width: 3.w,),
                        Text("Doctify",style: FontTextStyle.poppinsS10W5labelColor,),
                        SizedBox(width: 30.w,),
                        Container(
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
                            Container(
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
                                  Icon(
                                      Icons.monitor_heart_rounded,
                                    size: 5.h,
                                    color: ColorUtils.whiteColor,
                                  ),
                                  SizedBox( height: 1.h,),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 8,top: 4,bottom: 5),
                                    child: Text("Cardio Specialist", style: FontTextStyle.poppinsS14W4WhiteColor,),
                                  ),
                                ],
                              ),

                            ),
                            Container(
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
                                  Icon(
                                    Icons.monitor_heart_rounded,
                                    size: 5.h,
                                    color: ColorUtils.whiteColor,
                                  ),
                                  SizedBox( height: 1.h,),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 8,top: 4,bottom: 5),
                                    child: Text("Dental Specialist", style: FontTextStyle.poppinsS14W4WhiteColor,),
                                  ),
                                ],
                              ),
                            ),
                            Container(
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
                                  Icon(
                                    Icons.remove_red_eye,
                                    size: 5.h,
                                    color: ColorUtils.whiteColor,
                                  ),
                                  SizedBox( height: 1.h,),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 8,top: 4,bottom: 5),
                                    child: Text("Eye Specialist", style: FontTextStyle.poppinsS14W4WhiteColor,),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Top Doctor",style: FontTextStyle.poppinsS12W5labelColor,),
                            Text("See All",style: FontTextStyle.poppinsS12W5labelColor,),
                          ],
                        ),
                      ],
                    ),),
                    SizedBox(height: 1.5.h),

                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(10, (index){
                            return Row(
                              children: [
                                Container(
                                  height:250,
                                  width: 150,
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
                                        ClipRRect(
                                            borderRadius: BorderRadius.only(topLeft:Radius.circular(15), topRight: Radius.circular(15)),

                                            child: Image.asset(ImageUtils.DoctorImage,fit: BoxFit.fill,
                                              height: 180.0,
                                              width: 150.0,)
                                        ),
                                        SizedBox(height: 1.h,),
                                        Center(child: Text("Dr. Janny Willson",style: FontTextStyle.poppinsS10W5labelColor,)),
                                        SizedBox(height: 1.h,),
                                        Center(child: Text("Cardio Specialist",style: FontTextStyle.poppinsS8W5labelColor,)),





                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 3.w,),
                              ],
                            );
                          }),
                        ),
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
