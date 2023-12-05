import 'package:codsoft_to_do_app/Pages/Home_screen/states_Home.dart';
import 'package:get/get.dart';

import '../../common/entities/task.dart';
import '../../common/helper/db_helper.dart';

class HomeController extends GetxController{
  HomeController();
  final state = HomeState();
  final Rx<List<task>> _HomeItems = Rx<List<task>>([]);

  @override
  void onInit(){
    super.onInit();
    fetchData();
  }

  List<task> get HomeItems {
    return [..._HomeItems.value];
  }

  Future<void> fetchData() async {
    // Home = 4294010678
    // Study = 4294529913
    //Work = 4279219626
    //Habit = 4286541811
    final dataList = await DBhelper.getSpecifiedData(4294010678);
    _HomeItems.value = dataList.map((e) => task(
      e["id"],
      e["title"],
      e["description"],
      e["Color"],
    )).toList();
  }



}