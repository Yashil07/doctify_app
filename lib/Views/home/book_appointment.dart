import 'package:flutter/material.dart';
import 'package:project/Utils/fontFamily_utils.dart';
import 'package:project/Views/customeWidgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({Key? key}) : super(key: key);

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize:Size.fromHeight(50),
            child: CustomAppBar(title: "Book Appointment",),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Monday,March 25 2022",style: FontTextStyle.poppinsS12W5labelColor,),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Container(
                          height: 50,
                            width: 150,
                            color: Colors.red,
                            child: Center(child: Text("Morning"))
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 50,
                            width: 150,
                            color: Colors.red,
                            child: Center(child: Text("Evening"))
                        ),
                      ],
                    )
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
