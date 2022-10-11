import 'package:cloud_firestore/cloud_firestore.dart';
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
                    const CardioClass(),
                  ]else if(sid == "Dental")...[
                    const DentalClass(),
                  ]else if(sid == "Eye")...[
                    const EyeClass(),
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


  static Stream<QuerySnapshot<Map<String, dynamic>>>
  FetchDoctorData() {
    Stream<QuerySnapshot<Map<String, dynamic>>> futureSnap = FirebaseFirestore
        .instance
        .collection("doctor") .where('specialist', isEqualTo: "Cardio Specialist")

        .snapshots();
    return futureSnap;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:StreamBuilder(
          stream: FetchDoctorData(),
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
                final docs = snapshot.data!.docs;

                // String docId= "${docList[0]['doctor_id']}";





                return  Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),

                  child: Column(
                    children: List.generate(length, (index) {
                      final data = docs[index].data();
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
                                        image: DecorationImage(image: NetworkImage("${data['profileImg']}"),fit: BoxFit.cover)
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
                                        Text("Dr. ${data['fullName']}",style: FontTextStyle.poppinsS12W5labelColor,),
                                        SizedBox(height: 1.h),
                                        Text("${data['specialist']}",style: FontTextStyle.poppinsS8W5labelColor,),
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
                      );
                    }

                    ),
                  ),
                );

              }


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
  static Stream<QuerySnapshot<Map<String, dynamic>>>
  FetchDoctorData() {
    Stream<QuerySnapshot<Map<String, dynamic>>> futureSnap = FirebaseFirestore
        .instance
        .collection("doctor") .where('specialist', isEqualTo: "Dental Specialist")

        .snapshots();
    return futureSnap;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:StreamBuilder(
          stream: FetchDoctorData(),
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
                final docs = snapshot.data!.docs;

                // String docId= "${docList[0]['doctor_id']}";





                return  Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),

                  child: Column(
                    children: List.generate(length, (index) {
                      final data = docs[index].data();
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
                                        image: DecorationImage(image: NetworkImage("${data['profileImg']}"),fit: BoxFit.cover)
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
                                        Text("Dr. ${data['fullName']}",style: FontTextStyle.poppinsS12W5labelColor,),
                                        SizedBox(height: 1.h),
                                        Text("${data['specialist']}",style: FontTextStyle.poppinsS8W5labelColor,),
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
                      );
                    }

                    ),
                  ),
                );

              }


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
  static Stream<QuerySnapshot<Map<String, dynamic>>>
  FetchDoctorData() {
    Stream<QuerySnapshot<Map<String, dynamic>>> futureSnap = FirebaseFirestore
        .instance
        .collection("doctor") .where('specialist', isEqualTo: "Eye Specialist")

        .snapshots();
    return futureSnap;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:StreamBuilder(
          stream: FetchDoctorData(),
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
                final docs = snapshot.data!.docs;

                // String docId= "${docList[0]['doctor_id']}";





                return  Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),

                  child: Column(
                    children: List.generate(length, (index) {
                      final data = docs[index].data();
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
                                        image: DecorationImage(image: NetworkImage("${data['profileImg']}"),fit: BoxFit.cover)
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
                                        Text("Dr. ${data['fullName']}",style: FontTextStyle.poppinsS12W5labelColor,),
                                        SizedBox(height: 1.h),
                                        Text("${data['specialist']}",style: FontTextStyle.poppinsS8W5labelColor,),
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
                      );
                    }

                    ),
                  ),
                );

              }


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
  static Stream<QuerySnapshot<Map<String, dynamic>>>
  FetchDoctorData() {
    Stream<QuerySnapshot<Map<String, dynamic>>> futureSnap = FirebaseFirestore
        .instance
        .collection("doctor") .where('specialist', isEqualTo: "Brain Specialist")

        .snapshots();
    return futureSnap;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:StreamBuilder(
          stream: FetchDoctorData(),
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
                final docs = snapshot.data!.docs;

                // String docId= "${docList[0]['doctor_id']}";





                return  Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),

                  child: Column(
                    children: List.generate(length, (index) {
                      final data = docs[index].data();
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
                                        image: DecorationImage(image: NetworkImage("${data['profileImg']}"),fit: BoxFit.cover)
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
                                        Text("Dr. ${data['fullName']}",style: FontTextStyle.poppinsS12W5labelColor,),
                                        SizedBox(height: 1.h),
                                        Text("${data['specialist']}",style: FontTextStyle.poppinsS8W5labelColor,),
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
                      );
                    }

                    ),
                  ),
                );

              }


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
  static Stream<QuerySnapshot<Map<String, dynamic>>>
  FetchDoctorData() {
    Stream<QuerySnapshot<Map<String, dynamic>>> futureSnap = FirebaseFirestore
        .instance
        .collection("doctor") .where('specialist', isEqualTo: "Mouth Specialist")

        .snapshots();
    return futureSnap;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:StreamBuilder(
          stream: FetchDoctorData(),
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
                final docs = snapshot.data!.docs;

                // String docId= "${docList[0]['doctor_id']}";





                return  Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),

                  child: Column(
                    children: List.generate(length, (index) {
                      final data = docs[index].data();
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
                                        image: DecorationImage(image: NetworkImage("${data['profileImg']}"),fit: BoxFit.cover)
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
                                        Text("Dr. ${data['fullName']}",style: FontTextStyle.poppinsS12W5labelColor,),
                                        SizedBox(height: 1.h),
                                        Text("${data['specialist']}",style: FontTextStyle.poppinsS8W5labelColor,),
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
                      );
                    }

                    ),
                  ),
                );

              }


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
  static Stream<QuerySnapshot<Map<String, dynamic>>>
  FetchDoctorData() {
    Stream<QuerySnapshot<Map<String, dynamic>>> futureSnap = FirebaseFirestore
        .instance
        .collection("doctor") .where('specialist', isEqualTo: "Child Specialist")

        .snapshots();
    return futureSnap;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:StreamBuilder(
          stream: FetchDoctorData(),
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
                final docs = snapshot.data!.docs;

                // String docId= "${docList[0]['doctor_id']}";





                return  Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),

                  child: Column(
                    children: List.generate(length, (index) {
                      final data = docs[index].data();
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
                                        image: DecorationImage(image: NetworkImage("${data['profileImg']}"),fit: BoxFit.cover)
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
                                        Text("Dr. ${data['fullName']}",style: FontTextStyle.poppinsS12W5labelColor,),
                                        SizedBox(height: 1.h),
                                        Text("${data['specialist']}",style: FontTextStyle.poppinsS8W5labelColor,),
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
                      );
                    }

                    ),
                  ),
                );

              }


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
  static Stream<QuerySnapshot<Map<String, dynamic>>>
  FetchDoctorData() {
    Stream<QuerySnapshot<Map<String, dynamic>>> futureSnap = FirebaseFirestore
        .instance
        .collection("doctor") .where('specialist', isEqualTo: "Nerve Specialist")

        .snapshots();
    return futureSnap;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:StreamBuilder(
          stream: FetchDoctorData(),
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
                final docs = snapshot.data!.docs;

                // String docId= "${docList[0]['doctor_id']}";





                return  Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),

                  child: Column(
                    children: List.generate(length, (index) {
                      final data = docs[index].data();
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
                                        image: DecorationImage(image: NetworkImage("${data['profileImg']}"),fit: BoxFit.cover)
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
                                        Text("Dr. ${data['fullName']}",style: FontTextStyle.poppinsS12W5labelColor,),
                                        SizedBox(height: 1.h),
                                        Text("${data['specialist']}",style: FontTextStyle.poppinsS8W5labelColor,),
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
                      );
                    }

                    ),
                  ),
                );

              }


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
    Stream<QuerySnapshot<Map<String, dynamic>>>
    FetchDoctorData() {
      Stream<QuerySnapshot<Map<String, dynamic>>> futureSnap = FirebaseFirestore
          .instance
          .collection("doctor") .where('specialist', isEqualTo: "Sex Specialist")

          .snapshots();
      return futureSnap;
    }
    return Container(
      child:StreamBuilder(
          stream: FetchDoctorData(),
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
                final docs = snapshot.data!.docs;

                // String docId= "${docList[0]['doctor_id']}";





                return  Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),

                  child: Column(
                    children: List.generate(length, (index) {
                      final data = docs[index].data();
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
                                        image: DecorationImage(image: NetworkImage("${data['profileImg']}"),fit: BoxFit.cover)
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
                                        Text("Dr. ${data['fullName']}",style: FontTextStyle.poppinsS12W5labelColor,),
                                        SizedBox(height: 1.h),
                                        Text("${data['specialist']}",style: FontTextStyle.poppinsS8W5labelColor,),
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
                      );
                    }

                    ),
                  ),
                );

              }


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
    );
  }
}
