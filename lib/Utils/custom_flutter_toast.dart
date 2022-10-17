import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../utils/color_utils.dart';

class FlutterToast {
  static toast(String toast) {
    Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0x80000000),
        textColor: ColorUtils.whiteColor,
        fontSize: 10.sp);
  }
}
