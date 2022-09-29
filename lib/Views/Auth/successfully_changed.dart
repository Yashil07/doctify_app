import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/fontFamily_utils.dart';
import 'package:project/Utils/image_utils.dart';
import 'package:sizer/sizer.dart';

import '../customeWidgets/custom_btn.dart';
import '../home/home_screen.dart';

class SuccessfullChanged extends StatefulWidget {
  const SuccessfullChanged({Key? key}) : super(key: key);

  @override
  State<SuccessfullChanged> createState() => _SuccessfullChangedState();
}

class _SuccessfullChangedState extends State<SuccessfullChanged> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.whiteColor,
      child: SafeArea(
        child: Scaffold(
          body:Center(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Image.asset(ImageUtils.mainLogoImage,height: 90,),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text("Congrats !",style: FontTextStyle.poppinsS20W7PrimaryColor),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text("Your account is ready to use",style: FontTextStyle.poppinsS12W5labelColor),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));},
                      buttonText: "Go to homepage",
                      textStyle: FontTextStyle.poppinsS14W4WhiteColor,
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
