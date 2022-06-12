import 'package:baz_store_new/constants.dart';
import 'package:baz_store_new/core/veiw_model/control_view_model.dart';
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
                        width: deviceSize.width * 0.33,
                        height: deviceSize.height * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.grey,
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
                  SizedBox(
                    height: deviceSize.height * 0.125,
                  ),
                  CustomListTile('Edit Profile', () {}),
                  CustomListTile('Shipping Address', () {}),
                  CustomListTile('Order History', () {}),
                  CustomListTile('Cards', () {}),
                  CustomListTile('Notifications', () {}),
                  GetBuilder<ControlViewModel>(
                    init: ControlViewModel(),
                    builder: (controller2) {
                      return CustomListTile(
                        'Log out',
                        () {
                          controller2.changeSelectedValue(0);
                          controller.signOut();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
