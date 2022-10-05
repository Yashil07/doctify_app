
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../customeWidgets/custom_btn.dart';

class SuccessfullyContactus extends StatefulWidget {
  const SuccessfullyContactus({Key? key}) : super(key: key);

  @override
  State<SuccessfullyContactus> createState() => _SuccessfullyContactusState();
}

class _SuccessfullyContactusState extends State<SuccessfullyContactus> {
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
                      padding: const EdgeInsets.only(top: 250),
                      child: Image.asset(ImageUtils.mainLogoImage,height: 90,),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text("ThankYou!",style: FontTextStyle.poppinsS20W7PrimaryColor),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text("We will contact you soon.",style: FontTextStyle.poppinsS12W5labelColor),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        onTap: () {},
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
      ),
    );
  }
}
