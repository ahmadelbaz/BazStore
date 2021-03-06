import 'package:baz_store_new/view/cart_view.dart';
import 'package:baz_store_new/view/home_view.dart';
import 'package:baz_store_new/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget _currentScreen = HomeView();

  get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;

    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }
      case 1:
        {
          _currentScreen = const CartView();
          break;
        }
      case 2:
        {
          _currentScreen = const ProfileView();
          break;
        }
    }
    update();
  }
}
