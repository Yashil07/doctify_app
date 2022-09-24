import 'package:flutter/material.dart';

import 'package:project/Utils/image_utils.dart';
import 'package:project/Views/customeWidgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorUtils.whiteColor,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(150),
              child: Container(
               // color: ColorUtils.darkGreyColor,
                child: Padding(
                  padding: EdgeInsets.only(left: 15,right: 15,bottom: 15,top: 15),
                  child: Column(
                    children: [
                      Row(
                      children: [
                        Image.asset(ImageUtils.logoImage,height: 7.h,width: 13.w),
                        SizedBox(width: 3.w,),
                        Text("Doctify",style: FontTextStyle.poppinsS10W5labelColor,),
                        SizedBox(width: 22.w,),
                        Container(
                          height:45,
                          width: 45,
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
                        SizedBox(width: 5.w,),
                        Container(
                          height:45,
                          width: 45,
                          decoration: BoxDecoration(
                              color: ColorUtils.skyBlueColor,
                              borderRadius: BorderRadius.circular(10)
                            //more than 50% of width makes circle
                          ),
                          child: Center(
                            child: Icon(
                              Icons.notifications_sharp,
                              size: 30,
                              color: ColorUtils.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                      SizedBox(height: 0.5.h,),
                      CustomTextField(
                        hintName: "Search",
                        suffixIcon: Icon(Icons.search),
                      )

                    ],


                  ),
                ),

          )),
          body: SingleChildScrollView(
            child: Column(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 3.w),child: Column(
                    children: [
                      SizedBox(height: 3.w,),
                      Text("data"),
                    ],
                  ),),

                  Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(10, (index){
                          return Row(
                            children: [
                              Container(
                                color: Colors.lightGreen,
                                child: Text("Home Page Demo!"),
                              ),
                              SizedBox(width: 3.w,),
                            ],
                          );
                        }),
                      ),
                    ),
                  )
                ],
              ),


          ),
        ),
      ),

    );
  }
}
