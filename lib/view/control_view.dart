import 'package:baz_store_new/core/veiw_model/auth_view_model.dart';
import 'package:baz_store_new/view/auth/auth_screen.dart';
import 'package:baz_store_new/view/home_view.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? HomeView()
          : AuthScreen();
    });
  }
}
