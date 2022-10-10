import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../customeWidgets/custom_appbar.dart';

class SelectedSpecialist extends StatefulWidget {
  final String? sid;
  const SelectedSpecialist({Key? key, this.sid}) : super(key: key);

  @override
  State<SelectedSpecialist> createState() => _SelectedSpecialistState();
}

class _SelectedSpecialistState extends State<SelectedSpecialist> {
  String sid='';
  @override
  void initState() {

    super.initState();
    if(widget.sid != null){
      sid = widget.sid!;
      print(sid);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(
          appBar:   const PreferredSize(
            preferredSize:Size.fromHeight(80),
            child: CustomAppBar(title: "Selected Specialist",),
          ),
          body: SingleChildScrollView(
            child: Column(
                children: [
                  if(sid == "Cardio")...[
                    CardioClass(),
                  ]else if(sid == "Dental")...[
                    DentalClass(),
                  ]else if(sid == "Eye")...[
                    EyeClass(),
                  ]
                ]),
          ),
        ),

      ),

    );
  }
}

///////////////////////// Cardio Class /////////////////////////////////////////
class CardioClass extends StatefulWidget {
  const CardioClass({Key? key}) : super(key: key);

  @override
  State<CardioClass> createState() => _CardioClassState();
}

class _CardioClassState extends State<CardioClass> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),

      child: Column(
        children: List.generate(4, (index) =>
            Column(
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
                              Text("Dr. Janny willson",style: FontTextStyle.poppinsS12W5labelColor,),
                              SizedBox(height: 1.h),
                              Text("Cardio Specialist",style: FontTextStyle.poppinsS8W5labelColor,),
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
              ],
            )),
      ),
    );
  }
}

///////////////////////// Dental Class /////////////////////////////////////////
class DentalClass extends StatefulWidget {
  const DentalClass({Key? key}) : super(key: key);

  @override
  State<DentalClass> createState() => _DentalClassState();
}

class _DentalClassState extends State<DentalClass> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),

      child: Column(
        children: List.generate(4, (index) =>
            Column(
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
                              Text("Dr. Janny willson",style: FontTextStyle.poppinsS12W5labelColor,),
                              SizedBox(height: 1.h),
                              Text("Dental Specialist",style: FontTextStyle.poppinsS8W5labelColor,),
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
              ],
            )),
      ),
    );
  }
}

///////////////////////// Eye Class /////////////////////////////////////////
class EyeClass extends StatefulWidget {
  const EyeClass({Key? key}) : super(key: key);

  @override
  State<EyeClass> createState() => _EyeClassState();
}

class _EyeClassState extends State<EyeClass> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),

      child: Column(
        children: List.generate(4, (index) =>
            Column(
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
                              Text("Dr. Janny willson",style: FontTextStyle.poppinsS12W5labelColor,),
                              SizedBox(height: 1.h),
                              Text("Eye Specialist",style: FontTextStyle.poppinsS8W5labelColor,),
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
              ],
            )),
      ),
    );
  }
}
