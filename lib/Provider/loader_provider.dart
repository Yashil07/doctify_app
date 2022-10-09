import 'package:flutter/material.dart';

class LoaderProvider with ChangeNotifier {
  bool loader = false;
  bool signUpLoader = false;
  setLoader({required bool value}) {
    loader = value;
    notifyListeners();
  }

  // setSignUpLoader({required bool value}) {
  //   signUpLoader = value;
  //   notifyListeners();
  // }
}
