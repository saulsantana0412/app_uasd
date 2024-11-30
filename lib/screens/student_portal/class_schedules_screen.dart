import 'package:flutter/material.dart';
import 'package:uasd_app/components/menu/student_portal_menu.dart';
import 'package:uasd_app/services/schedule_service.dart';

class ClassSchedulesScreen extends StatefulWidget {
  const ClassSchedulesScreen({super.key});

  @override
  State<ClassSchedulesScreen> createState() => _ClassSchedulesScreenState();
}

class _ClassSchedulesScreenState extends State<ClassSchedulesScreen> {

  List<dynamic> _schedule = [];

  Future <void> fetchNews() async{
    final data = await ScheduleService.fetchSchedules();
    if(data != null){
      _schedule = data;
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Horario"),
      ),
      drawer: const StudentPortalMenu(currentScreen: "ClassSchedulesScreen",),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Horarios", style: textTheme.headlineMedium,),
            Expanded(
              child: ListView.builder(
                itemCount: _schedule.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_schedule[index]),
                      SizedBox(height: 20,)
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