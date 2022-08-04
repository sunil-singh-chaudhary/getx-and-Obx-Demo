import 'package:get/get.dart';

class data_controller extends GetxController {
  var increment = 0.obs;

  void getincreementValue() {
    increment.value = increment.value + 1;
  }
}
