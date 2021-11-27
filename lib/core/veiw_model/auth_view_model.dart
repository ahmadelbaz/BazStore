import 'dart:developer';

import 'package:baz_store_new/core/services/firestore_user.dart';
import 'package:baz_store_new/model/user_model.dart';
import 'package:baz_store_new/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  String email = '', password = '', name = '';

  Rxn<User?> _user = Rxn<User>();

  String? get user => _user.value!.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  // void googleSignInMethod() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     print('this is google user $googleUser');

  //     if (googleUser != null) {
  //       GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleUser.authentication;
  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken,
  //       );

  //       await _auth.signInWithCredential(credential);
  //       // Get.offAll(HomeView());
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  void googleSignInMethod() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    log('this is google user $googleUser');

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    Get.offAll(() => HomeView());
    await FirebaseAuth.instance.signInWithCredential(credential).then((user) {
      saveUser(user, user.user!.displayName!);
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => HomeView());
    } catch (e) {
      log(e.toString());
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        saveUser(user, name);
      });

      Get.offAll(() => HomeView());
    } catch (e) {
      log(e.toString());
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user, String name) async {
    await FireStoreUser().addUserToFireStore(UserModel(
        userId: user.user!.uid, email: user.user!.email!, name: name, pic: ''));
  }
}
