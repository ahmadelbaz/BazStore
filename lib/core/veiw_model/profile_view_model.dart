import 'package:baz_store_new/helper/local_storage_data.dart';
import 'package:baz_store_new/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../view/auth/auth_screen.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();

  UserModel get userModel => _userModel;
  UserModel _userModel = UserModel(email: '', name: '', pic: '', userId: '');

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  void getCurrentUser() async {
    await localStorageData.getUSer.then((value) {
      _userModel = value;
    });
    update();
  }

  signOut() {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    localStorageData.deleteUser();
    Get.offAll(() => AuthScreen());
  }
}
