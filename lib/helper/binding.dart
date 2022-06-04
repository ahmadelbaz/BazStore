import 'package:baz_store_new/core/veiw_model/auth_view_model.dart';
import 'package:baz_store_new/core/veiw_model/control_view_model.dart';
import 'package:baz_store_new/core/veiw_model/home_view_model.dart';
import 'package:get/get.dart';

import '../core/veiw_model/cart_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
  }
}
