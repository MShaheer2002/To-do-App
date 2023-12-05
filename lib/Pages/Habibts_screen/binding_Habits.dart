import 'package:get/get.dart';

import 'controller_Habits.dart';

class HabitsBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<HabitsController>(HabitsController());
  }

}