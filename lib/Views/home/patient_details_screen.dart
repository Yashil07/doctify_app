import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/const_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../customeWidgets/custom_appbar.dart';
import '../customeWidgets/custom_btn.dart';
import '../customeWidgets/custom_text_field.dart';
import 'appointment_details.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({Key? key}) : super(key: key);

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _problemController = TextEditingController();

  String genderInitialValue = 'Male';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: const Text('Profile Page',
          //       style: TextStyle(color: Colors.black54)),
          //   leading: const BackButton(color: Colors.black54),
          //   backgroundColor: ColorUtils.appBgColor,
          //   elevation: 3,
          // ),
          appBar: PreferredSize(
            preferredSize:Size.fromHeight(50),
            child: CustomAppBar(title: "Patient Details",),),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(
                    height: 3.h,
                  ),

                  CustomTextField(
                    fieldName: "Full Name",
                    hintName: "Enter Your Full Name",
                    fieldController: _nameController,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextField(
                    fieldName: "Age",
                    hintName: "Enter Your Age",
                    fieldController: _ageController,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextField(
                    suffixIcon: Icon(Icons.phone),
                    fieldName: "Phone Number",
                    hintName: "Enter Your Number",
                    fieldController: _phoneController,
                    keyboard: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text("Gender",style: FontTextStyle.poppinsS12W5labelColor),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 12.7.w,
                    padding: EdgeInsets.only(
                        left: 4.w, right: 3.w, bottom: 1.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorUtils.lightGreyColor),
                      color: ColorUtils.whiteColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: DropdownButton(
                      iconEnabledColor: ColorUtils.grey,
                      style: TextStyle(
                          color: ColorUtils.grey, fontSize: 16),
                      dropdownColor: ColorUtils.whiteColor,
                      focusColor: ColorUtils.grey,
                      elevation: 0,
                      underline: SizedBox(),
                      value: genderInitialValue,
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: gender.map((String items) {
                        return DropdownMenuItem(
                          child: Text(
                            '${items}',
                            style: FontTextStyle
                                .poppinsS12W5labelColor,
                          ),
                          value: items != null ? items : "",
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          genderInitialValue = value!;
                          print(value);
                          // genderValue = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextField(
                    fieldName: "Write Your Problem",
                    hintName: "Tell doctor about your problem",
                    contentPadding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 1.h),
                    fieldController: _problemController,
                    maxLines: 4,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),

                  CustomButton(

                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>AppointmentDetails()));},
                    buttonText: "Next",
                    textStyle: FontTextStyle.poppinsS14W4WhiteColor,
                  ),
                  SizedBox(
                    height: 5.h,
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
