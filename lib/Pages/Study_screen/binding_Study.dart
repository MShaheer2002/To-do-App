import 'package:get/get.dart';

import 'controller_Study.dart';

class StudyBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<StudyController>(StudyController());
  }

}