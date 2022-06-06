import 'package:baz_store_new/helper/local_storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../view/auth/auth_screen.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();

  signOut() {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    localStorageData.deleteUser();
    Get.offAll(() => AuthScreen());
  }
}
