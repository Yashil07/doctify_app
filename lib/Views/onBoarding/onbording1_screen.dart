import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/fontFamily_utils.dart';
import 'package:project/Utils/image_utils.dart';
import 'package:project/Utils/variable_utils.dart';
import 'package:project/Views/onBoarding/onboarding2_screen.dart';
import 'package:project/Views/onBoarding/onbording3_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';

class OnBording1Screen extends StatefulWidget {
  const OnBording1Screen({Key? key}) : super(key: key);

  @override
  State<OnBording1Screen> createState() => _OnBording1ScreenState();
}

class _OnBording1ScreenState extends State<OnBording1Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.appBgColor,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 7.h,),
                      // Image.asset(ImageUtils.mainLogoImage,height: 8.h,),
                      SizedBox(height: 10.h,),
                     // Lottie.network("https://assets7.lottiefiles.com/packages/lf20_zpjfsp1e.json",height: 30.h),
                        Lottie.asset(ImageUtils.oba1gif,height: 30.h,width: 85.w),
                      SizedBox(height: 10.h,),
                      Padding(
                        padding:  EdgeInsets.only(left: 3.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(VariableUtils.chooseThe,style: FontTextStyle.poppinsS24W7PrimaryColor,),
                            Text(VariableUtils.doctorYouWant,style: FontTextStyle.poppinsS24W7PrimaryColor,)
                          ],
                        ),
                      ),
                      SizedBox(height: 4.h,),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Container(width: 6.w,height: 1.h,decoration: BoxDecoration(color: ColorUtils.primaryColor,borderRadius: BorderRadius.all(Radius.circular(12))),child: Text(""),),
                      //     SizedBox(width: 1.h,),
                      //
                      //     Container(height: 3.h,width: 2.w,decoration: BoxDecoration(shape: BoxShape.circle,color: ColorUtils.lightGreyColor),child:Text(""),)
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding:  EdgeInsets.symmetric(horizontal: 5.h),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       TextButton(onPressed: (){
              //         Navigator.push(context, MaterialPageRoute(builder: (context) => OnBording3Screen()));
              //       }, child: Text(VariableUtils.skip,style: FontTextStyle.poppinsS14W4PrimaryColor,)),
              //       // Text(VariableUtils.skip,style: FontTextStyle.poppinsS14W4PrimaryColor,),
              //       Container( decoration: BoxDecoration(color: ColorUtils.primaryColor,borderRadius: BorderRadius.all(Radius.circular(12))),
              //         padding: EdgeInsets.only(top: 2.w, bottom: 2.w, left: 7.w, right: 7.w,),
              //         child: GestureDetector(
              //         child: Text(VariableUtils.next,style: FontTextStyle.poppinsS14W4WhiteColor,),
              //              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => OnBording2Screen()));}
              //           )
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(height: 7.h,),
            ],
          ),
        )
      ),
    );
  }
}
