import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenController extends GetxController {
  var count = 0.obs;
  void loadprefrences() async {
    final prefs = await SharedPreferences.getInstance();

      count.value  = (prefs.getInt('value') ?? 0);
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
}
