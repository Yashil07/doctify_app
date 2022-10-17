import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project/Views/home/BottomNavBar.dart';
import 'package:project/Views/home/write_review_screen.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../customeWidgets/custom_btn.dart';
import '../customeWidgets/custom_text_field.dart';

class MessagingEnd extends StatefulWidget {
  final String? doctorImg;
  final String? doctorName;
  const MessagingEnd({Key? key, this.doctorImg, this.doctorName}) : super(key: key);

  @override
  State<MessagingEnd> createState() => _MessagingEndState();
}

class _MessagingEndState extends State<MessagingEnd> {
  final TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(
          body:SingleChildScrollView(
            child: Center(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                    ),
                    Text("Call Ended",style: FontTextStyle.poppinsS12W7labelColor),
                    SizedBox(height: 2.h,),

                    // ClipRRect(
                    //     borderRadius: BorderRadius.circular(100),
                    //
                    //     child: Image.asset(ImageUtils.doctorImage,fit: BoxFit.fill,
                    //       height: 170,
                    //       width: 170,)
                    // ),
                    Container(

                      height:150,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(25)),
                          shape: BoxShape.rectangle,
                          color: ColorUtils.skyBlueColor,
                          image: DecorationImage(image: NetworkImage(widget.doctorImg!),fit: BoxFit.cover)
                        //more than 50% of width makes circle
                      ),


                      // child:data.userModel?.profileImg != null && data.userModel?.profileImg != "" ?
                      // Image.network("${data.userModel?.profileImg}", fit: BoxFit.contain,) : Image.asset(ImageUtils.profileAvtar),
                    ),
                    SizedBox(height: 2.h,),
                    Text(widget.doctorName!,style: FontTextStyle.poppinsS14W4PrimaryColor),
                    SizedBox(height: 5.h,),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: CustomButton(
                    //     onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const WriteReview(doctorName:widget.doctorName,doctorImg:widget.doctorImg,)));},
                    //     buttonText: "Write a Review",
                    //     textStyle: FontTextStyle.poppinsS14W4WhiteColor,
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: CustomButton(
                    //     onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavBar()));},
                    //     buttonText: "Go to Dashboard",
                    //     textStyle: FontTextStyle.poppinsS14W4PrimaryColor,
                    //     btnColor: ColorUtils.whiteColor,
                    //   ),
                    // ),
                    Text("How was your experience with ",style: FontTextStyle.poppinsS12W7labelColor),

                    SizedBox(height: 2.h),
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: ColorUtils.primaryColor,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(height: 2.h),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          CustomTextField(
                            fieldName: "Write a comment",
                            hintName: "Tell People about your experience",
                            fieldController: _commentController,
                            contentPadding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 1.h),
                            maxLines: 4,
                          ),
                          SizedBox(height: 5.h,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomButton(
                              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavBar()));},
                              buttonText: "Submit Review",
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
        ),
      ),
    );
  }
}
