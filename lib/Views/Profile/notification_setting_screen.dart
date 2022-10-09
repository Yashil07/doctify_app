import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';

import '../../Utils/fontFamily_utils.dart';
import '../customeWidgets/custom_appbar.dart';
import '../customeWidgets/custom_btn.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({Key? key}) : super(key: key);

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool value = true;
  bool value1 = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize:Size.fromHeight(50),
            child: CustomAppBar(title: "Notification",),
          ),
          body:SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: ColorUtils.darkGreyColor),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sound",style:FontTextStyle.poppinsS12W5labelColor),

                              ],

                            ),
                            buildPlatforms(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: ColorUtils.darkGreyColor),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Vibrate",style:FontTextStyle.poppinsS12W5labelColor),
                              ],
                            ),
                            buildPlatforms1(),
                          ],
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

  Widget buildPlatforms() => Row(
    children: [
      buildHeader( child: buildIOSSwitch()),
    ],
  );
  Widget buildPlatforms1() => Row(
    children: [
      buildHeader1( child: buildIOSSwitch1()),
    ],
  );

  Widget buildHeader({
    required Widget child,
  }) =>
      Column(
        children: [
          child,
        ],
      );
  Widget buildHeader1({
    required Widget child,
  }) =>
      Column(
        children: [
          child,
        ],
      );

  Widget buildIOSSwitch() => Transform.scale(
    scale: 0.9,
    child: CupertinoSwitch(
      value: value,
      onChanged: (value) => setState(() => this.value = value),
    ),
  );
  Widget buildIOSSwitch1() => Transform.scale(
    scale: 0.9,
    child: CupertinoSwitch(
      value: value1,
      onChanged: (value) => setState(() => this.value1 = value),
    ),
  );
}

