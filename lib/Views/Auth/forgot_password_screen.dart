import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../customeWidgets/custom_appbar.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child:  SafeArea(
        child: Scaffold(
            appBar: PreferredSize(

              preferredSize: Size.fromHeight(7.h),
              child:CustomAppBar(title: "Forgot Password",),),
          body: SingleChildScrollView(

          ),
        ),

      ),
    );
  }
}
