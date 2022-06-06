class CartProductModel {
  String productid = '', name = '', image = '', price = '';
  int quantity = 0;

  CartProductModel({
    this.name = '',
    this.image = '',
    this.quantity = 0,
    this.price = '',
    this.productid = '',
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
    productid = map['productid'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'productid': productid,
    };
  }
}
