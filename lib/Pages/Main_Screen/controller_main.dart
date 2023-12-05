import 'dart:ui';

import 'package:codsoft_to_do_app/common/helper/db_helper.dart';
import 'package:flutter/material.dart';

import '../../common/entities/task.dart';
import 'index_main.dart';
import 'package:get/get.dart';

class ControllerMain extends GetxController {
  final Rx<List<task>> _items = Rx<List<task>>([]);


  final state = StateMain();

  TextEditingController? title;
  TextEditingController? description;

  @override
  void onInit() {
    super.onInit();
    fetchData();
    title = TextEditingController();
    description = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    title!.dispose();
    description!.dispose();
  }

  List<task> get items {
    return [..._items.value];
  }


  void addTask(BuildContext context, int color) {
    String titlo = title!.text;
    String descriptioe = description!.text;
    DateTime id = DateTime.now();

    final data = task(id.toString(), titlo, descriptioe, color);
    _items.value.add(data);
    _items.refresh();
    DBhelper.onInsert('task', {
      "id": data.id,
      "title": data.title,
      "description": data.description,
      "Color": color,
    }).obs;

    Navigator.of(context).pop();
  }

  void removeTask(String id) {
    _items.value.removeWhere((element) => element.id == id);
    DBhelper.onDelete('task', id);
    _items.refresh();
  }

  void SelectSpecific(Color color) {
    _items.value.any((element) => element.color == color);
  }

  Future<void> fetchData() async {
    final dataList = await DBhelper.getData('task');
    _items.value = dataList
        .map((e) => task(
              e["id"],
              e["title"],
              e["description"],
              e["Color"],
            ))
        .toList();

  }
  void CompletedTask(String id) {
    _items.value.removeWhere((element) => element.id == id);
    // DBhelper.onDelete('task', id);
    _items.refresh();
  }

}
