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

  // Add a variable to store the reminder value
  RxString reminder = ''.obs;

  @override
  void onInit() {
    loadPreferences();
    super.onInit();
  }

  void colorChange(int index) {
    isTabTapped[index] = !isTabTapped[index];
  }

  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    count.value = prefs.getInt('value') ?? 0;
    final savedColorIndex = prefs.getInt('colorIndex') ?? 0;
    currentColorIndex.value = savedColorIndex;
    containerColor.value = _colorOptions[savedColorIndex];
    // Load the reminder value
    reminder.value = prefs.getString('reminder') ?? '';
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
    currentColorIndex.value =
        ((currentColorIndex.value + 1) % _colorOptions.length);
    containerColor.value = _colorOptions[currentColorIndex.value];
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('colorIndex', currentColorIndex.value);
  }

  // Add a method to save the reminder value
  Future<void> saveReminder(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('reminder', value);
    reminder.value = value;
  }
}
