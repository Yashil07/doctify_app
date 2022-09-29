import 'package:flutter/material.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Utils/fontFamily_utils.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {
  final String? hintName;
  final String? fieldName;
  final TextInputType? keyboard;

  final TextEditingController? fieldController;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final bool? readonly;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onChange;
  const CustomTextField({Key? key,this.fieldName,this.textInputAction,this.keyboard,this.readonly,this.hintName,this.fieldController,this.maxLines,this.onChange,this.validator,this.prefixIcon,this.suffixIcon,this.obscureText}) : super(key: key);

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
        TextFormField(controller: widget.fieldController,
          obscureText: widget.obscureText ?? false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          maxLines:widget.maxLines ,
          keyboardType: widget.keyboard,
          readOnly: widget.readonly ?? false,
          onChanged: widget.onChange ?? null,
          validator:widget.validator ?? null ,
          decoration:  InputDecoration(
              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),

              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(width: 1, color: ColorUtils.grey),
              //   borderRadius: BorderRadius.circular(50),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderSide: BorderSide(width: 1, color: ColorUtils.primaryColor),
              //   borderRadius: BorderRadius.circular(50),
              //
              // ),

              prefixIcon:widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              hintText:widget.hintName,
              hintStyle:FontTextStyle.poppinsS14W4LightGreyColor ,
              //border: InputBorder.none,
              fillColor: ColorUtils.aliceBlue,
              filled: true,

             // isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 4.w)),

        ),
      ],
    );
        }
      }
