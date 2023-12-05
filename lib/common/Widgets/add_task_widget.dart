import 'package:codsoft_to_do_app/Pages/Main_Screen/controller_main.dart';
import 'package:codsoft_to_do_app/common/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum type { home, study, work, habit }

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  Color? color0fWidget;
  type? _type;
  ControllerMain ctr = Get.put(ControllerMain());

  Widget _typeOfTask(type type, String txt, Color color, Color color2) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: RadioListTile(
          contentPadding: EdgeInsets.zero,
          value: type,
          groupValue: _type,
          onChanged: (value) => setState(() {
            _type = value;
            color0fWidget = color2;
          }),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(txt),
          tileColor: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: const Center(child: Text("ADD TASK")),
        actions: [
          Form(
            child: Column(
              children: [
                Widgets.use.textField("Title", ctr.title!, 60),
                Widgets.use.textField("Description", ctr.description!, null),
                Column(
                  children: [
                    Row(
                      children: [
                        _typeOfTask(
                            type.home,
                            "Home",
                            const Color.fromRGBO(241, 103, 54, 0.6),
                            const Color.fromRGBO(241, 103, 54, 1)),
                        _typeOfTask(
                            type.study,
                            "Study",
                            const Color.fromRGBO(249, 83, 121, 0.6),
                            const Color.fromRGBO(249, 83, 121, 1)),
                      ],
                    ),
                    Row(
                      children: [
                        _typeOfTask(
                            type.work,
                            "Work",
                            const Color.fromRGBO(15, 181, 170, 0.6) ,
                            const Color.fromRGBO(15, 181, 170, 1) ),
                        _typeOfTask(
                            type.habit,
                            "Habit",
                            const Color.fromRGBO(127, 111, 243, 0.6),
                            const Color.fromRGBO(127, 111, 243, 1)),
                      ],
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    try {
                      ctr.addTask(context, color0fWidget!.value);
                      ctr.title!.clear();
                      ctr.description!.clear();
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: (_) => const AlertDialog(
                            title: Center(child: Text("Select a Category!",style: TextStyle(color: Colors.red),)),
                          ));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      return Colors.amberAccent;
                    }),
                    elevation: MaterialStateProperty.all(2),
                    foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        return Colors.white;
                      },
                    ),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 100)),
                  ),
                  child: const Text("ADD"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
