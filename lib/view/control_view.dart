import 'package:baz_store_new/core/veiw_model/auth_view_model.dart';
import 'package:baz_store_new/core/veiw_model/control_view_model.dart';
import 'package:baz_store_new/view/auth/auth_screen.dart';
import 'package:baz_store_new/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class ControlView extends GetWidget<AuthViewModel> {
  Widget currentScreen = const HomeView();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return (Get.find<AuthViewModel>().user == null)
            ? AuthScreen()
            : GetBuilder<ControlViewModel>(
                init: ControlViewModel(),
                builder: (controller) {
                  return Scaffold(
                    body: controller.currentScreen,
                    bottomNavigationBar: bottomNavigationBar(),
                  );
                },
              );
      },
    );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find<ControlViewModel>(),
      builder: (controller) => BottomNavigationBar(
        items: [
          bottomNavigationBarItem(
              'Explore', 'assets/images/icons/Icon_Explore.png'),
          bottomNavigationBarItem('Cart', 'assets/images/icons/Icon_Cart.png'),
          bottomNavigationBarItem('User', 'assets/images/icons/Icon_User.png'),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(
      String name, String imageName) {
    return BottomNavigationBarItem(
      activeIcon: Text(name),
      label: '',
      icon: Image.asset(
        imageName,
        fit: BoxFit.contain,
        width: deviceSize.width * 0.055,
      ),
    );
  }
}
