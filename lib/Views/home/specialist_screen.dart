import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../customeWidgets/custom_appbar.dart';

class SpecialistScreen extends StatefulWidget {
  const SpecialistScreen({Key? key}) : super(key: key);

  @override
  State<SpecialistScreen> createState() => _SpecialistScreenState();
}

class _SpecialistScreenState extends State<SpecialistScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child:  SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
              preferredSize:Size.fromHeight(80),
              child: CustomAppBar(title: "Specialist Doctor",)
          ),
          body:SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height:170,
                        width: 160,
                        decoration: BoxDecoration(
                            color: ColorUtils.pinkColor,
                            borderRadius: BorderRadius.circular(10)

                          //more than 50% of width makes circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 10,top: 20,right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImageUtils.cardioImage,height: 5.h,),
                              SizedBox( height: 2.5.h,),

                              Padding(
                                padding: const EdgeInsets.only(left: 20,right: 8,top: 4,bottom: 5),
                                child: Text("Cardio Specialist", style: FontTextStyle.poppinsS14W4WhiteColor,),
                              ),
                            ],
                          ),
                        ),

                      ),
                      Container(
                        height:170,
                        width: 160,
                        decoration: BoxDecoration(
                            color: ColorUtils.primaryColor,
                            borderRadius: BorderRadius.circular(10)


                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,bottom: 10,top: 20,right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImageUtils.toothImage,height: 5.h,),
                              SizedBox( height: 2.5.h,),

                              Padding(
                                padding: const EdgeInsets.only(left: 25,right: 8,top: 4,bottom: 5),
                                child: Center(child: Text("Dental Specialist", style: FontTextStyle.poppinsS14W4WhiteColor,)),
                              ),
                            ],
                          ),
                        ),

                      ),
                    ],
                  ),SizedBox(height: 2.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height:170,
                        width: 160,
                        decoration: BoxDecoration(
                            color: ColorUtils.yellowColor,
                            borderRadius: BorderRadius.circular(10)

                          //more than 50% of width makes circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 10,top: 20,right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImageUtils.eyeImage,height: 5.h,),
                              SizedBox( height: 2.5.h,),

                              Padding(
                                padding: const EdgeInsets.only(left: 20,right: 8,top: 4,bottom: 5),
                                child: Text("Eye Specialist", style: FontTextStyle.poppinsS14W4WhiteColor,),
                              ),
                            ],
                          ),
                        ),

                      ),
                      Container(
                        height:170,
                        width: 160,
                        decoration: BoxDecoration(
                            color: ColorUtils.pinkColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,bottom: 10,top: 20,right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImageUtils.brainImage,height: 5.h,),
                              SizedBox( height: 2.5.h,),

                              Padding(
                                padding: const EdgeInsets.only(left: 25,right: 8,top: 4,bottom: 5),
                                child: Center(child: Text("Brain Specialist", style: FontTextStyle.poppinsS14W4WhiteColor,)),
                              ),
                            ],
                          ),
                        ),

                      ),
                    ],
                  ),SizedBox(height: 2.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height:170,
                        width: 160,
                        decoration: BoxDecoration(
                            color: ColorUtils.primaryColor,
                            borderRadius: BorderRadius.circular(10)

                          //more than 50% of width makes circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 10,top: 20,right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImageUtils.lipImage,height: 5.h,),

                              SizedBox( height: 2.5.h,),

                              Padding(
                                padding: const EdgeInsets.only(left: 20,right: 8,top: 4,bottom: 5),
                                child: Text("Mouth Specialist", style: FontTextStyle.poppinsS14W4WhiteColor,),
                              ),
                            ],
                          ),
                        ),

                      ),
                      Container(
                        height:170,
                        width: 160,
                        decoration: BoxDecoration(
                            color: ColorUtils.yellowColor,
                            borderRadius: BorderRadius.circular(10)


                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,bottom: 10,top: 20,right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImageUtils.childImage,height: 5.h,),
                              SizedBox( height: 2.5.h,),

                              Padding(
                                padding: const EdgeInsets.only(left: 25,right: 8,top: 4,bottom: 5),
                                child: Center(child: Text("Child Specialist", style: FontTextStyle.poppinsS14W4WhiteColor,)),
                              ),
                            ],
                          ),
                        ),

                      ),
                    ],
                  ),SizedBox(height: 2.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height:170,
                        width: 160,
                        decoration: BoxDecoration(
                            color: ColorUtils.pinkColor,
                            borderRadius: BorderRadius.circular(10)

                          //more than 50% of width makes circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 10,top: 20,right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImageUtils.nerveImage,height: 5.h,),
                              SizedBox( height: 2.5.h,),

                              Padding(
                                padding: const EdgeInsets.only(left: 20,right: 8,top: 4,bottom: 5),
                                child: Text("Nerve Specialist", style: FontTextStyle.poppinsS14W4WhiteColor,),
                              ),
                            ],
                          ),
                        ),

                      ),
                      Container(
                        height:170,
                        width: 160,
                        decoration: BoxDecoration(
                            color: ColorUtils.primaryColor,
                            borderRadius: BorderRadius.circular(10)


                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,bottom: 10,top: 20,right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImageUtils.sexImage,height: 5.h,),
                              SizedBox( height: 2.5.h,),

                              Padding(
                                padding: const EdgeInsets.only(left: 25,right: 8,top: 4,bottom: 5),
                                child: Center(child: Text("Sex Specialist", style: FontTextStyle.poppinsS14W4WhiteColor,)),
                              ),
                            ],
                          ),
                        ),

                      ),
                    ],
                  ),SizedBox(height: 2.h,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}