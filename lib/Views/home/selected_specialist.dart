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
                  ]else if(sid == "Brain")...[
                    BrainClass(),
                  ]else if(sid == "Mouth")...[
                    MouthClass(),
                  ]else if(sid == "Child")...[
                    ChildClass(),
                  ]else if(sid == "Nerve")...[
                    NerveClass(),
                  ]else if(sid == "Sex")...[
                    SexClass(),
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

///////////////////////// Eye Class ////////////////////////////////////////////

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


///////////////////////// Brain Class //////////////////////////////////////////

class BrainClass extends StatefulWidget {
  const BrainClass({Key? key}) : super(key: key);

  @override
  State<BrainClass> createState() => _BrainClassState();
}

class _BrainClassState extends State<BrainClass> {
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
                              Text("Brain Specialist",style: FontTextStyle.poppinsS8W5labelColor,),
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


///////////////////////// Mouth Class //////////////////////////////////////////

class MouthClass extends StatefulWidget {
  const MouthClass({Key? key}) : super(key: key);

  @override
  State<MouthClass> createState() => _MouthClassState();
}

class _MouthClassState extends State<MouthClass> {
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
                              Text("Mouth Specialist",style: FontTextStyle.poppinsS8W5labelColor,),
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


///////////////////////// Child Class //////////////////////////////////////////

class ChildClass extends StatefulWidget {
  const ChildClass({Key? key}) : super(key: key);

  @override
  State<ChildClass> createState() => _ChildClassState();
}

class _ChildClassState extends State<ChildClass> {
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
                              Text("Child Specialist",style: FontTextStyle.poppinsS8W5labelColor,),
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

///////////////////////// Nerve Class //////////////////////////////////////////

class NerveClass extends StatefulWidget {
  const NerveClass({Key? key}) : super(key: key);

  @override
  State<NerveClass> createState() => _NerveClassState();
}

class _NerveClassState extends State<NerveClass> {
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
                              Text("Nerve Specialist",style: FontTextStyle.poppinsS8W5labelColor,),
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

///////////////////////// Sex Class ////////////////////////////////////////////

class SexClass extends StatefulWidget {
  const SexClass({Key? key}) : super(key: key);

  @override
  State<SexClass> createState() => _SexClassState();
}

class _SexClassState extends State<SexClass> {
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
                              Text("Sex Specialist",style: FontTextStyle.poppinsS8W5labelColor,),
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
