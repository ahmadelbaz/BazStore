import 'package:baz_store_new/core/veiw_model/profile_view_model.dart';
import 'package:baz_store_new/view/widgets/custom_list_tile.dart';
import 'package:baz_store_new/view/widgets/custom_text.dart';
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
          body: Container(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                          image: DecorationImage(
                            image: controller.userModel.pic == null
                                ? const AssetImage(
                                    'assets/images/icons/avatar.png',
                                  )
                                : controller.userModel.pic == ''
                                    ? const AssetImage(
                                        'assets/images/icons/avatar.png',
                                      ) as ImageProvider
                                    : NetworkImage(
                                        controller.userModel.pic,
                                      ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          CustomText(
                            controller.userModel.name,
                            24,
                            color: Colors.black,
                          ),
                          CustomText(
                            controller.userModel.email,
                            16,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  CustomListTile('Edit Profile', () {}),
                  CustomListTile('Shipping Address', () {}),
                  CustomListTile('Order History', () {}),
                  CustomListTile('Cards', () {}),
                  CustomListTile('Notifications', () {}),
                  CustomListTile('Log out', () {
                    controller.signOut();
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
