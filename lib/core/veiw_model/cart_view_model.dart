import 'package:baz_store_new/core/services/database/dart_database_helper.dart';
import 'package:baz_store_new/model/cart_product_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  var dbHelper = CartDatabaseHelper.db;

  CartViewModel() {
    getAllProducts();
  }

  getAllProducts() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.getAllProducts();
    _loading.value = true;
    getTotalPrice();
    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    if (_cartProductModel.isEmpty) {
      var dbHelper = CartDatabaseHelper.db;
      await dbHelper.insert(cartProductModel);
      _cartProductModel.add(cartProductModel);
    } else {
      for (int n = 0; n < _cartProductModel.length; n++) {
        if (_cartProductModel[n].productid == cartProductModel.productid) {
          return;
        } else {}
      }
      var dbHelper = CartDatabaseHelper.db;
      await dbHelper.insert(cartProductModel);
      _cartProductModel.add(cartProductModel);
    }
    _totalPrice +=
        double.parse(cartProductModel.price) * cartProductModel.quantity;
    update();
  }

  deleteProduct(int index) {
    _totalPrice -= double.parse(_cartProductModel[index].price) *
        _cartProductModel[index].quantity;
    dbHelper.delete(_cartProductModel[index]);
    Get.snackbar('Item deleted',
        '${_cartProductModel[index].name} deleted from your cart.');
    update();
    _cartProductModel.removeAt(index);
  }

  getTotalPrice() {
    for (int n = 0; n < _cartProductModel.length; n++) {
      _totalPrice += double.parse(_cartProductModel[n].price) *
          _cartProductModel[n].quantity;
      update();
    }
  }

  increaseProduct(int index) {
    _cartProductModel[index].quantity++;
    _totalPrice += double.parse(_cartProductModel[index].price);
    dbHelper.update(_cartProductModel[index]);
    update();
  }

  decreaseProduct(int index) {
    if (_cartProductModel[index].quantity == 1) {
      deleteProduct(index);
    } else {
      _cartProductModel[index].quantity--;
      _totalPrice -= double.parse(_cartProductModel[index].price);
      dbHelper.update(_cartProductModel[index]);
    }
    update();
  }
}
