import 'package:baz_store_new/constants.dart';
import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: deviceSize.height * 0.01),
      child: Column(
        children: [
          const Image(image: AssetImage('assets/images/icons/cart.png')),
          Text(
            'BazStore',
            style: TextStyle(
                fontFamily: 'Lobster', fontSize: deviceSize.height * 0.04),
          ),
        ],
      ),
    );
  }
}
