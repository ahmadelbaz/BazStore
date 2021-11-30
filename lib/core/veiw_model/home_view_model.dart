import 'package:baz_store_new/core/services/home_service.dart';
import 'package:baz_store_new/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier get loading => _loading;

  final List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  HomeViewModel() {
    getCategory();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int n = 0; n < value.length; n++) {
        _categoryModel.add(CategoryModel.fromJson(value[n].data()));
        print(_categoryModel.length);
        _loading.value = false;
      }
      update();
    });
  }
}
