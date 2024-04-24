import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenController extends GetxController {
  var count = 0.obs;
  final List<Color> _colorOptions = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ].obs;
  Rx<Color> containerColor = Color.fromARGB(255, 25, 30, 34).obs;

  RxInt currentColorIndex = 0.obs;
  List<bool> isTabTapped = [false, false, false, false].obs;

  void colorChange(int index) {
    isTabTapped[index] = !isTabTapped[index];
    //print("color is ${isTabTapped[index]}");
  }

  void loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    count.value = prefs.getInt('value') ?? 0;
    final savedColorIndex = prefs.getInt('colorIndex') ?? 0;
    currentColorIndex.value = savedColorIndex;
    containerColor.value = _colorOptions[savedColorIndex];
  }

  void incrementCounter() async {
    count++;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("value", count.toInt());
  }

  void resetCounter() {
    count.value = 0;
  }

  void removeOneCount() {
    if (count.value > 0) {
      count--;
    }
  }

  void colorChangeBackground() async {
    // Increment the current color index
    currentColorIndex.value =
        ((currentColorIndex.value + 1) % _colorOptions.length);
    // Set the container color to the next color in the list
    containerColor.value = _colorOptions[currentColorIndex.value];
    // Save the selected color index to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('colorIndex', currentColorIndex.value);
  }
}
