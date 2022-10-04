import 'package:flutter/material.dart';
import 'package:project/Views/Profile/contactus_screen.dart';
import 'package:project/Views/Profile/privacypolicy_screen.dart';
import 'package:project/Views/Profile/terms&condition_screen.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../customeWidgets/custom_appbar.dart';

class HelpSetting extends StatefulWidget {
  const HelpSetting({Key? key}) : super(key: key);

  @override
  State<HelpSetting> createState() => _HelpSettingState();
}

class _HelpSettingState extends State<HelpSetting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.appBgColor,
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize:Size.fromHeight(50),
            child: CustomAppBar(title: "Help",),
          ),
          body:SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: ColorUtils.darkGreyColor),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Contact us",style:FontTextStyle.poppinsS12W5labelColor),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => TermAndConditionScreen()));},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: ColorUtils.darkGreyColor),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Term & Condition",style:FontTextStyle.poppinsS12W5labelColor),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()));},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: ColorUtils.darkGreyColor),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Privacy Policy",style:FontTextStyle.poppinsS12W5labelColor),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
