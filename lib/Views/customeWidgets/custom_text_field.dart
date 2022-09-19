import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/fontFamily_utils.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {
  final String? hintName;
  final String? fieldName;
  final TextEditingController? fieldController;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  const CustomTextField({Key? key,this.fieldName,this.hintName,this.fieldController,this.prefixIcon,this.suffixIcon,this.obscureText}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.fieldName != null ?  Padding(
          padding:  EdgeInsets.symmetric(horizontal: 4.w),
          child: Text("${widget.fieldName ?? ""}",style: FontTextStyle.poppinsS12W5labelColor ,),
        ) : SizedBox(),
        SizedBox(height: 1.h,),
        Container(
          
          child: Container(
              decoration:
          BoxDecoration(color: ColorUtils.inputBoxColor,
              // border: Border.all(color: ColorUtils.lightGreyColor
              // ),

              borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: TextFormField(controller: widget.fieldController,
                obscureText: widget.obscureText ?? false,
                decoration:  InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            width: 1, color: ColorUtils.lightGreyColor)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                            width: 1, color: ColorUtils.primaryColor)),
                    prefixIcon:widget.prefixIcon,
                    suffixIcon: widget.suffixIcon,
                    hintText:widget.hintName,
                    hintStyle:FontTextStyle.poppinsS14W4LightGreyColor ,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 4.w)),

              )),
              ),
      ],
    );
        }
      }
