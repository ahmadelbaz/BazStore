import 'package:baz_store_new/core/services/database/dart_database_helper.dart';
import 'package:baz_store_new/model/cart_product_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  CartViewModel() {
    getAllProducts();
  }

  getAllProducts() async {
    _loading.value = true;
    var dbHelper = CartDatabaseHelper.db;
    _cartProductModel = await dbHelper.getAllProducts();

    _loading.value = true;
    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    var dbHelper = CartDatabaseHelper.db;

    await dbHelper.insert(cartProductModel);
    update();
  }
}
