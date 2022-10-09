import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Provider/loader_provider.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../customeWidgets/custom_appbar.dart';
import '../customeWidgets/custom_btn.dart';
import '../customeWidgets/custom_text_field.dart';
import '../customeWidgets/loader_layout.dart';
import '../customeWidgets/show_toast.dart';
import 'login_screen.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordEmailScreen> createState() => _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          color: ColorUtils.appBgColor,
          child: SafeArea(
            child: Scaffold(
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: CustomAppBar(
                  title: "Forgot Password",
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 15),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Text(
                            "Please enter your email id and we’ll send the instructions to your account",
                            style: FontTextStyle.poppinsS14W4DarkGreyColor,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          CustomTextField(
                            prefixIcon: Icon(Icons.email_outlined),
                            fieldName: "Email-Id",
                            hintName: "Enter Your Email Id",
                            keyboard: TextInputType.emailAddress,
                            validator: (str) {
                              if (str!.isEmpty) {
                                return '* Is Required';
                              } else if (!RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(str)) {
                                return '* Enter valid email-ID';
                              }
                            },
                            fieldController: _emailController,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          CustomButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                forgotPasswordData();
                              }
                            },
                            buttonText: "Confirm",
                            textStyle: FontTextStyle.poppinsS14W4WhiteColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Provider.of<LoaderProvider>(context, listen: true).loader
            ? LoaderLayoutWidget()
            : SizedBox.shrink(),
      ],
    );
  }
  forgotPasswordData() async {
    final loading = Provider.of<LoaderProvider>(context, listen: false);
    loading.setLoader(value: true);
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text);

      showToast(title: "Password Reset email has been sent !!", status: true);
      loading.setLoader(value: false);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } on FirebaseAuthException catch (e) {
      showToast(title: "${e.message}!!", status: false);
      loading.setLoader(value: false);
    }
  }
}
