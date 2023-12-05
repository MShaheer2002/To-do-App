import 'dart:ui';

import 'package:codsoft_to_do_app/Pages/Study_screen/states_Study.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../common/entities/task.dart';
import '../../common/helper/db_helper.dart';

class StudyController extends GetxController{
  StudyController();
  final state = StudyState();

  final Rx<List<task>> _StudyItems = Rx<List<task>>([]);

  @override
  void onInit(){
    super.onInit();
    fetchData();
  }

  List<task> get studyItems {
    return [..._StudyItems.value];
}

  Future<void> fetchData() async {
    // Home = 4294010678
    // Study = 4294529913
    //Work = 4279219626
    //Habit = 4286541811
    final dataList = await DBhelper.getSpecifiedData(4294529913);
     _StudyItems.value = dataList.map((e) => task(
      e["id"],
      e["title"],
      e["description"],
      e["Color"],
    )).toList();
  }
}