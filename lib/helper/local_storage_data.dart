import 'dart:convert';

import 'package:baz_store_new/constants.dart';
import 'package:baz_store_new/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {
  Future<UserModel> get getUSer async {
    try {
      UserModel userModel = await _getUser();
      return userModel;
    } catch (e) {
      print(e.toString());
      throw Exception;
    }
  }

  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(cashedUserData)!.isEmpty) {
      return;
    }
    var value = prefs.getString(cashedUserData);
    return UserModel.fromJson(json.decode(value!));
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(cashedUserData, json.encode(userModel.toJson()));
  }

  deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
