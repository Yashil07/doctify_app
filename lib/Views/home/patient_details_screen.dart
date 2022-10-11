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
  final String appointmentDate;
  final String appointmentTime;
  final String doctorId;
  final String amount;
  const PatientDetails({Key? key,required this.appointmentDate, required this.appointmentTime, required this.doctorId, required this.amount}) : super(key: key);

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _problemController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();


  String genderInitialValue = 'Male';
  String appointmentDate = '';
  String appointmentTime = '';


  @override
  void initState() {
    appointmentDate= widget.appointmentDate;
    appointmentTime= widget.appointmentTime;
    _dateController.text= appointmentDate;
    _timeController.text= appointmentTime;
    print(appointmentDate);
    print(appointmentTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(

          appBar: PreferredSize(
            preferredSize:Size.fromHeight(50),
            child: CustomAppBar(title: "Patient Details",),),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Form(
                key: formKey,
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
                      validator: (str) {
                        if (str!.isEmpty) {
                          return '* Is Required';
                        }
                      }
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      fieldName: "Age",
                      hintName: "Enter Your Age",
                      keyboard: TextInputType.number,
                      fieldController: _ageController,
                        validator: (str) {
                          if (str!.isEmpty) {
                            return '* Is Required';
                          }else if(str.length > 2){
                            return 'Please Enter Valid Age';
                          }
                        }
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
                        validator: (str) {
                          if (str!.isEmpty) {
                            return '* Is Required';
                          }else if(str.length != 10){
                            return '* Phone number must be of 10 digit';
                          }
                        }
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
                      fieldName: "Appointment Date",
                      fieldController: _dateController,
                      readonly: true,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      fieldName: "Appointment Time",
                      fieldController: _timeController,
                      readonly: true,
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
                        validator: (str) {
                          if (str!.isEmpty) {
                            return '* Is Required';
                          }
                        }
                    ),
                    SizedBox(
                      height: 5.h,
                    ),

                    CustomButton(

                      onTap: (){
                        if (formKey.currentState!.validate()){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>AppointmentDetails(
                            fullname:_nameController.text,
                            age:_ageController.text,
                            phoneno:_phoneController.text,
                            gender:genderInitialValue.toString(),
                            appointmentDate:appointmentDate.toString(),
                            appointmentTime:appointmentTime.toString(),
                            doctorId:  widget.doctorId,
                            amount: widget.amount,

                          )));
                        }
                      },
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
      ),
    );
  }
}
