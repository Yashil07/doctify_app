import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project/Views/home/patient_details_screen.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../../Utils/image_utils.dart';
import '../customeWidgets/custom_appbar.dart';
import '../customeWidgets/custom_btn.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({Key? key}) : super(key: key);

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  final TextEditingController dateInput = TextEditingController();
  final TextEditingController _appointmentController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  String  aDate = "";
  String  pickUpTime = "";
  String _selectedPickUpTime = "";
  String _showTime = "";

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
    child: SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            title: "Book Appointment",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 5.h),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Select Appointment Date",style: FontTextStyle.poppinsS12W7labelColor),
                          SizedBox(height: 2.h),
                          GestureDetector(
                            onTap: () {
                              _openBirthDatePicker(context);

                            },
                            child: Container(
                              width: double.infinity,
                              height: 12.7.w,
                              padding:
                              EdgeInsets.only(left: 4.w, right: 4.w, bottom: 1.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: ColorUtils.lightGreyColor),
                                color: ColorUtils.whiteColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  aDate != null && aDate != ""
                                      ? Text("$aDate",
                                      style: FontTextStyle.poppinsS12W5labelColor)
                                      : Text("Select Appointment Date",
                                      style:
                                      FontTextStyle.poppinsS14W4LightGreyColor),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: ColorUtils.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 4.h),
                          Text("Select Appointment Time",style: FontTextStyle.poppinsS12W7labelColor),
                          SizedBox(height: 2.h),
                          GestureDetector(
                            onTap: () {
                              _openPickUpTimePicker(context);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 12.7.w,
                              padding:
                              EdgeInsets.only(left: 4.w, right: 4.w, bottom: 1.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: ColorUtils.lightGreyColor),
                                color: ColorUtils.whiteColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  pickUpTime != null && pickUpTime != ""
                                      ? Text("$pickUpTime",
                                      style: FontTextStyle.poppinsS12W5labelColor)
                                      : Text("Select Appointment Time",
                                      style:
                                      FontTextStyle.poppinsS14W4LightGreyColor),

                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: ColorUtils.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(

                      height:100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ColorUtils.appBgColor,
                          border: Border.all(color: ColorUtils.lightGreyColor),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding:  EdgeInsets.only(left:5.w,right: 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height:60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: ColorUtils.skyBlueColor,
                                  borderRadius: BorderRadius.circular(20)
                                //more than 50% of width makes circle
                              ),
                              child:  Center(
                                child: Icon(
                                  Icons.message,
                                  size: 30,
                                  color: ColorUtils.primaryColor,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Messaging",style: FontTextStyle.poppinsS12W5labelColor,),
                                SizedBox(height: 1.h),
                                Text("Can Message With Doctor",style: FontTextStyle.poppinsS8W5labelColor,),
                              ],
                            ),
                            Text("₹500",style: FontTextStyle.poppinsS14W4PrimaryColor,),


                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Container(

                      height:100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ColorUtils.appBgColor,
                          border: Border.all(color: ColorUtils.lightGreyColor),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding:  EdgeInsets.only(left:5.w,right: 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height:60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: ColorUtils.skyBlueColor,
                                  borderRadius: BorderRadius.circular(20)
                                //more than 50% of width makes circle
                              ),
                              child:  Center(
                                child: Icon(
                                  Icons.call,
                                  size: 30,
                                  color: ColorUtils.primaryColor,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Voice Call",style: FontTextStyle.poppinsS12W5labelColor,),
                                SizedBox(height: 1.h),
                                Text("Can Voice Call With Doctor",style: FontTextStyle.poppinsS8W5labelColor,),
                              ],
                            ),
                            Text("₹1000",style: FontTextStyle.poppinsS14W4PrimaryColor,),


                          ],
                        ),
                      ),
                    ),
                    SizedBox(height:2.h),
                    Container(

                      height:100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ColorUtils.appBgColor,
                          border: Border.all(color: ColorUtils.lightGreyColor),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding:  EdgeInsets.only(left:5.w,right: 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height:60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: ColorUtils.skyBlueColor,
                                  borderRadius: BorderRadius.circular(20)
                                //more than 50% of width makes circle
                              ),
                              child:  Center(
                                child: Icon(
                                  Icons.video_call,
                                  size: 30,
                                  color: ColorUtils.primaryColor,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Video Call",style: FontTextStyle.poppinsS12W5labelColor,),
                                SizedBox(height: 1.h),
                                Text("Can Video Call With Doctor",style: FontTextStyle.poppinsS8W5labelColor,),
                              ],
                            ),
                            Text("₹1500",style: FontTextStyle.poppinsS14W4PrimaryColor,),


                          ],
                        ),
                      ),
                    ),
                    SizedBox(height:3.h),
                    Padding(
                      padding: const EdgeInsets.only(right:5.0),
                      // child: CustomButton(
                      //   onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>BookAppointment()));},
                      //   buttonText: "Confirm",
                      //   textStyle: FontTextStyle.poppinsS14W4WhiteColor,
                      // ),
                      child:CustomButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PatientDetails(
                                      appointmentDate: aDate.toString(),
                                      appointmentTime: pickUpTime.toString(),
                                    )));
                            //  clearField();

                          }
                        },
                        buttonText: "Confirm",
                        textStyle: FontTextStyle.poppinsS14W4WhiteColor,
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    ),
    );
  }
  /////////////////////////////BIRTH DATE//////////////////////
  Future<void> _openBirthDatePicker(BuildContext context) async {
    final _initialDate = DateTime.now();

    final _newDate = await showDatePicker(


        context: context,
        initialDate: _initialDate,
        firstDate: DateTime.now().subtract(Duration(days: 0)),
        lastDate: DateTime(DateTime.now().year +1));

    if (_newDate != null) {
      setState(() {
        aDate = "${_newDate.month}-${_newDate.day}-${_newDate.year}";
        // aDate="DateFormat.yMMMMd('${_newDate.month}-${_newDate.day}-${_newDate.year}')";


      });
    }
  }
  Future<void> _openPickUpTimePicker(BuildContext context) async {

    final TimeOfDay? t =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (t != null) {
      setState(() {
        _selectedPickUpTime = "${t.hour}:${t.minute}";
        DateTime? inputDate;
        _showTime = _selectedPickUpTime;

        if (_showTime != "") {
          DateTime parseDate = new DateFormat("hh:mm").parse(_showTime);
          inputDate = DateTime.parse(parseDate.toString());
          var outputFormat = DateFormat('hh:mm a');
          pickUpTime = outputFormat.format(inputDate);

        }
      });
    }
  }
}
