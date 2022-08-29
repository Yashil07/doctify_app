import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/fontFamily_utils.dart';
import 'package:project/Utils/image_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:project/Views/onBoarding/onbording3_screen.dart';

import '../../Utils/variable_utils.dart';


class OnBording2Screen extends StatefulWidget {
  const OnBording2Screen({Key? key}) : super(key: key);

  @override
  State<OnBording2Screen> createState() => _OnBording2ScreenState();
}

class _OnBording2ScreenState extends State<OnBording2Screen> {
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
                        SizedBox(height: 15.h,),
                        // Image.asset(ImageUtils.mainLogoImage,height: 8.h,),
                        SizedBox(height: 5.h,),
                        // SvgPicture.asset(ImageUtils.obs2Image,height: 25.h,),
                        Lottie.asset(ImageUtils.oba2gif,height: 30.h),
                        SizedBox(height: 5.h,),
                        Padding(
                          padding:  EdgeInsets.only(left: 3.h,right: 3.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(VariableUtils.chatWithDoctor,style: FontTextStyle.poppinsS24W7PrimaryColor,),
                              SizedBox(height: 2.h,),

                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 5.h,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(VariableUtils.obs2Text,style: FontTextStyle.poppinsS18W4GrayColor,),

                            ],
                          ),
                        ),
                        SizedBox(height: 4.h,),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //
                        //
                        //
                        //     Container(height: 3.h,width: 2.w,decoration: BoxDecoration(shape: BoxShape.circle,color: ColorUtils.lightGreyColor),child:Text(""),),
                        //     SizedBox(width: 1.h,),
                        //     Container(width: 6.w,height: 1.h,decoration: BoxDecoration(color: ColorUtils.primaryColor,borderRadius: BorderRadius.all(Radius.circular(12))),child: Text(""),),
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
                //          child: GestureDetector(
                //            child: Text(VariableUtils.next,style: FontTextStyle.poppinsS14W4WhiteColor,),
                //             onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => OnBording3Screen()));}
                //           ),)
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



