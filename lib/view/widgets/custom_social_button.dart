import 'package:baz_store_new/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;

  CustomSocialButton(this.imagePath, this.text, this.onPressed);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(size.height * 0.07),
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
              padding: EdgeInsets.only(left: size.height * 0.01),
              child: Image(
                image: AssetImage(imagePath),
              ),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            CustomText(text, size.height * 0.018),
          ],
        ),
      ),
    );
  }
}
