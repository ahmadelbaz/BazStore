import 'package:baz_store_new/core/veiw_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: ElevatedButton(
                onPressed: () {
                  controller.signOut();
                },
                child: const Text('Sign Out')),
          ),
        );
      },
    );
  }
}
