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
                          image: AssetImage('assets/images/icons/empty.jpg'),
                        ),
                        CustomText('Empty Cart', 28)
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
                                background: Container(color: Colors.red),
                                child: SizedBox(
                                  height: 140,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 140,
                                        child: Image.network(
                                          controller
                                              .cartProductModel[index].image,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 24),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                                controller
                                                    .cartProductModel[index]
                                                    .name,
                                                18),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomText(
                                              '\$ ${controller.cartProductModel[index].price.toString()}',
                                              14,
                                              color: primaryColor,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 40,
                                              width: 160,
                                              color: Colors.grey.shade200,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .increaseProduct(
                                                              index);
                                                    },
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
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
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 20),
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
                              return const SizedBox(
                                height: 15,
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
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
                              padding: const EdgeInsets.all(20),
                              height: 100,
                              width: 180,
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
        });
  }
}
