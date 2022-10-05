import 'package:flutter/material.dart';
import 'package:project/Views/home/write_review_screen.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../customeWidgets/custom_btn.dart';

class MessagingEnd extends StatefulWidget {
  const MessagingEnd({Key? key}) : super(key: key);

  @override
  State<MessagingEnd> createState() => _MessagingEndState();
}

class _MessagingEndState extends State<MessagingEnd> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(
          body:Center(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                  ),
                  Text("Messaging Ended",style: FontTextStyle.poppinsS12W7labelColor),
                  SizedBox(height: 2.h,),

                  Text("30:00 Minutes",style: FontTextStyle.poppinsS14W4PrimaryColor),
                  SizedBox(height: 2.h,),

                  Text("Recordings have been saved in history",style: FontTextStyle.poppinsS12W5labelColor),
                  SizedBox(height: 2.h,),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),

                      child: Image.asset(ImageUtils.doctorImage,fit: BoxFit.fill,
                        height: 170,
                        width: 170,)
                  ),
                  SizedBox(height: 2.h,),
                  Text("Dr. Eleanor Pena",style: FontTextStyle.poppinsS12W7labelColor),
                  SizedBox(height: 5.h,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const WriteReview()));},
                      buttonText: "Write a Review",
                      textStyle: FontTextStyle.poppinsS14W4WhiteColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onTap: () {},
                      buttonText: "Go to Dashboard",
                      textStyle: FontTextStyle.poppinsS14W4PrimaryColor,
                      btnColor: ColorUtils.whiteColor,
                    ),
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
