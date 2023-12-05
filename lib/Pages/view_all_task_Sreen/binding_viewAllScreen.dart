import 'package:codsoft_to_do_app/Pages/view_all_task_Sreen/controller_viewAllScreen.dart';
import 'package:get/get.dart';

class BindingViewAllScreem implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ControllerViewAllScreen>(() => ControllerViewAllScreen());

  }

}