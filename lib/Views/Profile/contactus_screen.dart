import 'package:flutter/material.dart';
import 'package:project/Views/Profile/successfully_contactus.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../Auth/forgot_password_screen.dart';
import '../Auth/profile_screen.dart';
import '../Auth/reg_screen.dart';
import '../customeWidgets/custom_appbar.dart';
import '../customeWidgets/custom_btn.dart';
import '../customeWidgets/custom_text_field.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize:Size.fromHeight(50),
            child: CustomAppBar(title: "Contact Us",),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      children: [
                        const CustomTextField(
                          fieldName: "Full Name",
                          hintName: "Full Name",
                        ),

                        SizedBox(height: 2.h,),

                        const CustomTextField(
                          suffixIcon: Icon(Icons.email_outlined),
                          fieldName: "Email",
                          hintName: "Email",
                        ),

                        SizedBox(height: 2.h,),

                        const CustomTextField(
                          fieldName: "Message",
                          hintName: "Message",
                        ),

                        SizedBox(height: 3.h,),

                        CustomButton(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessfullyContactus()));},buttonText:"Send Message",textStyle: FontTextStyle.poppinsS14W4WhiteColor,),
                        SizedBox(height: 2.h,),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

        ),


      ),
    );
  }
}
