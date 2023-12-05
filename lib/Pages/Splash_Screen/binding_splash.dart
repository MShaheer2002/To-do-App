

import 'package:codsoft_to_do_app/Pages/Splash_Screen/controller_splash.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    // Get.lazyPut<SplashController>(() => SplashController() );
    Get.put<SplashController>(SplashController());
  }

}