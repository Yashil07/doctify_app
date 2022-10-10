import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../customeWidgets/custom_appbar.dart';
import '../customeWidgets/custom_btn.dart';
import '../customeWidgets/custom_text_field.dart';

class WriteReview extends StatefulWidget {
  const WriteReview({Key? key}) : super(key: key);

  @override
  State<WriteReview> createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {

  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize:Size.fromHeight(50),
            child: CustomAppBar(title: "Write a Review",),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child: Column(
                children: [
                  SizedBox(height: 4.h),
                  Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),

                        child: Image.asset(ImageUtils.doctorImage,fit: BoxFit.fill,
                          height: 170,
                          width: 170,)
                    ),

                  ),
                  SizedBox(height: 2.h,),
                  Text("How was your experience with ",style: FontTextStyle.poppinsS12W7labelColor),
                  Text("Dr. Jenny Wilson",style: FontTextStyle.poppinsS14W4PrimaryColor),
                  SizedBox(height: 2.h,),

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
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: ColorUtils.lightGreyColor),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0,top: 15.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
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
                                onTap: () {},
                                buttonText: "Submit Review",
                                textStyle: FontTextStyle.poppinsS14W4WhiteColor,
                              ),
                            ),

                          ],
                        ),
                      ),
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
