
import 'package:codsoft_to_do_app/common/routes/pages.dart';
import 'package:codsoft_to_do_app/common/routes/route_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child)=> GetMaterialApp(
        // theme: ,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.SPLASH,
        getPages: Apppages.routes,
      ),
        designSize: const Size(350, 800),
    );
  }
}
