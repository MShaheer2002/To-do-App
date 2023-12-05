import 'package:codsoft_to_do_app/Pages/Work_Screen/controller_Work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/Widgets/widgets.dart';

class WorkViewScreen extends GetView<WorkController> {
  const WorkViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      child: Text("Work Task",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Obx(
                        () => (controller.WorkItems.isNotEmpty)
                        ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Widgets.use
                          .TaskWidget(
                          controller.WorkItems[index].color,
                          controller.WorkItems[index].title,
                          controller.WorkItems[index].description,
                          controller.WorkItems[index].id,
                          context,1),
                      itemCount: controller.WorkItems.length,
                    )
                        : Container(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
