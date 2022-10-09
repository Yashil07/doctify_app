import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../Utils/image_utils.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        alignment: Alignment.center,
        child: Lottie.asset(ImageUtils.loading, height: 20.w),
      ),
    );
  }
}
