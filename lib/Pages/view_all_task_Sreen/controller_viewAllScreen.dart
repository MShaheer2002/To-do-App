import 'package:codsoft_to_do_app/Pages/Main_Screen/controller_main.dart';
import 'package:codsoft_to_do_app/common/helper/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/entities/task.dart';
import 'index_viewAllScreen.dart';

class ControllerViewAllScreen extends GetxController {
  ControllerViewAllScreen();

  final state = stateViewAllScreen();
  final Rx<List<task>> _CompletedItems = Rx<List<task>>([]);

  ControllerMain ctrMain = Get.put(ControllerMain());

  void onInit() {
    super.onInit();
    fetchData();
  }

  List<task> get completedItems {
    return [..._CompletedItems.value];
  }

  void onCompleted(BuildContext context, String id) {
    final data = ctrMain.items.firstWhere((element) => element.id == id);
    _CompletedItems.value.add(data);

    DBhelper.onInsert('Completed', {
      "id": data.id,
      "title": data.title,
      "description": data.description,
      "Color": data.color,
    });
    Navigator.of(context).pop();
  }

  Future<void> fetchData() async {
    final dataList = await DBhelper.getData('Completed');
    _CompletedItems.value = dataList
        .map((e) => task(
              e["id"],
              e["title"],
              e["description"],
              e["Color"],
            ))
        .toList();
  }

  void onDeleted(String id) {
    _CompletedItems.value.removeWhere((element) => element.id == id);
    DBhelper.onDelete('Completed', id);
    _CompletedItems.refresh();
  }
}
