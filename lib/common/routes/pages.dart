import 'package:codsoft_to_do_app/Pages/Habibts_screen/index_Habits.dart';
import 'package:codsoft_to_do_app/Pages/Home_screen/index_Home.dart';
import 'package:codsoft_to_do_app/Pages/Main_Screen/index_main.dart';
import 'package:codsoft_to_do_app/Pages/Splash_Screen/index_splash.dart';
import 'package:codsoft_to_do_app/Pages/Study_screen/index_Study.dart';
import 'package:codsoft_to_do_app/Pages/Work_Screen/index_Work.dart';
import 'package:codsoft_to_do_app/Pages/view_all_task_Sreen/binding_viewAllScreen.dart';
import 'package:codsoft_to_do_app/Pages/view_all_task_Sreen/view_viewAllScreen.dart';
import 'package:codsoft_to_do_app/common/routes/route_index.dart';
import 'package:get/get.dart';

class Apppages {
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashViewScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.MAIN,
      page: () => const MainScreeen(),
      binding: BindingMain(),
    ),
    GetPage(
      name: AppRoutes.VIEWALLTASK,
      page: () => const ViewAllScreen(),
      binding: BindingViewAllScreem(),
    ),
    GetPage(
      name: AppRoutes.STUDY,
      page: () => StudyViewScreen(),
      binding: StudyBinding(),
    ),
    GetPage(
      name: AppRoutes.HIBITS,
      page: () => HabitsViewScreen(),
      binding: HabitsBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeViewScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.WORK,
      page: () => WorkViewScreen(),
      binding: WorkBinding(),
    ),
  ];
}
