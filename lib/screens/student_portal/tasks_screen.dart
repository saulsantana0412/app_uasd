import 'package:flutter/material.dart';
import 'package:uasd_app/components/cards/task_card.dart';
import 'package:uasd_app/components/others/custom_circular_progress.dart';
import 'package:uasd_app/models/task.dart';
import 'package:uasd_app/services/academic_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class TasksScreen extends StatefulWidget {

  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  List<Task> _tasks = [];
  bool loading = true;

  Future <void> fetchTasks() async{
    final data = await AcademicService.fetchTasks();
    if(data != null && mounted){
      _tasks = data;
      setState(() {
        loading = false;
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

    return Container(
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mis Tareas", style: textTheme.titleMedium,),
            const SizedBox(height: 10,),
            if(loading) const CustomCircularProgress(),
            if (!loading && _tasks.isEmpty)
            Text("Aun no tareas que mostrar.", style: Theme.of(context).textTheme.bodyMedium),
            if (!loading && _tasks.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TaskCard(task: _tasks[index]),
                      const SizedBox(height: 20,)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}