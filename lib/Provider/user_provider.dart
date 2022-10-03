
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../model/user_model.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class UserProvider extends ChangeNotifier {
  UserModel? userModel;

  get getCurrentUser => userModel;
  setUserModel(UserModel currentModel) {
    userModel = currentModel;
    notifyListeners();
  }

  // GET UID
  Future<String> getCurrentUID() async {
    return (await auth.currentUser!).uid;
  }

  // GET CURRENT USER
  Future getCurrentUserData() async {
    return await auth.currentUser!;
  }
}