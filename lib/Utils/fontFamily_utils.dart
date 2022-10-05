// FONT FAMILY
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import 'color_utils.dart';

const String popinsFamily = "Poppins";


//FONT WEIGHT

class FontWeightClass {
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiB = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraB = FontWeight.w800;
  static const black = FontWeight.w900;
}

/// FONT TEXT STYLE

class FontTextStyle {
  // Title
  static TextStyle poppinsS24W7PrimaryColor = TextStyle(
      fontFamily:popinsFamily,
      fontSize: 24.sp,
      color: ColorUtils.primaryColor,
      fontWeight: FontWeightClass.bold);

  static TextStyle poppinsS14W4PrimaryColor =
  poppinsS24W7PrimaryColor.copyWith(fontSize: 12.sp,fontWeight: FontWeightClass.regular);

  static TextStyle poppinsS14W4WhiteColor =
  poppinsS14W4PrimaryColor.copyWith(color: ColorUtils.whiteColor);

  static TextStyle poppinsS18W4GrayColor = TextStyle(
      fontFamily:popinsFamily,
      fontSize: 14.sp,
      color: ColorUtils.blackColor,
      fontWeight: FontWeightClass.regular);



  static TextStyle poppinsS20W7PrimaryColor = TextStyle(
      fontFamily:popinsFamily,
      fontSize: 20.sp,
      color: ColorUtils.primaryColor,
      fontWeight: FontWeightClass.bold);
  static TextStyle poppinsS12W5labelColor = TextStyle(
      fontFamily:popinsFamily,
      fontSize: 13.sp,
      color: ColorUtils.labelColor,
      fontWeight: FontWeightClass.medium);
  static TextStyle poppinsS14W4LightGreyColor =
  poppinsS12W5labelColor.copyWith(color: ColorUtils.lightGreyColor);

  static TextStyle poppinsS14W4DarkGreyColor =
  poppinsS12W5labelColor.copyWith(color: ColorUtils.darkGreyColor);

  static TextStyle poppinsS10W5labelColor =
  poppinsS12W5labelColor.copyWith(fontSize: 11.sp);

  static TextStyle poppinsS8W5labelColor =
  poppinsS12W5labelColor.copyWith(fontSize: 9.sp);

  static TextStyle poppinsS12W7labelColor =
  poppinsS12W5labelColor.copyWith(fontWeight: FontWeightClass.bold);

  static TextStyle poppinsS20W4PrimaryColor =
  poppinsS24W7PrimaryColor.copyWith(fontSize: 20.sp,fontWeight: FontWeightClass.bold);

  static TextStyle poppinsS16W4GrayColor =
  poppinsS18W4GrayColor.copyWith(fontSize: 16.sp);

}
