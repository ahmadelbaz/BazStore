import 'package:baz_store_new/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomSocialButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;

  const CustomSocialButton(this.imagePath, this.text, this.onPressed);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(deviceSize.height * 0.07),
          primary: Colors.white,
          onPrimary: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: deviceSize.height * 0.01),
              child: Image(
                image: AssetImage(imagePath),
              ),
            ),
            SizedBox(
              width: deviceSize.width * 0.03,
            ),
            CustomText(text, deviceSize.height * 0.018),
          ],
        ),
      ),
    );
  }
}
