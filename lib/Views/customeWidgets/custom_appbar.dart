import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/fontFamily_utils.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatefulWidget {
  final String? title;
  const CustomAppBar({Key? key,this.title}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child:Scaffold(
          appBar: AppBar(
            title:  Text("${widget.title ?? ""}",style: FontTextStyle.poppinsS12W5labelColor,),
            backgroundColor: ColorUtils.appBgColor,
            elevation: 0,

            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_circle_left),
                tooltip: 'Back Icon',
                onPressed: () {},
              ), //IconButton//IconButton
            ],
          ),
        ),
    );
  }
}
