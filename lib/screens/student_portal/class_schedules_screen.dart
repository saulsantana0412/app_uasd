import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uasd_app/components/others/custom_circular_progress.dart';
import 'package:uasd_app/services/schedule_service.dart';
import 'package:uasd_app/utils/app_colors.dart';

class ClassSchedulesScreen extends StatefulWidget {
  const ClassSchedulesScreen({super.key});

  @override
  State<ClassSchedulesScreen> createState() => _ClassSchedulesScreenState();
}

class _ClassSchedulesScreenState extends State<ClassSchedulesScreen> {

  List<dynamic> _schedule = [];
  bool _loading = true;

  Future <void> fetchNews() async{
    final data = await ScheduleService.fetchSchedules();
    if(data != null){
      _schedule = data;
      setState(() {
        if(mounted){
          _loading = false;
        }
      });
    }else{
      Timer(const Duration(seconds: 2), (){
        setState(() {
          if(mounted){
            _loading = false;
          }
        });
      });
    }
    
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Horarios", style: textTheme.titleMedium,),
            if(_loading) 
            const CustomCircularProgress(),
            if(!_loading) 
            Text("Aún no tienes horarios confirmados.", style: textTheme.bodyMedium,),
            if(!_loading && _schedule.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _schedule.length,
                itemBuilder: (context, index) {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(_schedule[index]),
                      SizedBox(height: 20,)
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