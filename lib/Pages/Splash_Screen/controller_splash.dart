

import 'package:codsoft_to_do_app/Pages/Splash_Screen/states_splash.dart';
import 'package:codsoft_to_do_app/common/routes/route_index.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  SplashController();
  final state = SplashState();
  final title = "TO DO LIST";
  
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 2400),() => Get.offAllNamed(AppRoutes.MAIN));
  }
}