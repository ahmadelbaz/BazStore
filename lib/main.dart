import 'package:baz_store_new/constants.dart';
import 'package:baz_store_new/core/veiw_model/home_view_model.dart';
import 'package:baz_store_new/helper/binding.dart';
import 'package:baz_store_new/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/veiw_model/cart_view_model.dart';
import 'core/veiw_model/control_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Binding().dependencies();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  Get.put(HomeViewModel());
  Get.put(ControlViewModel());
  // Get.find<CartViewModel>();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    deviceSize = Get.size;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
        body: ControlView(),
      ),
    );
  }
}
