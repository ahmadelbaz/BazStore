import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool?> hasDismissed(BuildContext context, String name) async {
  bool? _returnValue = false;
  await Get.dialog(
    AlertDialog(
      title: const Text('Are you sure?'),
      content: Text('$name will be deleted from your cart.'),
      actions: [
        TextButton(
          onPressed: () {
            _returnValue = false;
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            _returnValue = true;
            Navigator.of(context).pop();
          },
          child: const Text('Ok'),
        ),
      ],
    ),
    barrierDismissible: false,
  );
  return _returnValue;
}
