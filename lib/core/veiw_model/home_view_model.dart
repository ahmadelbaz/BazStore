import 'package:baz_store_new/core/services/home_service.dart';
import 'package:baz_store_new/model/category_model.dart';
import 'package:baz_store_new/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier get loading => _loading;

  final List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  final List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
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

  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int n = 0; n < value.length; n++) {
        _productModel.add(ProductModel.fromJson(value[n].data()));
        _loading.value = false;
      }
      update();
    });
  }
}
