import 'package:baz_store_new/core/veiw_model/cart_view_model.dart';
import 'package:baz_store_new/model/cart_product_model.dart';
import 'package:baz_store_new/model/product_model.dart';
import 'package:baz_store_new/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class DetailsView extends StatelessWidget {
  ProductModel model;

  DetailsView({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: deviceSize.width,
            height: deviceSize.height * 0.4,
            child: Image.network(
              model.image,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: deviceSize.height * 0.03,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: deviceSize.width * .044,
                    vertical: deviceSize.height * .02),
                child: Column(
                  children: [
                    CustomText(
                      model.name,
                      26,
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      height: deviceSize.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: deviceSize.width * .044,
                              vertical: deviceSize.height * .02),
                          width: deviceSize.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CustomText('Size', 16),
                              CustomText(model.sized, 16),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: deviceSize.width * .044,
                              vertical: deviceSize.height * .02),
                          width: deviceSize.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CustomText('Color', 16),
                              Container(
                                width: deviceSize.width * 0.083,
                                height: deviceSize.height * 0.025,
                                padding: EdgeInsets.symmetric(
                                    horizontal: deviceSize.width * .033,
                                    vertical: deviceSize.height * .015),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15),
                                    color: model.color),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: deviceSize.height * 0.02,
                    ),
                    const CustomText(
                      'Details',
                      18,
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      height: deviceSize.height * 0.02,
                    ),
                    CustomText(
                      model.description,
                      14,
                      alignment: Alignment.centerLeft,
                      height: deviceSize.height * 0.0025,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: deviceSize.width * .055,
                vertical: deviceSize.height * .025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const CustomText(
                      "PRICE ",
                      18,
                      color: Colors.grey,
                    ),
                    CustomText(
                      ' \$' + model.price,
                      14,
                      color: primaryColor,
                    ),
                  ],
                ),
                GetBuilder<CartViewModel>(
                  init: Get.find<CartViewModel>(),
                  builder: (controller) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceSize.width * .044,
                          vertical: deviceSize.height * .02),
                      width: deviceSize.width * 0.4,
                      height: deviceSize.height * 0.1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          controller.addProduct(
                            CartProductModel(
                              name: model.name,
                              image: model.image,
                              price: model.price,
                              quantity: 1,
                              productid: model.productid,
                            ),
                          );
                        },
                        child: const Text('Add'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
