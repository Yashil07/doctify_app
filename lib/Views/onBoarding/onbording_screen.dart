import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/image_utils.dart';
import 'package:project/Views/onBoarding/onbording1_screen.dart';
import 'package:project/Views/onBoarding/onboarding2_screen.dart';
import 'package:project/Views/onBoarding/onbording3_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Utils/fontFamily_utils.dart';
import '../../Utils/variable_utils.dart';
import '../Auth/login_screen.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({Key? key}) : super(key: key);

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  final PageController _controller= PageController();
  bool onLastPage =false;

  @override

  Widget build(BuildContext context) {
    return Scaffold(


      body:SafeArea(



      child: Expanded(
        child: Stack(


          children:[

              PageView(
              controller: _controller,
              onPageChanged: (index){
                setState(() {
                  onLastPage=(index == 2);
                });
              } ,
              children: const [

               OnBording1Screen(),
                OnBording2Screen(),
                OnBording3Screen(),

              ],//children

          ),

            // dot indicator
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 4.h),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.h, bottom: 7.h),
                    child: Column(


                      children: [

                        // SizedBox(height: 4.h,),

                        Image.asset(ImageUtils.mainLogoImage,height: 9.h,),

                        Expanded(child: SizedBox()),
                        Column(
                          children: [
                            onLastPage
                                ? Container( decoration: BoxDecoration(color: ColorUtils.primaryColor,borderRadius: BorderRadius.all(Radius.circular(15))),

                                // height: 6.5.h,
                                // width: 70.w,
                                // alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 3.w, bottom: 3.w, left: 25.w, right: 25.w,),

                                child: GestureDetector(
                                    child: Text(VariableUtils.getStarted,style: FontTextStyle.poppinsS14W4WhiteColor,),
                                    onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));}
                                )
                            )
                            :Container(

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //skip
                                  GestureDetector(
                                    onTap: (){
                                      _controller.jumpToPage(2);
                                    },
                                      child: Text(VariableUtils.skip,style: FontTextStyle.poppinsS14W4PrimaryColor),

                                  ),


                                  SmoothPageIndicator(controller: _controller, count:3 ),
                                  //next


                                    Container( decoration: BoxDecoration(color: ColorUtils.primaryColor,borderRadius: BorderRadius.all(Radius.circular(12))),
                                      padding: EdgeInsets.only(top: 2.w, bottom: 2.w, left: 7.w, right: 7.w,),
                                      child: GestureDetector(
                                          child: Text(VariableUtils.next,style: FontTextStyle.poppinsS14W4WhiteColor,),
                                          onTap: () {
                                            _controller.nextPage(
                                                duration: const Duration(microseconds: 500),
                                                curve: Curves.easeIn);
                                          }
                                      )
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

         ],//children
        ),
      ),
    ),
    );
  }
}
