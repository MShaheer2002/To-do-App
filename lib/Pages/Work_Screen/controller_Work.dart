import 'package:codsoft_to_do_app/Pages/Work_Screen/states_Work.dart';
import 'package:get/get.dart';

import '../../common/entities/task.dart';
import '../../common/helper/db_helper.dart';

class WorkController extends GetxController{
  WorkController();
  final state = WorkState();
  final Rx<List<task>> _WorkItems = Rx<List<task>>([]);

  @override
  void onInit(){
    super.onInit();
    fetchData();
  }

  List<task> get WorkItems {
    return [..._WorkItems.value];
  }

  Future<void> fetchData() async {
    // Home = 4294010678
    // Study = 4294529913
    //Work = 4279219626
    //Habit = 4286541811
    final dataList = await DBhelper.getSpecifiedData(4279219626);
    _WorkItems.value = dataList.map((e) => task(
      e["id"],
      e["title"],
      e["description"],
      e["Color"],
    )).toList();
  }



}