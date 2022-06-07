import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  // const CustomListTile({Key? key}) : super(key: key);

  String title = '';
  Function onPress;

  CustomListTile(this.title, this.onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          onPress();
        },
        child: ListTile(
          title: CustomText(
            title,
            16,
            alignment: Alignment.centerLeft,
          ),
          trailing: const Icon(
            Icons.navigate_next,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
