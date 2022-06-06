import 'package:baz_store_new/helper/extension.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String productid = '',
      name = '',
      image = '',
      description = '',
      sized = '',
      price = '';
  Color color = Colors.white;

  ProductModel(
      {this.name = '',
      this.image = '',
      this.description = '',
      this.color = Colors.white,
      this.sized = '',
      this.price = '',
      this.productid = ''});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
    productid = map['productid'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
      'productid': productid,
    };
  }
}
