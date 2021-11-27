import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: Column(
        children: [
          const Image(image: AssetImage('assets/images/icons/cart.png')),
          Text(
            'BazStore',
            style:
                TextStyle(fontFamily: 'Lobster', fontSize: size.height * 0.04),
          ),
        ],
      ),
    );
  }
}
