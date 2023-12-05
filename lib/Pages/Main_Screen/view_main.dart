import 'package:codsoft_to_do_app/Pages/Main_Screen/controller_main.dart';
import 'package:codsoft_to_do_app/common/Widgets/add_task_widget.dart';
import 'package:codsoft_to_do_app/common/routes/route_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/Widgets/widgets.dart';

class MainScreeen extends GetView<ControllerMain> {
  const MainScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerMain controller = Get.put(ControllerMain());

    final DateTime now = DateTime.now();
    final DateFormat format = DateFormat('yyyy-MM-dd');
    final String formatted = format.format(now);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    height: 40.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 1),
                              blurRadius: 2,
                              spreadRadius: 1,
                              color: Colors.grey.withOpacity(0.3))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24.r),
                            bottomRight: Radius.circular(24.r))),
                    child: Center(
                      child: Text(formatted,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.HOME),
                    child: Widgets.use.buildCategoryWidget(
                      Widgets.use.buildCategoryContainer(
                          const Color.fromRGBO(241, 103, 54, 1),
                          const Color.fromRGBO(241, 103, 54, 0.6),
                          "Home",
                          Icons.home),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.STUDY),
                        child: Widgets.use.buildCategoryContainer(
                            const Color.fromRGBO(249, 83, 121, 1),
                            const Color.fromRGBO(249, 83, 121, 0.6),
                            "Study",
                            Icons.school),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.WORK),
                    child: Widgets.use.buildCategoryWidget(
                        Widgets.use.buildCategoryContainer(
                            const Color.fromRGBO(15, 181, 170, 1),
                            const Color.fromRGBO(15, 181, 170, 0.6),
                            "Work",
                            Icons.work),
                        GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.HIBITS),
                          child: Widgets.use.buildCategoryContainer(
                              const Color.fromRGBO(127, 111, 243, 1),
                              const Color.fromRGBO(127, 111, 243, 0.6),
                              "Habits",
                              Icons.accessibility_new_outlined),
                        )),
                  ),
                  Column(
                    children: [
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tasks",
                                  style: GoogleFonts.lusitana(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w700)),
                              GestureDetector(
                                  child: Text(
                                    "Completed task",
                                    style: GoogleFonts.actor(
                                        color: Colors.blueAccent,
                                        fontSize: 14.sp),
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.VIEWALLTASK);
                                  }),
                            ]),
                      ),
                      const Divider(),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "To DO Tasks",
                                style: GoogleFonts.lusitana(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400),
                              ))),
                      Obx(
                        () => (controller.items.isNotEmpty)
                            ? ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => Widgets.use
                                    .TaskWidget(
                                        controller.items[index].color,
                                        controller.items[index].title,
                                        controller.items[index].description,
                                        controller.items[index].id,
                                        context,
                                        0),
                                itemCount: controller.items.length,
                              )
                            : const Center(child: Text("NO Task added today")),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          physics: const BouncingScrollPhysics(),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () =>
            showDialog(context: context, builder: (ctx) => const AddTask()),
        child: Container(
          height: 40.h,
          width: 80.w,
          decoration: const BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              )),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
