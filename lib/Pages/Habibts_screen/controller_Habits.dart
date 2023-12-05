import 'package:codsoft_to_do_app/Pages/Habibts_screen/states_Habits.dart';
import 'package:get/get.dart';

import '../../common/entities/task.dart';
import '../../common/helper/db_helper.dart';

class HabitsController extends GetxController{
  HabitsController();
  final state = HabitsState();
  final Rx<List<task>> _HabitsItems = Rx<List<task>>([]);

  @override
  void onInit(){
    super.onInit();
    fetchData();
  }

  List<task> get HabitsItems {
    return [..._HabitsItems.value];
  }

  Future<void> fetchData() async {
    // Home = 4294010678
    // Study = 4294529913
    //Work = 4279219626
    //Habit = 4286541811
    final dataList = await DBhelper.getSpecifiedData(4286541811);
    _HabitsItems.value = dataList.map((e) => task(
      e["id"],
      e["title"],
      e["description"],
      e["Color"],
    )).toList();
  }



}