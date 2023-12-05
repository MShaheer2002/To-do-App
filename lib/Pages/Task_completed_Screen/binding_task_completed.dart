import 'index_task_completed.dart';
import 'package:get/get.dart';

class TaskCompletedMain implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
  Get.lazyPut<ControllerTaskCompleted>(() => ControllerTaskCompleted());
  }

}