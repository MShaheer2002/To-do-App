import 'index_main.dart';
import 'package:get/get.dart';

class BindingMain implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ControllerMain>(ControllerMain());
  }

}