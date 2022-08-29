import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../../Utils/variable_utils.dart';

class OnBording3Screen extends StatefulWidget {
  const OnBording3Screen({Key? key}) : super(key: key);

  @override
  State<OnBording3Screen> createState() => _OnBording3ScreenState();
}

class _OnBording3ScreenState extends State<OnBording3Screen> {
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
                        // SvgPicture.asset(ImageUtils.obs3Image,height: 25.h,),
                        Lottie.asset(ImageUtils.oba3gif,height: 30.h),
                        SizedBox(height: 7.h,),
                        Padding(
                          padding:  EdgeInsets.only(left: 3.h,right: 3.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(VariableUtils.liveTalk,style: FontTextStyle.poppinsS20W7PrimaryColor,),
                              SizedBox(height: 4.h,),

                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 4.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Text(VariableUtils.obs3Text,style: FontTextStyle.poppinsS18W4GrayColor,),

                            ],
                          ),
                        ),
                        SizedBox(height: 4.h,),

                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding:  EdgeInsets.only(left: 6.h,right: 6.h),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //
                //       // Text(VariableUtils.skip,style: FontTextStyle.poppinsS14W4PrimaryColor,),
                //       Container( decoration: BoxDecoration(color: ColorUtils.primaryColor,borderRadius: BorderRadius.all(Radius.circular(15))),
                //
                //           height: 6.5.h,
                //           width: 70.w,
                //           alignment: Alignment.center,
                //           // padding: EdgeInsets.only(top: 2.w, bottom: 2.w, left: 15.w, right: 7.w,),
                //
                //           child: GestureDetector(
                //               child: Text(VariableUtils.getStarted,style: FontTextStyle.poppinsS14W4WhiteColor,),
                //               onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => OnBording3Screen()));}
                //           )
                //       )
                //     ],
                //   ),
                // ),
                SizedBox(height: 7.h,),
              ],
            ),
          )
      ),
    );
  }
}
