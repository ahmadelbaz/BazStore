import 'dart:developer';

import 'package:baz_store_new/core/veiw_model/auth_view_model.dart';
import 'package:baz_store_new/view/auth/register_screen.dart';
import 'package:baz_store_new/view/widgets/custom_logo.dart';
import 'package:baz_store_new/view/widgets/custom_social_button.dart';
import 'package:baz_store_new/view/widgets/custom_text.dart';
import 'package:baz_store_new/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class AuthScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
      ),
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            const CustomLogo(),
            SizedBox(
              height: _size.height * 0.02,
            ),
            Center(child: CustomText('Login', _size.height * 0.03)),
            SizedBox(
              height: _size.height * 0.03,
            ),
            CustomTextField('Enter your email', Icons.email, 'E-mail is empty',
                (value) {
              controller.email = value;
            }, (value) {
              if (value == null) {
                print("ERROR");
              }
            }),
            SizedBox(
              height: _size.height * 0.03,
            ),
            CustomTextField(
                'Enter your password', Icons.lock, 'Password is empty',
                (value) {
              controller.password = value;
            }, (value) {
              if (value == null) {
                print("ERROR");
              }
            }),
            SizedBox(
              height: _size.height * 0.06,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _size.width * 0.2),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(_size.height * 0.07),
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  _globalKey.currentState!.save();
                  if (_globalKey.currentState!.validate()) {
                    //do something
                    controller.signInWithEmailAndPassword();
                  }
                },
                child: CustomText('Login', _size.height * 0.02,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: _size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText('Don\'t have an account ? ', _size.height * 0.02,
                    color: Colors.white),
                // GestureDetector(
                //     onTap: () {
                //       log('go to sign up screen');
                //       Get.to(RegisterScreen());
                //     },
                //     child: CustomText(
                //         'Sign Up', _size.height * 0.02, Colors.blue)),
                TextButton(
                  onPressed: () {
                    Get.to(() => RegisterScreen());
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: _size.height * 0.02),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _size.height * 0.04,
            ),
            Center(
              child: CustomText('-OR-', _size.height * 0.02),
            ),
            SizedBox(
              height: _size.height * 0.02,
            ),
            CustomSocialButton(
              'assets/images/icons/google.png',
              'Sign in with Google',
              () {
                controller.googleSignInMethod();
              },
            ),
          ],
        ),
      ),
    );
  }
}
