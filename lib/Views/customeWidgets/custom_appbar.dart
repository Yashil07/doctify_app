import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/fontFamily_utils.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatefulWidget {
  final String? title;
  final String? tooltip;
  const CustomAppBar({Key? key,this.title, this.tooltip}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child:Scaffold(

          appBar: AppBar(
            title:Text("${widget.title ?? ""}",
                style: TextStyle(color: Colors.black54)),
            actions: [
              IconButton(
                onPressed: (){},
                tooltip:"${widget.tooltip ?? ""}" ,
                icon: Icon(Icons.share),
                color: ColorUtils.primaryColor),
            ],
            leading: const BackButton(color: Colors.black54),
            backgroundColor: ColorUtils.appBgColor,
            elevation: 3,
          ),
        ),
    );
  }
}
