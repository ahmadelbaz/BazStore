import 'package:baz_store_new/constants.dart';
import 'package:baz_store_new/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);

  List<String> names = [
    'Ahmad',
    'Ahmad',
    'Ahmad',
    'Ahmad',
    'Ahmad',
  ];

  List<String> images = [
    'assets/images/icons/watch.png',
    'assets/images/icons/watch.png',
    'assets/images/icons/watch.png',
    'assets/images/icons/watch.png',
    'assets/images/icons/watch.png',
  ];

  List<int> prices = [100, 200, 300, 400, 500];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 140,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 140,
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(names[index], 18),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                '\$ ${prices[index].toString()}',
                                14,
                                color: primaryColor,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 40,
                                width: 140,
                                color: Colors.grey.shade200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    CustomText(
                                      '1',
                                      20,
                                      alignment: Alignment.center,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Icon(
                                        Icons.minimize,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: names.length,
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
                  children: const [
                    CustomText(
                      'TOTAL',
                      22,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      '\$ 2000',
                      18,
                      color: primaryColor,
                    )
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
          )
        ],
      ),
    );
  }
}
