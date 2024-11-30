import 'package:flutter/material.dart';
import 'package:uasd_app/components/buttons/custom_text_button.dart';
import 'package:uasd_app/components/buttons/custom_icon_button.dart';
import 'package:uasd_app/components/cards/text_card.dart';
import 'package:uasd_app/components/menu/student_portal_menu.dart';
import 'package:uasd_app/components/others/tag.dart';
import 'package:uasd_app/models/task.dart';
import 'package:uasd_app/services/academic_service.dart';

class TasksScreen extends StatefulWidget {

  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  List<Task> _tasks = [];

  Future <void> fetchTasks() async{
    final data = await AcademicService.fetchTasks();
    if(data != null){
      _tasks = data;
      setState(() {
        
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tareas"),
      ),
      drawer: const StudentPortalMenu(currentScreen: 'TasksScreen',),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tareas", style: textTheme.headlineMedium,),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCard(
                        title: _tasks[index].titulo,
                        subtitle: _tasks[index].descripcion,
                        tag1: Tag(text: _tasks[index].fechaVencimiento.toString().split(".")[0]),
                        topIconButton: CustomIconButton(
                          icon: Icons.check_box_outline_blank,
                          icon2: Icons.check_box_outlined,
                          state: _tasks[index].completada, 
                          onPressed: (){}),
                        bottomButton: CustomTextButton(
                          text: _tasks[index].completada ? "Ver Entrega": "Agregar Entrega",
                          onPressed: (){}, 
                        ),
                      ),
                      const SizedBox(height: 20,)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}