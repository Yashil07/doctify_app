import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';


import 'package:sizer/sizer.dart';
import '../../Utils/fontFamily_utils.dart';
import '../Auth/successfully_changed.dart';
import '../customeWidgets/custom_appbar.dart';
import '../customeWidgets/custom_btn.dart';
import '../customeWidgets/custom_text_field.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({Key? key}) : super(key: key);

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.whiteColor,
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize:Size.fromHeight(50),
            child: CustomAppBar(title: "Patient Details"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  const CustomTextField(
                    fieldName: "Full Name",
                    hintName: "Full Name",
                  ),
                  SizedBox(height: 2.h),
                  const CustomTextField(
                    fieldName: "Age",
                    hintName: "Age",
                  ),
                  SizedBox(height: 2.h),
                  const CustomTextField(
                    fieldName: "Phone Number",
                    hintName: "Phone Number",
                  ),
                  SizedBox(height: 2.h),
                  const CustomTextField(
                    fieldName: "Gender",
                    hintName: "Gender",
                  ),
                  SizedBox(height: 2.h),
                  const CustomTextField(
                    fieldName: "Write your problem",
                    hintName: "Write your problem",
                  ),
                  SizedBox(height: 10.h),
                  CustomButton(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>  SuccessfullChanged()));},
                    buttonText: "Next",
                    textStyle: FontTextStyle.poppinsS14W4WhiteColor,
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
