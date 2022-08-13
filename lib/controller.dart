import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class countController extends GetxController {
  int count = 0.obs();
  incrementCounter() async {
    count++;
    update();
  }

  decrementCounter() async {
    if (count <= 0) {
      count = 0;
    } else {
      count--;
    }
    update();
  }
}
