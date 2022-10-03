import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Views/customeWidgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../customeWidgets/custom_btn.dart';
import 'home_screen.dart';

class AboutDoctor extends StatefulWidget {
  const AboutDoctor({Key? key}) : super(key: key);

  @override
  State<AboutDoctor> createState() => _AboutDoctorState();
}

class _AboutDoctorState extends State<AboutDoctor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Dr Jenny Wilson'),
              backgroundColor: ColorUtils.primaryColor,
            leading: BackButton(),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.favorite_sharp),
                tooltip: 'Add to Favourite',
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.share),
                tooltip: 'Share',
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 2.h),
                Padding(
                  padding: const EdgeInsets.only(left: 5,right:10),
                  child: Container(
                    height:140,
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
                              borderRadius: BorderRadius.only(topLeft:Radius.circular(15), bottomLeft: Radius.circular(15)),

                              child: Image.asset(ImageUtils.doctorImage,fit: BoxFit.fill,
                                height: 140,
                                width: 110.0,)
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
                        ],
                      ),
                    ),
                  ),
                ),
               SizedBox(height: 5.h),
               Padding(
                 padding: const EdgeInsets.only(left: 20.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("About Doctor",style: FontTextStyle.poppinsS16W5labelColor),
                     SizedBox(height: 1.h),
                     Text("Dr. Jenny Wilson is the top most Cardiologist specialist in Apple Hospital at London. She achived several awards for herwonderful contribution in medical field. She is available forprivate consultation.",style: FontTextStyle.poppinsS12W5labelColor,),
                     SizedBox(height:3.h),
                     Text("Working Time",style: FontTextStyle.poppinsS16W5labelColor),
                     SizedBox(height:1.h),
                     Text("Mon-Fri,09.00AM - 20.00PM",style: FontTextStyle.poppinsS12W5labelColor,),
                     SizedBox(height:3.h),
                     Text("Make Appointment",style: FontTextStyle.poppinsS16W5labelColor),
                     SizedBox(height: 15.h),
                     Padding(
                       padding: const EdgeInsets.only(right:15.0),
                       child: CustomButton(
                         onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));},
                         buttonText: "Confirm",
                         textStyle: FontTextStyle.poppinsS14W4WhiteColor,
                       ),
                     ),
                   ],
                 ),
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
