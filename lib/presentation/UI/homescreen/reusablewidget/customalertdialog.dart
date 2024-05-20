// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasbihapp/core/getx/homescreenget.dart';

void showResetConfirmationDialog(
  BuildContext context,
  String title,
  String content,
  Function()? onConfirm,
) {
  final HomeScreenController controller = Get.put(HomeScreenController());
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          height: 300, // Adjust height as needed
          width: double.infinity, // Adjust width as needed
          child: AlertDialog(
            title: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'No',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  onConfirm?.call();
                },
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.green),
                ),
                style: ElevatedButton.styleFrom(
                //  primary: Colors.transparent,
                  elevation: 0,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
