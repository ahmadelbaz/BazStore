import 'package:baz_store_new/model/product_model.dart';
import 'package:baz_store_new/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DetailsView extends StatelessWidget {
  ProductModel model;

  DetailsView({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: _size.width,
            height: _size.height * 0.4,
            child: Image.network(
              model.image,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: _size.height * 0.03,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    CustomText(
                      model.name,
                      26,
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      height: _size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: _size.width * 0.4,
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
                          padding: const EdgeInsets.all(16),
                          width: _size.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CustomText('Color', 16),
                              Container(
                                width: 30,
                                height: 20,
                                padding: const EdgeInsets.all(12),
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
                      height: _size.height * 0.02,
                    ),
                    const CustomText(
                      'Details',
                      18,
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      height: _size.height * 0.02,
                    ),
                    CustomText(
                      model.description,
                      14,
                      alignment: Alignment.centerLeft,
                      height: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
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
                Container(
                  padding: const EdgeInsets.all(16),
                  width: _size.width * 0.4,
                  height: _size.height * 0.1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Add'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
