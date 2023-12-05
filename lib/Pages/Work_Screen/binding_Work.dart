import 'package:get/get.dart';

import 'controller_Work.dart';

class WorkBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<WorkController>(WorkController());
  }

}