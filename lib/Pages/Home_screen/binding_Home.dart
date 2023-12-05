import 'package:get/get.dart';
import 'controller_Home.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<HomeController>(HomeController());
  }

}