import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  var text = "Hello world!".obs;
  var number = 0.obs;

  void increaseNumber() {
    number++;
    update();
  }
}
