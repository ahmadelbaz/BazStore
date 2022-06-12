import 'package:baz_store_new/constants.dart';
import 'package:baz_store_new/core/veiw_model/cart_view_model.dart';
import 'package:baz_store_new/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/dismiss_dialog.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.find<CartViewModel>(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: controller.cartProductModel.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('assets/images/icons/cart.png'),
                      ),
                      CustomText('Empty Cart', 16)
                    ],
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            final item =
                                controller.cartProductModel[index].name;
                            return Dismissible(
                              key: Key(item),
                              confirmDismiss: (direction) async {
                                return await hasDismissed(context,
                                    controller.cartProductModel[index].name);
                              },
                              onDismissed: (direction) {
                                controller.deleteProduct(index);
                              },
                              background: Container(
                                color: Colors.red,
                                child: const Icon(Icons.cancel),
                              ),
                              child: SizedBox(
                                height: deviceSize.height * 0.175,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: deviceSize.width * 0.39,
                                      child: Image.network(
                                        controller
                                            .cartProductModel[index].image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: deviceSize.width * 0.067),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              controller
                                                  .cartProductModel[index].name,
                                              18),
                                          SizedBox(
                                            height: deviceSize.height * 0.0125,
                                          ),
                                          CustomText(
                                            '\$ ${controller.cartProductModel[index].price.toString()}',
                                            14,
                                            color: primaryColor,
                                          ),
                                          SizedBox(
                                            height: deviceSize.height * 0.025,
                                          ),
                                          Container(
                                            height: deviceSize.height * 0.05,
                                            width: deviceSize.width * 0.44,
                                            color: Colors.grey.shade200,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    controller
                                                        .increaseProduct(index);
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      deviceSize.width * 0.056,
                                                ),
                                                CustomText(
                                                  controller
                                                      .cartProductModel[index]
                                                      .quantity
                                                      .toString(),
                                                  20,
                                                  alignment: Alignment.center,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  width:
                                                      deviceSize.width * 0.056,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          deviceSize.height *
                                                              0.025),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .decreaseProduct(
                                                              index);
                                                    },
                                                    child: const Icon(
                                                      Icons.minimize,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: controller.cartProductModel.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: deviceSize.height * 0.019,
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: deviceSize.width * 0.083,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const CustomText(
                                'TOTAL',
                                22,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GetBuilder<CartViewModel>(
                                init: Get.find<CartViewModel>(),
                                builder: (controller) {
                                  return CustomText(
                                    '\$ ${controller.totalPrice}',
                                    18,
                                    color: primaryColor,
                                  );
                                },
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: deviceSize.width * 0.056,
                                vertical: deviceSize.height * 0.025),
                            height: deviceSize.height * 0.125,
                            width: deviceSize.width * 0.5,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text('CHECKOUT'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
