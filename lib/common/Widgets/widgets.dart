import 'package:codsoft_to_do_app/Pages/Main_Screen/controller_main.dart';
import 'package:codsoft_to_do_app/Pages/view_all_task_Sreen/controller_viewAllScreen.dart';
import 'package:codsoft_to_do_app/common/Widgets/description_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Widgets {
  static final use = Widgets();
  ControllerMain ctrMain = Get.put(ControllerMain());
  ControllerViewAllScreen ctrViewAll = Get.put(ControllerViewAllScreen());

  Widget TaskWidget(int color, String title, String description, String id,
      BuildContext context, int flag) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 12.w,
            height: 100.h,
            decoration: BoxDecoration(
                color: Color(color),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
          ),
          Container(
            width: 300.w,
            height: 100.h,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  topRight: Radius.circular(12)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 2,
                    spreadRadius: 1,
                    color: Colors.grey.withOpacity(0.3))
              ],
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(title,
                            overflow: TextOverflow.clip,
                            softWrap: true,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600, fontSize: 16.sp)),
                      ),
                      // Image.asset(
                      //   "assets/images/edit.png",
                      //   height: 20.h,
                      //   width: 20.w,
                      // ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => showDialog(
                        context: context,
                        builder: (_) =>
                            DescriptionWidget(Description: description)),
                    child: Row(
                      children: [
                        Text("Description...  ",
                            style: GoogleFonts.inter(
                                fontSize: 13.sp, fontWeight: FontWeight.w400)),
                        Image.asset(
                          "assets/images/description.png",
                          height: 15.h,
                          width: 15.w,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: flag == 0
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.center,
                    children: [
                      //Completed
                      flag == 0
                          ? GestureDetector(
                              onTap: () => showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        contentPadding:
                                            const EdgeInsets.all(20),
                                        actionsPadding:
                                            const EdgeInsets.all(20),
                                        title: const Center(
                                            child: Text(
                                                "Is this task Completed?")),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                ctrViewAll.onCompleted(
                                                    context, id);
                                                ctrMain.removeTask(id);
                                                
                                              },
                                              child: const Text("Yes")),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("No")),
                                        ],
                                      )),
                              child: Container(
                                  margin: const EdgeInsets.only(right: 2),
                                  width: 100.w,
                                  height: 24.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffa8d5ff),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                      child: Text('Completed',
                                          style: GoogleFonts.inter(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            height: 1,
                                            color: const Color(0xff168cf9),
                                          )))),
                            )
                          : Container(),

                      //Delete
                      GestureDetector(
                        onTap: () => showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            contentPadding: const EdgeInsets.all(20),
                            actionsPadding: const EdgeInsets.all(20),
                            title: const Center(
                                child:
                                    Text("Are you sure you want to delete?")),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    flag == 0
                                        ? ctrMain.removeTask(id)
                                        : ctrViewAll.onDeleted(id);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Yes")),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("No")),
                            ],
                          ),
                        ),
                        child: Container(
                            margin: const EdgeInsets.only(left: 2),
                            width: 70,
                            height: 24,
                            decoration: BoxDecoration(
                              color: const Color(0xfffaa9a9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                                child: Text('Delete',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2125,
                                      color: const Color(0xfff93c3c),
                                    )))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryContainer(
      Color color1, Color color2, String txt, IconData icon) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: LinearGradient(
              colors: [color1, color2],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 2,
                spreadRadius: 1,
                offset: const Offset(0, 1)),
          ]),
      height: 60.h,
      width: 160.w,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white, size: 25.sp),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    txt,
                    style: GoogleFonts.creteRound(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryWidget(Widget container, Widget container2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [container, container2],
      ),
    );
  }

  Widget textField(String txt, TextEditingController controller, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            label: Text(txt), border: const OutlineInputBorder()),
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        maxLength: value,
      ),
    );
  }
}
